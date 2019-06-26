From: Tomasz Figa <tfiga@chromium.org>
Subject: Re: [RFC v2 4/4] media: platform: mtk-mdp3: Add Mediatek MDP3 driver
Date: Wed, 26 Jun 2019 13:41:04 +0900
Message-ID: <CAHD77HkJ8aHgKugC3+Du-OoqP9yg0yKt+-_RyL1cZ4e5QkuUhQ@mail.gmail.com>
References: <20190516032332.56844-1-daoyuan.huang@mediatek.com>
 <20190516032332.56844-5-daoyuan.huang@mediatek.com>
 <20190604112039.GA12168@chromium.org>
 <CAPBb6MUCYK3eyk5Oq_p8yBvFh1EszzPDcvbB0VLTu_KKzCLTMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAPBb6MUCYK3eyk5Oq_p8yBvFh1EszzPDcvbB0VLTu_KKzCLTMA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alexandre Courbot <acourbot@chromium.org>
Cc: devicetree@vger.kernel.org, =?UTF-8?B?U2VhbiBDaGVuZyAo6YSt5piH5byYKQ==?= <Sean.Cheng@mediatek.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, =?UTF-8?B?UnlubiBXdSAo5ZCz6IKy5oGpKQ==?= <Rynn.Wu@mediatek.com>, =?UTF-8?B?Q2hyaXN0aWUgWXUgKOa4uOmbheaDoCk=?= <christie.yu@mediatek.com>, srv_heupstream <srv_heupstream@mediatek.com>, Daoyuan Huang <daoyuan.huang@mediatek.com>, =?UTF-8?B?SG9sbWVzIENoaW91ICjpgrHmjLop?= <holmes.chiou@mediatek.com>, Jerry-ch Chen <Jerry-ch.Chen@mediatek.com>, =?UTF-8?B?SnVuZ28gTGluICjmnpfmmI7kv4op?= <jungo.lin@mediatek.com>, Sj Huang <sj.huang@mediatek.com>, Yu Zhao <yuzhao@chromium.org>, Hans Verkuil <hans.verkuil@cisco.com>, Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, Ross Zwisler <zwisler@chromium.org>, Frederic Chen <frederic.chen@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, moderated list:ARM/Mediatek SoC support
List-Id: devicetree@vger.kernel.org

On Thu, Jun 20, 2019 at 1:48 PM Alexandre Courbot <acourbot@chromium.org> wrote:
>
> On Tue, Jun 4, 2019 at 8:20 PM Tomasz Figa <tfiga@chromium.org> wrote:
> > > +
> > > +     ret = mdp_vpu_get_locked(mdp);
> > > +     if (ret < 0)
> > > +             goto err_load_vpu;
> >
> > This shouldn't happen in open(), but rather the latest possible point in
> > time. If one needs to keep the VPU running for the time of streaming, then
> > it should be start_streaming. If one can safely turn the VPU off if there is
> > no frame queued for long time, it should be just in m2m job_run.
> >
> > Generally the userspace should be able to
> > just open an m2m device for querying it, without any side effects like
> > actually powering on the hardware or grabbing a hardware instance (which
> > could block some other processes, trying to grab one too).
>
> OTOH looking at the code of mdp_vpu_get_locked(), we do the whole
> rproc_boot and VPU init procedure if we were the only user. So I can
> understand we want to avoid doing this too often.
>
> Maybe mdp_vpu_get_locked() can be reorganized in a better way. I feel
> like the call to mdp_vpu_register() should be done in probe, and maybe
> we can use runtime PM (with a reasonable timeout) to control the rproc
> and VPU init?

I think it depends on when exactly the rproc and VPU need stay
initialized. In general, we want to turn off as much as possible as
quickly as possible, but keeping in mind any turn on latencies.

For example. if it takes 10 ms to boot rproc/VPU, we probably
shouldn't turn it off unless we already spent 20-30 ms idling, which
could be handled with runtime PM with (delayed) autosuspend. However,
things like clock gating are normally very fast, so we could just stop
any clocks as soon as frame processing ends and restart when next
frame is getting scheduled and if we use autosuspend, we wouldn't be
able to do it using PM runtime.

My point was that just open() is not the right place for doing this.
Any later stage should be okay, as long as it suits the hardware
architecture.

Best regards,
Tomasz
