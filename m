From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: Re: [RESEND PATCH v2 3/4] media: rockchip: Add the rkvdec driver
Date: Fri, 11 Oct 2019 13:21:42 +0200
Message-ID: <d689990c-e5c0-5914-fc3d-37d623b68812@xs4all.nl>
References: <20191011093342.3471-1-boris.brezillon@collabora.com>
 <20191011093342.3471-4-boris.brezillon@collabora.com>
 <8d3abbd9-f27d-f17f-8298-b0cc7c63ab3e@xs4all.nl>
 <20191011131540.002a61a9@dhcp-172-31-174-146.wireless.concordia.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20191011131540.002a61a9-RcKxWJ4Cfj07VwOnMuImuy7eAjiKCowXPIyMCRxp1+LbFSlKd4bkJ/d9D2ou9A/h@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Boris Brezillon <boris.brezillon-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Jonas Karlman <jonas-uIzNG4q0ceqzQB+pC5nmwQ@public.gmane.org>, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Nicolas Dufresne <nicolas-dDhyB4GVkw9AFePFGvp55w@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ezequiel Garcia <ezequiel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/11/19 1:15 PM, Boris Brezillon wrote:
> Hi Hans,
> 
> On Fri, 11 Oct 2019 12:06:35 +0200
> Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org> wrote:
> 
>>> diff --git a/drivers/staging/media/rockchip/Kconfig b/drivers/staging/media/rockchip/Kconfig
>>> new file mode 100644
>>> index 000000000000..8c617ae2c84f
>>> --- /dev/null
>>> +++ b/drivers/staging/media/rockchip/Kconfig
>>> @@ -0,0 +1,16 @@
>>> +# SPDX-License-Identifier: GPL-2.0
>>> +config VIDEO_ROCKCHIP
>>> +	bool "Rockchip Video Devices"
>>> +	depends on ARCH_ROCKCHIP || COMPILE_TEST
>>> +	help
>>> +	  If you have a Rockchip SoC based embedding a video codec.
>>> +
>>> +	  Note that this option doesn't include new drivers in the
>>> +	  kernel: saying N will just cause Kconfig to skip all the
>>> +	  questions about Allwinner media devices.
>>> +
>>> +if VIDEO_ROCKCHIP
>>> +
>>> +source "drivers/staging/media/rockchip/vdec/Kconfig"
>>> +
>>> +endif  
>>
>> Is this really necessary? I think the 'source' line can just be added to
>> drivers/staging/media/Kconfig. This config option here is rather vague.
> 
> I based it on the Allwinner/Cedrus model (even left an 'Allwinner' in
> the description :)), but I can definitely move the source line in
> drivers/staging/media/Kconfig or even get rid of the rockchip dir if
> you prefer.
> 
>>
>>> diff --git a/drivers/staging/media/rockchip/Makefile b/drivers/staging/media/rockchip/Makefile
>>> new file mode 100644
>>> index 000000000000..b3705b51f1b9
>>> --- /dev/null
>>> +++ b/drivers/staging/media/rockchip/Makefile
>>> @@ -0,0 +1,2 @@
>>> +# SPDX-License-Identifier: GPL-2.0
>>> +obj-$(CONFIG_VIDEO_ROCKCHIP_VDEC) += vdec/
>>> diff --git a/drivers/staging/media/rockchip/vdec/Kconfig b/drivers/staging/media/rockchip/vdec/Kconfig
>>> new file mode 100644
>>> index 000000000000..329b4a813c47
>>> --- /dev/null
>>> +++ b/drivers/staging/media/rockchip/vdec/Kconfig
>>> @@ -0,0 +1,14 @@
>>> +# SPDX-License-Identifier: GPL-2.0
>>> +config VIDEO_ROCKCHIP_VDEC
>>> +	tristate "Rockchip Video Decoder driver"
>>> +	depends on ARCH_ROCKCHIP || COMPILE_TEST
>>> +	depends on VIDEO_DEV && VIDEO_V4L2 && MEDIA_CONTROLLER
>>> +	depends on MEDIA_CONTROLLER_REQUEST_API
>>> +	select VIDEOBUF2_DMA_CONTIG
>>> +	select VIDEOBUF2_VMALLOC
>>> +	select V4L2_MEM2MEM_DEV
>>> +	help
>>> +	  Support for the Rockchip Video Decoder IP present on Rockchip SoC,
>>> +	  which accelerates video decoding.
>>> +	  To compile this driver as a module, choose M here: the module
>>> +	  will be called hantro-vpu.  
>>
>> hantro-vpu? Not rkvdec?
> 
> Should be rkvdec, indeed. That's what happens when you copy things from
> an existing driver :-).
> 
> 
>>> +
>>> +/* Constant CABAC table. */
>>> +static const u32 rkvdec_h264_cabac_table[] = {  
>>
>> Where does this table come from? It needs some provenance.
> 
> Chromeos kernels [1] and MPP code base [2]. I'll add a comment pointing
> to those trees.
> 
> [...]
> 
>>> +
>>> +struct rkvdec_h264_reflist_builder {
>>> +	const struct v4l2_h264_dpb_entry *dpb;
>>> +	s32 pocs[RKVDEC_H264_DPB_SIZE];
>>> +	u8 unordered_reflist[RKVDEC_H264_DPB_SIZE];
>>> +	int frame_nums[RKVDEC_H264_DPB_SIZE];
>>> +	s32 curpoc;
>>> +	u8 num_valid;
>>> +};  
>>
>> What's a 'poc'? Perhaps this can use some comments.
> 
> Picture Order Count. I'll add comment.
> 
>>
>> It looks like code is copied from hantro_h264.c. Is there anything that
>> can be reasonably shared between the two drivers?
> 
> I was planning on exporting those helpers at some point, but I'd like
> the reflist creation logic to settle before doing (we still need to fix
> things for interlaced streams, which is what Jonas is working on).
> 
> 
> 
>>> +
>>> +static int p_ref_list_cmp(const void *ptra, const void *ptrb, const void *data)
>>> +{
>>> +	const struct rkvdec_h264_reflist_builder *builder = data;
>>> +	const struct v4l2_h264_dpb_entry *a, *b;
>>> +	u8 idxa, idxb;
>>> +
>>> +	idxa = *((u8 *)ptra);
>>> +	idxb = *((u8 *)ptrb);
>>> +	a = &builder->dpb[idxa];
>>> +	b = &builder->dpb[idxb];
>>> +
>>> +	if ((a->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM) !=
>>> +	    (b->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)) {
>>> +		/* Short term pics firt. */  
>>
>> firt -> first
> 
> Will fix the typo.
> 
>>
>>> +		if (!(a->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM))
>>> +			return -1;
>>> +		else
>>> +			return 1;
>>> +	}
>>> +
>>> +	/*
>>> +	 * Short term pics in descending pic num order, long term ones in
>>> +	 * ascending order.
>>> +	 */
>>> +	if (!(a->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)) {
>>> +		int frame_num_a, frame_num_b;
>>> +
>>> +		frame_num_a = builder->frame_nums[idxa];
>>> +		frame_num_b = builder->frame_nums[idxb];
>>> +		return frame_num_b > frame_num_a ? 1 : -1;
>>> +	}
>>> +
>>> +	return a->pic_num > b->pic_num ? 1 : -1;
>>> +}
>>> +
>>> +static int b0_ref_list_cmp(const void *ptra, const void *ptrb, const void *data)
>>> +{
>>> +	const struct rkvdec_h264_reflist_builder *builder = data;
>>> +	const struct v4l2_h264_dpb_entry *a, *b;
>>> +	s32 poca, pocb;
>>> +	u8 idxa, idxb;
>>> +
>>> +	idxa = *((u8 *)ptra);
>>> +	idxb = *((u8 *)ptrb);
>>> +	a = &builder->dpb[idxa];
>>> +	b = &builder->dpb[idxb];
>>> +
>>> +	if ((a->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM) !=
>>> +	    (b->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)) {
>>> +		/* Short term pics firt. */  
>>
>> Ditto. Check the code for this typo. It's in the hantro code as well.
> 
> Will do.
> 
>>
>>> +		if (!(a->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM))
>>> +			return -1;
>>> +		else
>>> +			return 1;
>>> +	}
>>> +
>>> +	/* Long term pics in ascending pic num order. */
>>> +	if (a->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)
>>> +		return a->pic_num > b->pic_num ? 1 : -1;
>>> +
>>> +	poca = builder->pocs[idxa];
>>> +	pocb = builder->pocs[idxb];
>>> +
>>> +	/*
>>> +	 * Short term pics with POC < cur POC first in POC descending order
>>> +	 * followed by short term pics with POC > cur POC in POC ascending
>>> +	 * order.
>>> +	 */
>>> +	if ((poca < builder->curpoc) != (pocb < builder->curpoc))
>>> +		return poca > pocb ? 1 : -1;
>>> +	else if (poca < builder->curpoc)
>>> +		return pocb > poca ? 1 : -1;
>>> +
>>> +	return poca > pocb ? 1 : -1;
>>> +}
> 
>>> +static void rkvdec_reset_fmt(struct rkvdec_ctx *ctx, struct v4l2_format *f,
>>> +			     u32 fourcc)
>>> +{
>>> +	memset(f, 0, sizeof(*f));
>>> +	f->fmt.pix_mp.pixelformat = fourcc;
>>> +	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
>>> +	f->fmt.pix_mp.colorspace = V4L2_COLORSPACE_JPEG,  
>>
>> Don't use this colorspace. I see it is also used in the hantro driver, that should
>> be corrected as well.
>>
>> The colorimetry comes from the stream metadata, and for a stateless driver I
>> assume that it is userspace that parses that.
>>
>> V4L2_COLORSPACE_JPEG should only be used by (M)JPEG codecs. And even there is it
>> dubious. See section 2.17.10 in the spec for more info.
> 
> What should I use when the formats are reset then?

Depends on the resolution: SDTV should use V4L2_COLORSPACE_SMPTE170M, others REC709.

If you don't know the resolution here, then stick to REC709.

Regards,

	Hans

> 
> Thanks for the prompt review!
> 
> Boris
> 
> [1]https://chromium.googlesource.com/chromiumos/third_party/kernel/+/refs/heads/chromeos-4.4/drivers/media/platform/rockchip-vpu/rk3399_vdec_hw_h264d.c#45
> [2]https://github.com/rockchip-linux/mpp/blob/release/mpp/hal/rkdec/h264d/hal_h264d_rkv_reg.c#L67
> 
