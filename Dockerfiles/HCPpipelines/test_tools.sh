echo "Testing tools..." && \
fslmaths -h > /dev/null 2>&1 && echo "✓ FSL" || echo "✗ FSL" && \
recon-all -version > /dev/null 2>&1 && echo "✓ FreeSurfer" || echo "✗ FreeSurfer" && \
wb_command -version > /dev/null 2>&1 && echo "✓ Workbench" || echo "✗ Workbench" && \
python3 -c "import gradunwarp" 2>/dev/null && echo "✓ gradunwarp" || echo "✗ gradunwarp" && \
msm_hocr --help 2>&1 | grep -q "Part of FSL" && echo "✓ MSM_HOCR" || echo "✗ MSM_HOCR" && \
mrconvert -version > /dev/null 2>&1 && echo "✓ MRTrix3" || echo "✗ MRTrix3" && \
antsRegistration --version > /dev/null 2>&1 && echo "✓ ANTs" || echo "✗ ANTs" && \
c3d -version > /dev/null 2>&1 && echo "✓ c3d" || echo "✗ c3d"
