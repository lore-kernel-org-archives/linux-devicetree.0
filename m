From: Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [RFC,v3 6/9] media: platform: Add Mediatek ISP P1 V4L2 functions
Date: Mon, 5 Aug 2019 18:59:19 +0900
Message-ID: <CAAFQd5BUUtndb76+3CJeYFxk+=6mefXDb3F9KBpyTXkCJnF2aw@mail.gmail.com>
References: <jungo.lin@mediatek.com>
 <20190611035344.29814-1-jungo.lin@mediatek.com>
 <20190611035344.29814-7-jungo.lin@mediatek.com>
 <20190710095429.GA181405@chromium.org>
 <1563424741.1212.212.camel@mtksdccf07>
 <CAAFQd5CXeQv74RtqDxYYLVEpsnFbsm0m-kUBDpY_AFmCBO0PyA@mail.gmail.com>
 <1563942689.1212.494.camel@mtksdccf07>
 <CAAFQd5A8zW9s8cewmHnr9HFmrkxDnEqjrTiwLF2m8sKp0619hA@mail.gmail.com>
 <1564363089.1212.636.camel@mtksdccf07>
 <CAAFQd5D4Roc05H1NnXSp=W+L1RN7LEPHY0EA0mRhpHAcZ3wvMg@mail.gmail.com>
 <1564451089.1212.649.camel@mtksdccf07>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1564451089.1212.649.camel@mtksdccf07>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Jungo Lin <jungo.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?B?U2VhbiBDaGVuZyAo6YSt5piH5byYKQ==?= <sean.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?B?UnlubiBXdSAo5ZCz6IKy5oGpKQ==?= <rynn.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?B?UnlhbiBZdSAo5L2Z5a2f5L+uKQ==?= <ryan.yu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, =?UTF-8?B?RnJhbmtpZSBDaGl1ICjpgrHmloflh7Ep?= <frankie.chiu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sj Huang <sj.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, ddavenport-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, =?UTF-8?B?RnJlZGVyaWMgQ2hlbiAo6Zmz5L+K5YWDKQ==?= <frederic.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "list-Y9sIeH5OGRo@public.gmane.org:IOMMU DRIVERS <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>,
 Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, " <linux-arm>
List-Id: devicetree@vger.kernel.org

Hi Jungo,

On Tue, Jul 30, 2019 at 10:45 AM Jungo Lin <jungo.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
>
> On Mon, 2019-07-29 at 19:04 +0900, Tomasz Figa wrote:
> > On Mon, Jul 29, 2019 at 10:18 AM Jungo Lin <jungo.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> > > On Fri, 2019-07-26 at 14:49 +0900, Tomasz Figa wrote:
> > > > On Wed, Jul 24, 2019 at 1:31 PM Jungo Lin <jungo.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> > > > > On Tue, 2019-07-23 at 19:21 +0900, Tomasz Figa wrote:
> > > > > > On Thu, Jul 18, 2019 at 1:39 PM Jungo Lin <jungo.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> > > > > > > On Wed, 2019-07-10 at 18:54 +0900, Tomasz Figa wrote:
> > > > > > > > On Tue, Jun 11, 2019 at 11:53:41AM +0800, Jungo Lin wrote:
[snip]
> > > > > > > > > +
> > > > > > > > > +   dev_dbg(dev, "%s: node:%d fd:%d idx:%d\n",
> > > > > > > > > +           __func__,
> > > > > > > > > +           node->id,
> > > > > > > > > +           buf->vbb.request_fd,
> > > > > > > > > +           buf->vbb.vb2_buf.index);
> > > > > > > > > +
> > > > > > > > > +   /* For request buffers en-queue, handled in mtk_cam_req_try_queue */
> > > > > > > > > +   if (vb->vb2_queue->uses_requests)
> > > > > > > > > +           return;
> > > > > > > >
> > > > > > > > I'd suggest removing non-request support from this driver. Even if we end up
> > > > > > > > with a need to provide compatibility for non-request mode, then it should be
> > > > > > > > built on top of the requests mode, so that the driver itself doesn't have to
> > > > > > > > deal with two modes.
> > > > > > > >
> > > > > > >
> > > > > > > The purpose of non-request function in this driver is needed by
> > > > > > > our camera middle-ware design. It needs 3A statistics buffers before
> > > > > > > image buffers en-queue. So we need to en-queue 3A statistics with
> > > > > > > non-request mode in this driver. After MW got the 3A statistics data, it
> > > > > > > will en-queue the images, tuning buffer and other meta buffers with
> > > > > > > request mode. Based on this requirement, do you have any suggestion?
> > > > > > > For upstream driver, should we only consider request mode?
> > > > > > >
> > > > > >
> > > > > > Where does that requirement come from? Why the timing of queuing of
> > > > > > the buffers to the driver is important?
> > > > > >
> > > > > > [snip]
> > > > >
> > > > > Basically, this requirement comes from our internal camera
> > > > > middle-ware/3A hal in user space. Since this is not generic requirement,
> > > > > we will follow your original suggestion to keep the request mode only
> > > > > and remove other non-request design in other files. For upstream driver,
> > > > > it should support request mode only.
> > > > >
> > > >
> > > > Note that Chromium OS will use the "upstream driver" and we don't want
> > > > to diverge, so please make the userspace also use only requests. I
> > > > don't see a reason why there would be any need to submit any buffers
> > > > outside of a request.
> > > >
> > > > [snip]
> > >
> > > Ok, I have raised your concern to our colleagues and let him to discuss
> > > with you in another communication channel.
> > >
> >
> > Thanks!
> >
> > Best regards,
> > Tomasz
>
> Our colleague is preparing material to explain the our 3A/MW design. If
> he is ready, he will discuss this with you.

Thanks!

>
> In the original plan, we will deliver P1 v4 patch set tomorrow (31th
> Jul.). But, there are some comments waiting for other experts' input.
> Do you suggest it is better to resolve all comments before v4 patch set
> submitting or continue to discuss these comments on v4?

For the remaining v4l2-compliance issues, we can postpone them and
keep on a TODO list in the next version.

Best regards,
Tomasz
