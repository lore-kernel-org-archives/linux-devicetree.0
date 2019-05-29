From: Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [RFC PATCH V1 6/6] platform: mtk-isp: Add Mediatek DIP driver
Date: Wed, 29 May 2019 12:38:11 +0900
Message-ID: <CAAFQd5BbrfhjGbKaUi4p6fJJNOKvkZb4_47gw-W8n5fEmaf5XQ@mail.gmail.com>
References: <20190417104511.21514-1-frederic.chen@mediatek.com>
 <20190417104511.21514-7-frederic.chen@mediatek.com>
 <20190509094846.GA65444@google.com>
 <1558466055.15388.342.camel@mtksdccf07> <20190522102514.GA218991@chromium.org>
 <1558619189.7995.27.camel@mtksdccf07>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1558619189.7995.27.camel@mtksdccf07>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Frederic Chen <frederic.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Shik Chen <shik-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?B?U2VhbiBDaGVuZyAo6YSt5piH5byYKQ==?= <Sean.Cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, =?UTF-8?B?UnlubiBXdSAo5ZCz6IKy5oGpKQ==?= <Rynn.Wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, =?UTF-8?B?SG9sbWVzIENoaW91ICjpgrHmjLop?= <holmes.chiou-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, suleiman-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Jerry-ch Chen <Jerry-ch.Chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, =?UTF-8?B?SnVuZ28gTGluICjmnpfmmI7kv4op?= <jungo.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sj Huang <sj.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, yuzhao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, "moderated list:ARM/Mediatek SoC support" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, zwisler-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?Q2hyaXN0aWUgWXUgKOa4uOmbheaDoCk=?= <christie.yu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, list-Y9sIeH5OGRo@public.gmane.org:IOMM
List-Id: devicetree@vger.kernel.org

On Thu, May 23, 2019 at 10:46 PM Frederic Chen
<frederic.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
>
> Dear Tomasz,
>
> Thank you for your comments.
>
>
> On Wed, 2019-05-22 at 19:25 +0900, Tomasz Figa wrote:
> > Hi Frederic,
> >
> > On Wed, May 22, 2019 at 03:14:15AM +0800, Frederic Chen wrote:
> > > Dear Tomasz,
> > >
> > > I appreciate your comment. It is very helpful for us.
> > >
> >
> > You're welcome. Thanks for replying to all the comments. I'll skip those
> > resolved in my reply to keep the message shorter.
> >
> > >
> > > On Thu, 2019-05-09 at 18:48 +0900, Tomasz Figa wrote:
> > > > Hi Frederic,
> > > >
> > > > On Wed, Apr 17, 2019 at 7:45 PM Frederic Chen <frederic.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
[snip]
> > > > Also a general note - a work can be queued only once. This means that
> > > > current code races when two dip_works are attempted to be queued very
> > > > quickly one after another (or even at the same time from different threads).
> > > >
> > > > I can think of two potential options for fixing this:
> > > >
> > > > 1) Loop in the work function until there is nothing to queue to the hardware
> > > >    anymore - but this needs tricky synchronization, because there is still
> > > >    short time at the end of the work function when a new dip_work could be
> > > >    added.
> > > >
> > > > 2) Change this to a kthread that just keeps running in a loop waiting for
> > > >    some available dip_work to show up and then sending it to the firmware.
> > > >    This should be simpler, as the kthread shouldn't have a chance to miss
> > > >    any dip_work queued.
> > > >
> > > > I'm personally in favor of option 2, as it should simplify the
> > > > synchronization.
> > > >
> > >
> > > I would like to re-design this part with a kthread in the next patch.
> >
> > Actually I missed another option. We could have 1 work_struct for 1
> > request and then we could keep using a workqueue. Perhaps that could be
> > simpler than a kthread.
> >
> > Actually, similar approach could be used for the dip_runner_func.
> > Instead of having a kthread looping, we could just have another
> > workqueue and 1 dip_runner_work per 1 request. Then we wouldn't need to
> > do the waiting loop ourselves anymore.
> >
> > Does it make sense?
>
> Yes, it make sense. Let me summarize the modification about the flow.
>
> First, we will have two work_struct in mtk_dip_request.
>
> struct mtk_dip_request {
>         struct media_request request;
>         //...
>         /* Prepare DIP part hardware configurtion */
>         struct mtk_dip_hw_submit_work submit_work;
>         /* Replace dip_running thread jobs*/
>         struct mtk_dip_hw_composing_work composing_work;
>         /* Only for composing error handling */
>         struct mtk_dip_hw_mdpcb_timeout_work timeout_work;
> };
>
> Second, the overall flow of handling each request is :
>
> 1. mtk_dip_hw_enqueue calls queue_work() to put submit_work into its
>    workqueue
> 2. submit_work sends IMG_IPI_FRAME command to SCP to prepare DIP
>    hardware configuration
> 3. dip_scp_handler receives the IMG_IPI_FRAME result from SCP
> 4. dip_scp_handler calls queue_work() to put composing_work (instead
>    of original dip_running thread jobs) into its workqueue
> 5. composing_work calls dip_mdp_cmdq_send() to finish the mdp part tasks
> 6. dip_mdp_cb_func() trigged by MDP driver calls vb2_buffer_done to
>    return the buffer (no workqueue required here)
>

Sounds good to me, but actually then simply making the workqueues
freezable doesn't solve the suspend/resume problem, because the work
functions wouldn't wait for the firmware/hardware completion anymore.
That's also okay, but in this case we need to add some code to suspend
to wait for any pending operations to complete.

Best regards,
Tomasz
