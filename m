From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 3/8] drm: rcar-du: Give a name to clu table samples
Date: Thu, 4 Apr 2019 13:15:54 +0300
Message-ID: <20190404101554.GF5800@pendragon.ideasonboard.com>
References: <1554297284-14009-1-git-send-email-VenkataRajesh.Kalakodima@in.bosch.com>
 <1554297284-14009-4-git-send-email-VenkataRajesh.Kalakodima@in.bosch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1554297284-14009-4-git-send-email-VenkataRajesh.Kalakodima@in.bosch.com>
Sender: linux-kernel-owner@vger.kernel.org
To: VenkataRajesh.Kalakodima@in.bosch.com
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, Harsha M M <harsha.manjulamallikarjun@in.bosch.com>, Eugeniu Rosca <erosca@de.adit-jv.com>
List-Id: devicetree@vger.kernel.org

Hi Kalakodima,

Thank you for the patch.

PAtches 3/8, 4/8 and 5/8 modify the new
drivers/gpu/drm/rcar-du/rcar_du_cmm.c a file that was introduced in 1/8.
Please squash them all together, there's no point in adding a driver
with known to be incorrect code to then fix it in other patches.

On Wed, Apr 03, 2019 at 06:44:39PM +0530, VenkataRajesh.Kalakodima@in.bosch.com wrote:
> From: kalakodima venkata rajesh <venkatarajesh.kalakodima@in.bosch.com>
> 
> Replace the hardcoded value of clu table sample count with a
> meaningful name.
> 
> Signed-off-by: Harsha M M <harsha.manjulamallikarjun@in.bosch.com>
> 
> This is the out-of-tree patch for DU CMM driver support from
>     Yocto release v3.6.0. The part of this patch adding CMM support to
>     the new Rcar E3 (R8A77990) SoC was filtered out due to lack of
>     Yocto v3.6.0 (i.e. rcar-3.6.2) kernel updates on staging-414.
> 
>     Link: https://github.com/renesas-rcar/du_cmm/commit/53973b806881ed8f54500b0d42bdc40aaca60476.patch
> 
>     Following is from the patch description:
> 
>     Subject: [PATCH] du_cmm: Release for Yocto v3.6.0
> 
>     This patch made the following correspondence.
> 
>       - R-Car E3(R8A77990) device support.
>       - Fix rewritting of parameter procedure in rcar_du_cmm_postclose
> 
> Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> 
>       - Resolved checkpatch errors
>       - Resolved merge conflicts according to latest version
> 
> Signed-off-by: kalakodima venkata rajesh <venkatarajesh.kalakodima@in.bosch.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_cmm.c | 28 +++++++++++++++-------------
>  1 file changed, 15 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_cmm.c b/drivers/gpu/drm/rcar-du/rcar_du_cmm.c
> index ac613a6e..d380dd9 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_cmm.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_cmm.c
> @@ -75,9 +75,9 @@
>  #include <linux/clk.h>
>  
>  /* #define DEBUG_PROCE_TIME 1 */
> -
> +#define CMM_CLU_SAMPLES 17
>  #define CMM_LUT_NUM 256
> -#define CMM_CLU_NUM (17 * 17 * 17)
> +#define CMM_CLU_NUM (CMM_CLU_SAMPLES * CMM_CLU_SAMPLES * CMM_CLU_SAMPLES)
>  #define CMM_HGO_NUM 64
>  /* rcar_du_drm.h Include */
>  #define LUT_DOUBLE_BUFFER_AUTO		0
> @@ -211,11 +211,11 @@ static inline u32 index_to_clu_data(int index)
>  {
>  	int r, g, b;
>  
> -	r = index % 17;
> -	index /= 17;
> -	g = index % 17;
> -	index /= 17;
> -	b = index % 17;
> +	r = index % CMM_CLU_SAMPLES;
> +	index /= CMM_CLU_SAMPLES;
> +	g = index % CMM_CLU_SAMPLES;
> +	index /= CMM_CLU_SAMPLES;
> +	b = index % CMM_CLU_SAMPLES;
>  
>  	r = (r << 20);
>  	if (r > (255 << 16))
> @@ -630,9 +630,9 @@ static int clu_table_copy(struct rcar_du_cmm *du_cmm)
>  	}
>  
>  	rcar_du_cmm_write(du_cmm, dst_addr, 0);
> -	for (i = 0; i < 17; i++) {
> -		for (j = 0; j < 17; j++) {
> -			for (k = 0; k < 17; k++) {
> +	for (i = 0; i < CMM_CLU_SAMPLES; i++) {
> +		for (j = 0; j < CMM_CLU_SAMPLES; j++) {
> +			for (k = 0; k < CMM_CLU_SAMPLES; k++) {
>  				rcar_du_cmm_write(du_cmm, src_addr,
>  						  (k << 16) | (j << 8) |
>  						  (i << 0));
> @@ -912,9 +912,9 @@ int rcar_du_cmm_pm_suspend(struct rcar_du_crtc *rcrtc)
>  	}
>  
>  	index = 0;
> -	for (i = 0; i < 17; i++) {
> -		for (j = 0; j < 17; j++) {
> -			for (k = 0; k < 17; k++) {
> +	for (i = 0; i < CMM_CLU_SAMPLES; i++) {
> +		for (j = 0; j < CMM_CLU_SAMPLES; j++) {
> +			for (k = 0; k < CMM_CLU_SAMPLES; k++) {
>  				rcar_du_cmm_write(du_cmm, CMM_CLU_ADDR,
>  						  (k << 16) | (j << 8) |
>  						  (i << 0));
> @@ -1014,6 +1014,8 @@ void rcar_du_cmm_postclose(struct drm_device *dev, struct drm_file *file_priv)
>  	for (crtcs_cnt = 0; crtcs_cnt < rcdu->num_crtcs; crtcs_cnt++) {
>  		rcrtc = &rcdu->crtcs[crtcs_cnt];
>  		du_cmm = rcrtc->cmm_handle;
> +		if (!du_cmm)
> +			continue;
>  		if (du_cmm->authority && du_cmm->pid == task_pid_nr(current)) {
>  			du_cmm->authority = false;
>  			du_cmm->pid = 0;

-- 
Regards,

Laurent Pinchart
