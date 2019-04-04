From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 5/8] drm: rcar-du: Implement interfaces to set clu and
 lut using drm data structures
Date: Thu, 4 Apr 2019 09:50:47 +0200
Message-ID: <20190404075047.GP2665@phenom.ffwll.local>
References: <1554297284-14009-1-git-send-email-VenkataRajesh.Kalakodima@in.bosch.com>
 <1554297284-14009-6-git-send-email-VenkataRajesh.Kalakodima@in.bosch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1554297284-14009-6-git-send-email-VenkataRajesh.Kalakodima@in.bosch.com>
Sender: linux-kernel-owner@vger.kernel.org
To: VenkataRajesh.Kalakodima@in.bosch.com
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, Harsha M M <harsha.manjulamallikarjun@in.bosch.com>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 03, 2019 at 06:44:41PM +0530, VenkataRajesh.Kalakodima@in.bosch.com wrote:
> From: kalakodima venkata rajesh <venkatarajesh.kalakodima@in.bosch.com>
> 
> Impelement interfaces in cmm to set clu and lut tables using standard
> drm data structures as input.
> 
> Signed-off-by: Harsha M M <harsha.manjulamallikarjun@in.bosch.com>
> 
>       - Resolved checkpatch errors
>       - Resolved merge conflicts according to latest version
> 
> Signed-off-by: kalakodima venkata rajesh <venkatarajesh.kalakodima@in.bosch.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_cmm.c  | 256 +++++++++++++++++++++++++++++++--
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.h |  11 ++
>  2 files changed, 254 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_cmm.c b/drivers/gpu/drm/rcar-du/rcar_du_cmm.c
> index 7983039..af4668f 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_cmm.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_cmm.c
> @@ -114,6 +114,8 @@ struct rcar_du_cmm_pending_event {
>  	struct drm_gem_object *gem_obj;
>  	struct rcar_du_cmm *du_cmm;
>  	struct rcar_du_cmm_file_priv *fpriv;
> +	unsigned int *lut_buf;
> +	unsigned int *clu_buf;
>  };
>  
>  struct cmm_module_t {
> @@ -238,14 +240,6 @@ static long long diff_timevals(struct timeval *start, struct timeval *end)
>  }
>  #endif
>  
> -static void du_cmm_clk(struct rcar_du_cmm *du_cmm, bool on)
> -{
> -	if (on)
> -		clk_prepare_enable(du_cmm->clock);
> -	else
> -		clk_disable_unprepare(du_cmm->clock);
> -}
> -
>  static void rcar_du_cmm_queue_lut_update(struct rcar_du_cmm_pending_event *p)
>  {
>  	mutex_lock(&cmm_event_lock);
> @@ -284,6 +278,223 @@ static void rcar_du_cmm_queue_clu_update(struct rcar_du_cmm_pending_event *p)
>  	drm_crtc_vblank_get(&p->du_cmm->rcrtc->crtc);
>  }
>  
> +static s64 rcar_du_cmm_multiply_coeff(unsigned int color, s64 coeff)
> +{
> +	s64 r_val;
> +	bool is_neg = false;
> +
> +	if (coeff & BIT_ULL(63)) {
> +		is_neg = true;
> +		coeff &= ~BIT_ULL(63);
> +	}
> +
> +	r_val = DIV_ROUND_CLOSEST(((s64)(color * coeff)), BIT_ULL(32));
> +
> +	if (is_neg)
> +		return -r_val;
> +
> +	return r_val;
> +}
> +
> +static unsigned int rcar_du_cmm_scalar_product(unsigned int r, unsigned int g,
> +					       unsigned int b, s64 coeff1,
> +					       s64 coeff2, s64 coeff3)
> +{
> +	s64 product;
> +
> +	product = rcar_du_cmm_multiply_coeff(r, coeff1)
> +			+ rcar_du_cmm_multiply_coeff(g, coeff2)
> +			+ rcar_du_cmm_multiply_coeff(b, coeff3);
> +
> +	return (unsigned int)clamp_val(product, 0, U8_MAX);
> +}
> +
> +#ifdef DEBUG_PROCE_TIME
> +static long long diff_timevals(struct timeval *start, struct timeval *end)
> +{
> +	return (end->tv_sec * 1000000LL + end->tv_usec) -
> +		(start->tv_sec * 1000000LL + start->tv_usec);
> +}
> +#endif
> +
> +void *rcar_du_cmm_alloc_lut(void *cmm_handle)
> +{
> +	struct rcar_du_cmm_pending_event *p;
> +
> +	if (!cmm_handle)
> +		return NULL;
> +
> +	p = kzalloc(sizeof(*p), GFP_KERNEL);
> +	if (!p)
> +		return NULL;
> +
> +	p->gem_obj = NULL;
> +	p->event = CMM_EVENT_LUT_DONE;
> +	p->stat = QUE_STAT_PENDING;
> +	p->callback_data = 0;
> +	p->du_cmm = cmm_handle;
> +	p->fpriv = NULL;
> +	p->lut_buf = kmalloc(CMM_LUT_NUM * 4, GFP_KERNEL);
> +	if (!p->lut_buf) {
> +		kfree(p);
> +		return NULL;
> +	}
> +
> +	return p;
> +}
> +
> +void rcar_du_cmm_free_lut(void *lut_handle)
> +{
> +	struct rcar_du_cmm_pending_event *p =
> +			(struct rcar_du_cmm_pending_event *)lut_handle;
> +
> +	kfree(p->lut_buf);
> +	kfree(p);
> +}
> +
> +int rcar_du_cmm_lut_valid(unsigned int lut_length)
> +{
> +	return (lut_length == CMM_LUT_NUM) ? 0 : -EINVAL;
> +}
> +
> +void rcar_du_cmm_update_lut_and_free(void *lut_handle,
> +				     struct drm_color_lut *lut,
> +				     unsigned int lut_length)
> +{
> +	struct rcar_du_cmm_pending_event *p =
> +			(struct rcar_du_cmm_pending_event *)lut_handle;
> +	unsigned int color;
> +
> +	if (!p)
> +		return;
> +
> +	if (rcar_du_cmm_lut_valid(lut_length))
> +		return;
> +
> +	/* Convert drm_color_lut to the format handled by hardware */
> +	for (color = 0; color < lut_length; color++) {
> +		p->lut_buf[color] = 0;
> +		p->lut_buf[color] |= drm_color_lut_extract(lut[color].red, 8)
> +					<< 16;
> +		p->lut_buf[color] |= drm_color_lut_extract(lut[color].green, 8)
> +					<< 8;
> +		p->lut_buf[color] |= drm_color_lut_extract(lut[color].blue, 8);
> +	}
> +	rcar_du_cmm_queue_lut_update(p);
> +}
> +
> +void *rcar_du_cmm_alloc_clu(void *cmm_handle)
> +{
> +	struct rcar_du_cmm_pending_event *p;
> +
> +	if (!cmm_handle)
> +		return NULL;
> +
> +	p = kzalloc(sizeof(*p), GFP_KERNEL);
> +	if (!p)
> +		return NULL;
> +
> +	p->gem_obj = NULL;
> +	p->event = CMM_EVENT_CLU_DONE;
> +	p->stat = QUE_STAT_PENDING;
> +	p->callback_data = 0;
> +	p->du_cmm = cmm_handle;
> +	p->fpriv = NULL;
> +	p->clu_buf = kmalloc(CMM_CLU_NUM * 4, GFP_KERNEL);
> +	if (!p->clu_buf) {
> +		kfree(p);
> +		return NULL;
> +	}
> +
> +	return p;
> +}
> +
> +void rcar_du_cmm_free_clu(void *clu_handle)
> +{
> +	struct rcar_du_cmm_pending_event *p =
> +			(struct rcar_du_cmm_pending_event *)clu_handle;
> +
> +	kfree(p->clu_buf);
> +	kfree(p);
> +}
> +
> +void rcar_du_cmm_update_clu_and_free(void *clu_handle,
> +				     struct drm_color_ctm *ctm)
> +{
> +	struct rcar_du_cmm_pending_event *p =
> +			(struct rcar_du_cmm_pending_event *)clu_handle;
> +	unsigned int r_loop;
> +	unsigned int g_loop;
> +	unsigned int b_loop;
> +	unsigned int step_size;
> +	unsigned int step_fraction;
> +	unsigned int clu_index = 0;
> +
> +	if (!p)
> +		return;
> +
> +	step_size = U8_MAX / (CMM_CLU_SAMPLES - 1);
> +	step_fraction = U8_MAX % (CMM_CLU_SAMPLES - 1);
> +
> +	/*Update clu table*/
> +	for (b_loop = 0; b_loop < CMM_CLU_SAMPLES; b_loop++) {
> +		unsigned int b;
> +
> +		b = (b_loop * step_size) +
> +		    DIV_ROUND_CLOSEST((b_loop * step_fraction),
> +				      (CMM_CLU_SAMPLES - 1));
> +
> +		for (g_loop = 0; g_loop < CMM_CLU_SAMPLES; g_loop++) {
> +			unsigned int g;
> +
> +			g = (g_loop * step_size) +
> +			    DIV_ROUND_CLOSEST((g_loop * step_fraction),
> +					      (CMM_CLU_SAMPLES - 1));
> +
> +			for (r_loop = 0; r_loop < CMM_CLU_SAMPLES; r_loop++) {
> +				unsigned int r;
> +				unsigned int r_val;
> +				unsigned int g_val;
> +				unsigned int b_val;
> +
> +				r = (r_loop * step_size) +
> +				    DIV_ROUND_CLOSEST((r_loop * step_fraction),
> +						      (CMM_CLU_SAMPLES - 1));
> +
> +				p->clu_buf[clu_index] = 0;
> +
> +				r_val =	rcar_du_cmm_scalar_product
> +						(r, g, b,
> +						 ctm->matrix[0], ctm->matrix[1],
> +						 ctm->matrix[2]);
> +
> +				g_val =	rcar_du_cmm_scalar_product
> +						(r, g, b,
> +						 ctm->matrix[3], ctm->matrix[4],
> +						 ctm->matrix[5]);
> +
> +				b_val =	rcar_du_cmm_scalar_product
> +						(r, g, b,
> +						 ctm->matrix[6], ctm->matrix[7],
> +						 ctm->matrix[8]);
> +
> +				p->clu_buf[clu_index++] = (r_val << 16) |
> +							  (g_val << 8) | b_val;
> +			}
> +		}
> +	}
> +
> +	rcar_du_cmm_queue_clu_update(p);
> +}

Just quick drive-by: I think there's some interested (definitely from
intel, I pinged the relevant people from our team) to expose a 3D LUT
directly to userspace. I'm not sure whether we can do both 3D-LUT and
color matrix, and I'm also not sure whether remapping the ctm to a 3d-lut
is the best thing to do. Otoh adding new uapi is always a bunch more work.
-Daniel

> +
> +static void du_cmm_clk(struct rcar_du_cmm *du_cmm, bool on)
> +{
> +	if (on)
> +		clk_prepare_enable(du_cmm->clock);
> +	else
> +		clk_disable_unprepare(du_cmm->clock);
> +}
> +
>  int rcar_du_cmm_start_stop(struct rcar_du_crtc *rcrtc, bool on)
>  {
>  	struct rcar_du_cmm *du_cmm = rcrtc->cmm_handle;
> @@ -424,8 +635,16 @@ static inline void _event_done_locked(struct rcar_du_cmm_pending_event *p)
>  		list_add_tail(&p->link, cmm_done_list(p->du_cmm, p->fpriv));
>  		wake_up_interruptible(&p->fpriv->event_wait);
>  	} else {
> -		/* link deleted by rcar_du_cmm_postclose */
> -		kfree(p);
> +		/* link deleted by rcar_du_cmm_postclose
> +		 * OR it could also be due to set of ctm and gamma
> +		 * properties through drm APIs.
> +		 */
> +		if (p->event == CMM_EVENT_LUT_DONE)
> +			rcar_du_cmm_free_lut(p);
> +		else if (p->event == CMM_EVENT_CLU_DONE)
> +			rcar_du_cmm_free_clu(p);
> +		else
> +			kfree(p);
>  	}
>  }
>  
> @@ -479,7 +698,8 @@ event_pop_locked(struct cmm_module_t *module)
>  
>  	p->stat = QUE_STAT_ACTIVE;
>  	list_del(&p->link); /* delete from du_cmm->[lut|clu|hgo].list */
> -	list_add_tail(&p->link, &p->fpriv->active_list);
> +	if (p->fpriv)
> +		list_add_tail(&p->link, &p->fpriv->active_list);
>  	cmm_vblank_put(p);
>  
>  	return p;
> @@ -605,7 +825,11 @@ static int lut_set(struct rcar_du_cmm *du_cmm,
>  		return -EINVAL;
>  	}
>  
> -	lut_buf = gem_to_vaddr(stat->p->gem_obj);
> +	if (stat->p->gem_obj)
> +		lut_buf = gem_to_vaddr(stat->p->gem_obj);
> +	else
> +		lut_buf = stat->p->lut_buf;
> +
>  	for (i = 0; i < CMM_LUT_NUM; i++)
>  		rcar_du_cmm_write(du_cmm, lut_base + i * 4, lut_buf[i]);
>  
> @@ -723,7 +947,11 @@ static int clu_set(struct rcar_du_cmm *du_cmm,
>  		return -EINVAL;
>  	}
>  
> -	clu_buf = gem_to_vaddr(stat->p->gem_obj);
> +	if (stat->p->gem_obj)
> +		clu_buf = gem_to_vaddr(stat->p->gem_obj);
> +	else
> +		clu_buf = stat->p->clu_buf;
> +
>  	rcar_du_cmm_write(du_cmm, addr_reg, 0);
>  	for (i = 0; i < CMM_CLU_NUM; i++)
>  		rcar_du_cmm_write(du_cmm, data_reg, clu_buf[i]);
> @@ -1222,6 +1450,8 @@ int rcar_du_cmm_init(struct rcar_du_crtc *rcrtc)
>  
>  	rcrtc->cmm_handle = du_cmm;
>  
> +	drm_crtc_enable_color_mgmt(&rcrtc->crtc, 0, true, CMM_LUT_NUM);
> +
>  	dev_info(rcdu->dev, "DU%d use CMM(%s buffer)\n",
>  		 rcrtc->index, du_cmm->dbuf ? "Double" : "Single");
>  
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> index 74e0a22..5b85de4 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> @@ -115,6 +115,17 @@ void rcar_du_cmm_postclose(struct drm_device *dev, struct drm_file *file_priv);
>  int rcar_du_cmm_start_stop(struct rcar_du_crtc *rcrtc, bool on);
>  void rcar_du_cmm_kick(struct rcar_du_crtc *rcrtc);
>  
> +void *rcar_du_cmm_alloc_lut(void *cmm_handle);
> +void rcar_du_cmm_free_lut(void *lut_handle);
> +int rcar_du_cmm_lut_valid(unsigned int lut_length);
> +void rcar_du_cmm_update_lut_and_free(void *lut_handle,
> +				     struct drm_color_lut *lut,
> +				     unsigned int lut_length);
> +
> +void *rcar_du_cmm_alloc_clu(void *cmm_handle);
> +void rcar_du_cmm_free_clu(void *clu_handle);
> +void rcar_du_cmm_update_clu_and_free(void *clu_handle,
> +				     struct drm_color_ctm *ctm);
>  #ifdef CONFIG_PM_SLEEP
>  int rcar_du_cmm_pm_suspend(struct rcar_du_crtc *rcrtc);
>  int rcar_du_cmm_pm_resume(struct rcar_du_crtc *rcrtc);
> -- 
> 2.7.4
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
