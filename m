From: Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [RFC PATCH V1 6/6] platform: mtk-isp: Add Mediatek FD driver
Date: Tue, 25 Jun 2019 19:09:18 +0900
Message-ID: <CAAFQd5B92Vx96nZD7NQzVHByQEspdprLpTTOsqrUbjvUf2jxug@mail.gmail.com>
References: <20190423104505.38778-1-Jerry-Ch.chen@mediatek.com>
 <20190423104505.38778-7-Jerry-Ch.chen@mediatek.com>
 <20190606104347.GA107267@chromium.org>
 <1561386122.15267.223.camel@mtksdccf07>
 <CAAFQd5BWbtPtNG29ULF==jCGOes=ob-NFcnOX8_DH=GhZRZGrA@mail.gmail.com>
 <1561452912.15267.261.camel@mtksdccf07>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1561452912.15267.261.camel@mtksdccf07>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Jerry-ch Chen <Jerry-ch.Chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?B?U2VhbiBDaGVuZyAo6YSt5piH5byYKQ==?= <Sean.Cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org" <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, =?UTF-8?B?UnlubiBXdSAo5ZCz6IKy5oGpKQ==?= <Rynn.Wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?B?UG8tWWFuZyBIdWFuZyAo6buD5p+P6Zm9KQ==?= <po-yang.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, =?UTF-8?B?SG9sbWVzIENoaW91ICjpgrHmjLop?= <holmes.chiou-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "suleiman-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" <suleiman-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "shik-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" <shik-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, =?UTF-8?B?SnVuZ28gTGluICjmnpfmmI7kv4op?= <jungo.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, =?UTF-8?B?U2ogSHVhbmcgKOm7g+S/oeeSiyk=?= <sj.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "yuzhao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" <yuzhao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, zwisler@chromi
List-Id: devicetree@vger.kernel.org

On Tue, Jun 25, 2019 at 5:55 PM Jerry-ch Chen
<Jerry-ch.Chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
>
> Hi Tomasz,
>
> On Tue, 2019-06-25 at 11:39 +0800, Tomasz Figa wrote:
> > Hi Jerry,
> >
> > On Mon, Jun 24, 2019 at 11:22 PM Jerry-ch Chen
> > <Jerry-ch.Chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> > >
> > > Hi Tomasz,
> > >
> > > On Thu, 2019-06-06 at 18:43 +0800, Tomasz Figa wrote:
> > > > Hi Jerry,
> > > >
> > > > On Tue, Apr 23, 2019 at 06:45:05PM +0800, Jerry-ch Chen wrote:
> > > > > From: Jerry-ch Chen <jerry-ch.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > > > >
> > > > > This patch adds the driver of Face Detection (FD) unit in
> > > > > Mediatek camera system, providing face detection function.
> > > > >
> > > > > The mtk-isp directory will contain drivers for multiple IP
> > > > > blocks found in Mediatek ISP system. It will include ISP Pass 1
> > > > > driver (CAM), sensor interface driver, DIP driver and face
> > > > > detection driver.
> > > > >
> > > >
> > > > Thanks for the patch.
> > > >
> > > > First of all a general comment about the design:
> > > >
> > > > My understanding is that this is a relatively straightforward
> > > > memory-to-memory device that reads a video frame and detects faces on it.
> > > > Such devices should be implemented as normal V4L2 memory-to-memory devices,
> > > > with contexts (instances; pipes) represented by v4l2_fh.
> > > >
> > > > Also, please replace the META_OUTPUT queue with proper V4L2 controls, as I
> > > > don't think there is anything that we couldn't model using controls here.
> > > >
> > > > The end result should be a V4L2 m2m driver (using the m2m helpers), where
> > > > you get a new context (instance; pipe) whenever you open the video node,
> > > > similar to codecs, video processors (like MTK MDP) and so on.
> > > >
> > > > Also please see my comments inline.
> > > >
> > > I appreciate your comments,
> > > sorry for sending the previous two unfinished mail...
> > >
> > > FD driver will be implemented as a normal V4L2 m2m driver which has an
> > > IMAGE_OUTPUT queue and a META_CAPTURE queue(face result).
> > >
> > > We will use the following properties.
> > > /* Is a video mem-to-mem device that supports multiplanar formats */
> > > #define V4L2_CAP_VIDEO_M2M_MPLANE    0x00004000
> > >
> > > The original META_OUTPUT queue contains the following structure will be
> > > replaced by V4L2 controls,
> > >
> > > /* FD_SCALE_NUM is 15. */
> > > struct fd_user_param {
> > >         uint8_t rip_feature;
> > >         uint8_t gfd_skip;
> > >         uint8_t dynamic_change_model;
> > >         uint8_t scale_num_from_user;
> > >         uint16_t source_img_width[FD_SCALE_NUM];
> > >         uint16_t source_img_height[FD_SCALE_NUM];
> > > } __packed; //share with co-processor
> > >
> > > However, we found that testM2MFormats() in the V4L2 compliance test will
> > > assume the capture queue has the same format as output queue has,
> > > therefore, FD driver's capture queue wouldn't be able to use META format
> > > or the v4l2 test will be failed.
> > >
> > > reference: v4l2-compliance/v4l2-test-formats.cpp
> > > // m2m devices are special in that the format is often per-filehandle.
> > > // But colorspace information should be passed from output to capture,
> > > // so test that.
> > >         if (node->is_m2m)
> > >                 return testM2MFormats(node);
> > >
> > > May we ask for your suggestions about this part?
> > >
> >
> > Ah, I didn't mean mem-to-mem device specifically as per
> > V4L2_CAP_VIDEO_M2M_MPLANE, because that one implies the regular
> > VIDEO_OUTPUT -> VIDEO_CAPTURE processing indeed. We should expose just
> > VIDEO_OUTPUT_MPLANE and META_CAPTURE in the capabilities, but all the
> > rest would still behave like a mem-to-mem device, i.e. v4l2_fh for
> > contexts/instances, v4l2_m2m helpers and so on.
> >
> I Appreciate for your reply,
>
> Sorry I didn't mention the question clearly, we have included these two
> capabilities, but we get the following v4l2 test failure:
> fail: v4l2-test-formats.cpp(784): fmt_cap.g_colorspace() !=
> fmt_out.g_colorspace()

My point is that we shouldn't set V4L2_CAP_VIDEO_M2M(_MPLANE) in the
capabilities, because FD is mem-to-mem in terms of the mode of
operation, not in terms of the definition of
V4L2_CAP_VIDEO_M2M(_MPLANE). That would make testM2MFormats() not
called at all.

Best regards,
Tomasz

>
> Which is caused by the following code testing the m2m buffers'
> capabilities, FD driver have fmt_cap with V4L2_BUF_TYPE_META_CAPTURE and
> fmt_out with V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE, therefore, our fmt_cap
> won't have colorspace information.
>
> Reference:
> https://github.com/gjasny/v4l-utils/blob/master/utils/v4l2-compliance/v4l2-test-formats.cpp#L774
> fail_on_test(fmt_cap.g_colorspace() != fmt_out.g_colorspace());
> fail_on_test(fmt_cap.g_ycbcr_enc() != fmt_out.g_ycbcr_enc());
> fail_on_test(fmt_cap.g_quantization() != fmt_out.g_quantization());
> fail_on_test(fmt_cap.g_xfer_func() != fmt_out.g_xfer_func());
>
> Not sure if the maintainer of v4l2 test would consider modifying here to
> allow the use case of FD driver?
>
> > [snip]
> >
> > > > > +
> > > > > +   return 0;
> > > > > +}
> > > > > +
> > > > > +static int mtk_fd_suspend(struct device *dev)
> > > > > +{
> > > > > +   struct mtk_fd_dev *fd_dev;
> > > > > +   int ret;
> > > > > +
> > > > > +   if (pm_runtime_suspended(dev))
> > > > > +           return 0;
> > > > > +
> > > > > +   fd_dev = dev_get_drvdata(dev);
> > > > > +
> > > > > +   if (atomic_read(&fd_dev->fd_hw.fd_user_cnt) > 0) {
> > > > > +           ret = pm_runtime_put_sync(fd_dev->fd_hw.larb_dev);
> > > > > +           clk_disable_unprepare(fd_dev->fd_hw.fd_clk);
> > > > > +           return ret;
> > > > > +   }
> > > >
> > > > This isn't going to work, because the hardware may be still processing a
> > > > frame at this point. You need a way to ensure that the hardware goes idle
> > > > here first and then in resume, you need to make the hardware continue when
> > > > it left before suspend.
> > > >
> > > For this part, I would like to do as following:
> > > when suspend, it should set the driver power state as idle or suspended
> > > to stop further enqueue jobs, should be judged in mtk_fd_hw_job_exec()
> > > or somewhere, then wait for the unfinished job return or timeout, and
> > > finally close the clock.
> > > When resume, we set the driver power state as resumed and let the new
> > > jobs to be enqueued.
> > >
> > > Or another way is to create a wait queue or work queue to store the jobs
> > > from user. When suspend, we change the driver status to restrict the new
> > > jobs joining to work queue and close the clock. When resume, driver
> > > continue execute the jobs from the work queue.
> > >
> >
> > I wouldn't introduce a workqueue only for handling suspend/resume. If
> > we end up in a need to use a workqueue for some other purposes too,
> > then a freezable workqueue could work for blocking further requests
> > during suspend indeed. If we don't need a workqueue for anything else,
> > then a simple boolean flag set and wait for last job to finish in
> > suspend and flag reset and call to schedule a next job in resume
> > should be good enough.
> >
> > Best regards,
> > Tomasz
>
> Ok, we got it.
>
> Sincerely,
> Jerry
>
