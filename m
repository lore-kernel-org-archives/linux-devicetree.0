From: Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [RFC PATCH V1 6/6] platform: mtk-isp: Add Mediatek DIP driver
Date: Wed, 26 Jun 2019 13:24:54 +0900
Message-ID: <CAAFQd5D8WDQJaN8SYKwOXyC9-YPRC1U58HirPVzL5969MSvkgA@mail.gmail.com>
References: <20190417104511.21514-1-frederic.chen@mediatek.com>
 <20190417104511.21514-7-frederic.chen@mediatek.com>
 <20190509094846.GA65444@google.com>
 <1561464978.23799.37.camel@mtksdccf07>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1561464978.23799.37.camel@mtksdccf07>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Frederic Chen <frederic.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Cc: Shik Chen <shik-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?B?U2VhbiBDaGVuZyAo6YSt5piH5byYKQ==?= <Sean.Cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, =?UTF-8?B?UnlubiBXdSAo5ZCz6IKy5oGpKQ==?= <Rynn.Wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, =?UTF-8?B?SG9sbWVzIENoaW91ICjpgrHmjLop?= <holmes.chiou-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, suleiman-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Jerry-ch Chen <Jerry-ch.Chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, =?UTF-8?B?SnVuZ28gTGluICjmnpfmmI7kv4op?= <jungo.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sj Huang <sj.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, yuzhao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, "moderated list:ARM/Mediatek SoC support" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, zwisler-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?Q2hyaXN0aWUgWXUgKOa4uOmbheaDoCk=?= <christie.yu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, list-Y9sIeH5OGRo@public.gmane.org:IOMMU DRIVERS <iommu-cunTk1MwBs9QetFLy7KEmxxBWXNxL4zz@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Frederic,

On Tue, Jun 25, 2019 at 9:16 PM Frederic Chen
<frederic.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
>
> Dear Tomasz,
>
> Would you comment on the following points in further? Thank you for the
> review.
>
> On Thu, 2019-05-09 at 18:48 +0900, Tomasz Figa wrote:
> > Hi Frederic,
> >
>
> [snip]
>
> > > +int mtk_dip_pipe_job_start(struct mtk_dip_pipe *dip_pipe,
> > > +                          struct mtk_dip_pipe_job_info *pipe_job_info)
> > > +{
> > > +       struct platform_device *pdev = dip_pipe->dip_dev->pdev;
> > > +       int ret;
> > > +       int out_img_buf_idx;
> > > +       struct img_ipi_frameparam dip_param;
> > > +       struct mtk_dip_dev_buffer *dev_buf_in;
> > > +       struct mtk_dip_dev_buffer *dev_buf_out;
> > > +       struct mtk_dip_dev_buffer *dev_buf_tuning;
> > > +
> > > +       if (!pipe_job_info) {
> > > +               dev_err(&pdev->dev,
> > > +                       "pipe_job_info(%p) in start can't be NULL\n",
> > > +                       pipe_job_info);
> > > +               return -EINVAL;
> > > +       }
> >
> > This should be impossible to happen.
> >
> > > +
> > > +       /* We need RAW and at least MDP0 or MDP 1 buffer */
> > > +       if (!pipe_job_info->buf_map[MTK_DIP_VIDEO_NODE_ID_RAW_OUT] ||
> > > +           (!pipe_job_info->buf_map[MTK_DIP_VIDEO_NODE_ID_MDP0_CAPTURE] &&
> > > +                !pipe_job_info->buf_map[MTK_DIP_VIDEO_NODE_ID_MDP1_CAPTURE])){
> > > +               struct mtk_dip_dev_buffer **map = pipe_job_info->buf_map;
> > > +
> > > +               dev_dbg(&pdev->dev,
> > > +                       "can't trigger job: raw(%p), mdp0(%p), mdp1(%p)\n",
> > > +                       map[MTK_DIP_VIDEO_NODE_ID_RAW_OUT],
> > > +                       map[MTK_DIP_VIDEO_NODE_ID_MDP0_CAPTURE],
> > > +                       map[MTK_DIP_VIDEO_NODE_ID_MDP1_CAPTURE]);
> > > +               return -EINVAL;
> >
> > This must be validated at the time of request_validate. We can't fail at
> > this stage anymore.
>
> After the modification about checking the required buffers in
> req_validate(), we got failed in the following testRequests()
> of V4L2 compliance test. The V4L2 compliance test case doesn't know
> which buffers of the video devices are required and expects that the
> MEDIA_REQUEST_IOC_QUEUE succeed when the request has any valid buffer.
>
> For example, when the request has MDP 0 buffer only, the DIP's
> req_validate() should return an error since it also need a buffer
> from RAW video device, but it make compliance test get failed.
>
> May I still check the required buffers in req_validate() in the next
> patch? I will add some note to explain that the compliance test failed
> item is related to the limitation?
>
> =======================================================
> int testRequests(struct node *node, bool test_streaming)
> // ......
> if (i)
>         fail_on_test(!buf.qbuf(node));
> buf.s_flags(buf.g_flags() | V4L2_BUF_FLAG_REQUEST_FD);
> buf.s_request_fd(buf_req_fds[i]);
> buf.s_field(V4L2_FIELD_ANY);
> fail_on_test(buf.qbuf(node));
> if (v4l_type_is_video(buf.g_type()) && v4l_type_is_output(buf.g_type()))
>         fail_on_test(buf.g_field() == V4L2_FIELD_ANY);
> fail_on_test(buf.querybuf(node, i));
>
> // ......
>
> // LINE 1807 in v4l2-test-buffers.cpp, we will got the  failed here.
> // Since we need one RAW and one MDP0 buffer at least.
> // v4l2-test-buffers.cpp(1807): doioctl_fd(buf_req_fds[i],
> // MEDIA_REQUEST_IOC_QUEUE, 0)
> //      test Requests: FAIL
> fail_on_test(doioctl_fd(buf_req_fds[i], MEDIA_REQUEST_IOC_QUEUE, 0));
> =======================================================
>

Sounds like a limitation of the compliance test. Request API testing
there is still new and possibly just made for simple mem-to-mem
devices.

Hans, the driver always requires some buffers to be given, like the
raw frame input, while other, e.g. downscaled output, are optional.
Any ideas?

> > > +
> > > +static int mtk_dip_vb2_queue_setup(struct vb2_queue *vq,
> > > +                                  unsigned int *num_buffers,
> > > +                                  unsigned int *num_planes,
> > > +                                  unsigned int sizes[],
> > > +                                  struct device *alloc_devs[])
> > > +{
> > > +       struct mtk_dip_pipe *dip_pipe = vb2_get_drv_priv(vq);
> > > +       struct mtk_dip_video_device *node =
> > > +               mtk_dip_vbq_to_node(vq);
> > > +       struct device *dev = &dip_pipe->dip_dev->pdev->dev;
> > > +       struct device *buf_alloc_ctx;
> > > +
>
> [snip]
>
> > > +
> > > +       if (vq->type == V4L2_BUF_TYPE_META_CAPTURE ||
> > > +           vq->type == V4L2_BUF_TYPE_META_OUTPUT)
> > > +               size = fmt->fmt.meta.buffersize;
> > > +       else
> > > +               size = fmt->fmt.pix_mp.plane_fmt[0].sizeimage;
> > > +
> > > +       if (*num_planes) {
> > > +               if (sizes[0] < size) {
> > > +                       dev_dbg(dev, "%s:%s:%s: size error(user:%d, max:%d)\n",
> > > +                               __func__, dip_pipe->desc->name,
> > > +                               node->desc->name, sizes[0], size);
> > > +                       return -EINVAL;
> > > +               }
> >
> > I don't think this is an error. This is for handling VIDIOC_CREATE_BUFS,
> > which can allocate for any arbitrary format.
> >
> > Whether the size of the buffer is big enough for current format should be
> > checked in .buf_prepare callback.
>
> When executing V4L2 compliance test, we need to check this image size to
> pass the following q.create_bufs() test (LINE:709,
> v4l2-test-buffers.cpp).
>
> ========================================================
> node->g_fmt(fmt, q.g_type());
> //....
> fmt.s_height(fmt.g_height() / 2);
> for (unsigned p = 0; p < fmt.g_num_planes(); p++)
>         fmt.s_sizeimage(fmt.g_sizeimage(p) / 2, p);
>
> // LINE 709 in v4l2-test-buffers.cpp
> // It seems that the driver needs to return EINVAL when the buffer
> //size is smaller than the sizeimage required
>         fail_on_test(q.create_bufs(node, 1, &fmt) != EINVAL);
> ========================================================
>
> The kernel document has some similar description on VIDIOC_CREATE_BUFS.
>
> https://www.kernel.org/doc/html/latest/media/uapi/v4l/vidioc-create-bufs.html
>
> =======================================================
> Usually if the format.pix.sizeimage field is less than the minimum
> required for the given format, then an error will be returned since
> drivers will typically not allow this.
> =======================================================
>
> Should we check the image size of each plane here so that we can pass
> the test?

Note that "given format" there means the format field of
structv4l2_create_buffers, _not_ the currently active format. That's
really strange because we don't get that inside queue_setup.

Hans, how should we handle this in the driver? Right now we just call
vb2_create_bufs(), which doesn't care about anything else than
sizeimage. Do we need to implement our own .vidioc_create_bufs()
handler that validates the sizeimage wrt the other parts of the given
format before calling vb2_create_bufs()?

Another thing is that the spec isn't very precise on this, especially
given the "usually" and "typically" in the description quoted above.

Best regards,
Tomasz
