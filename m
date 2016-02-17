From: tiffany lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v4 5/8] [Media] vcodec: mediatek: Add Mediatek V4L2
 Video Encoder Driver
Date: Wed, 17 Feb 2016 17:23:09 +0800
Message-ID: <1455700989.3782.7.camel@mtksdaap41>
References: <1454585703-42428-1-git-send-email-tiffany.lin@mediatek.com>
	 <1454585703-42428-2-git-send-email-tiffany.lin@mediatek.com>
	 <1454585703-42428-3-git-send-email-tiffany.lin@mediatek.com>
	 <1454585703-42428-4-git-send-email-tiffany.lin@mediatek.com>
	 <1454585703-42428-5-git-send-email-tiffany.lin@mediatek.com>
	 <1454585703-42428-6-git-send-email-tiffany.lin@mediatek.com>
	 <56C1B4AF.1030207@xs4all.nl> <1455604653.19396.68.camel@mtksdaap41>
	 <56C2D371.9090805@xs4all.nl> <1455628805.19396.82.camel@mtksdaap41>
	 <56C328AF.5030604@cisco.com> <1455696068.26202.4.camel@mtksdaap41>
	 <56C42FE3.8000105@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56C42FE3.8000105-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Cc: Hans Verkuil <hansverk-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Pawel Osciak <posciak-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, PoChun.Lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Andrew-CT Chen <andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2016-02-17 at 09:31 +0100, Hans Verkuil wrote:
> On 02/17/16 09:01, tiffany lin wrote:
> > On Tue, 2016-02-16 at 14:48 +0100, Hans Verkuil wrote:
> >> Hi Tiffany,
> >>
> >>>>>>> +int mtk_vcodec_enc_queue_init(void *priv, struct vb2_queue *src_vq,
> >>>>>>> +			   struct vb2_queue *dst_vq)
> >>>>>>> +{
> >>>>>>> +	struct mtk_vcodec_ctx *ctx = priv;
> >>>>>>> +	int ret;
> >>>>>>> +
> >>>>>>> +	src_vq->type		= V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> >>>>>>> +	src_vq->io_modes	= VB2_DMABUF | VB2_MMAP | VB2_USERPTR;
> >>>>>>
> >>>>>> I recomment dropping VB2_USERPTR. That only makes sense for scatter-gather dma,
> >>>>>> and you use physically contiguous DMA.
> >>>>>>
> >>>>> Now our userspace app use VB2_USERPTR. I need to check if we could drop
> >>>>> VB2_USERPTR.
> >>>>> We use src_vq->mem_ops = &vb2_dma_contig_memops;
> >>>>> And there are
> >>>>> 	.get_userptr	= vb2_dc_get_userptr,
> >>>>> 	.put_userptr	= vb2_dc_put_userptr,
> >>>>> I was confused why it only make sense for scatter-gather.
> >>>>> Could you kindly explain more?
> >>>>
> >>>> VB2_USERPTR indicates that the application can use malloc to allocate buffers
> >>>> and pass those to the driver. Since malloc uses virtual memory the physical
> >>>> memory is scattered all over. And the first page typically does not start at
> >>>> the beginning of the page but at a random offset.
> >>>>
> >>>> To support that the DMA generally has to be able to do scatter-gather.
> >>>>
> >>>> Now, where things get ugly is that a hack was added to the USERPTR support where
> >>>> apps could pass a pointer to physically contiguous memory as a user pointer. This
> >>>> was a hack for embedded systems that preallocated a pool of buffers and needed to
> >>>> pass those pointers around somehow. So the dma-contig USERPTR support is for that
> >>>> 'feature'. If you try to pass a malloc()ed buffer to a dma-contig driver it will
> >>>> reject it. One big problem is that this specific hack isn't signaled anywhere, so
> >>>> applications have no way of knowing if the USERPTR support is the proper version
> >>>> or the hack where physically contiguous memory is expected.
> >>>>
> >>>> This hack has been replaced with DMABUF which is the proper way of passing buffers
> >>>> around.
> >>>>
> >>>> New dma-contig drivers should not use that old hack anymore. Use dmabuf to pass
> >>>> external buffers around.
> >>>>
> >>>> How do you use it in your app? With malloc()ed buffers? Or with 'special' pointers
> >>>> to physically contiguous buffers?
> >>>>
> >>> Understood now. Thanks for your explanation.
> >>> Now our app use malloc()ed buffers and we hook vb2_dma_contig_memops. 
> >>> I don't know why that dma-contig driver do not reject it.
> >>> I will try to figure it out.
> >>
> >> Is there an iommu involved that turns the scatter-gather list into what looks like
> >> contiguous memory for the DMA?
> >>
> > Yes, We have iommu that could make scatter-gather list looks like
> > contiguous memory.
> > 
> >> At the end of vb2_dc_get_userptr() in videobuf2-dma-contig.c there is a check
> >> 'if (contig_size < size)' that verifies that the sg DMA is contiguous. This would
> >> work if there is an iommu involved (if I understand it correctly).
> >>
> > I see. We saw this error before we add iommu support.
> > 
> >> If that's the case, then it's OK to keep VB2_USERPTR because you have real sg
> >> support (although not via the DMA engine, but via iommu mappings).
> >>
> > Got it. We will keep VB2_USERPTR.
> 
> Can you add a comment here mentioning that VB2_USERPTR works with dma-contig because
> there is an iommu? That should clarify this.
> 
Got it. I will add comment before this line.
src_vq->io_modes = VB2_DMABUF | VB2_MMAP | VB2_USERPTR;.

I will also add out IOMMU patches information in cover letter, like:
The following patches are needed to support VB2_USERPTR works with
dma-contig.
https://patchwork.kernel.org/patch/8335461/
https://patchwork.kernel.org/patch/8335471/
https://patchwork.kernel.org/patch/8335481/
https://patchwork.kernel.org/patch/8335491/
https://patchwork.kernel.org/patch/8335501/
https://patchwork.kernel.org/patch/7596181/


best regards,
Tiffany



> Regards,
> 
> 	Hans


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
