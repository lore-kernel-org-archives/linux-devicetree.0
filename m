From: =?UTF-8?Q?=27Ond=C5=99ej_Jirman=27_via_linux=2Dsunxi?= <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Subject: Re: Re: [PATCH v2 00/10] Allwinner A64/H6 IR support
Date: Tue, 28 May 2019 20:04:47 +0200
Message-ID: <20190528180447.zlrdfmn73fntnf4n@core.my.home>
References: <20190526222536.10917-1-peron.clem@gmail.com>
 <20190527134805.j7t4ffstrnhdml47@core.my.home>
 <CAJiuCcdnQa0TArduT4yBbUyd+dOaM0cQ1JcRUQLXLR6s_5e8sA@mail.gmail.com>
 <20190527163117.hpealt6cttqzqdxz@core.my.home>
 <20190527172337.5qxh5qeqnul55gsb@core.my.home>
 <CAJiuCccnRCqez2uG-pU8XY4Z=5S8rDwFB3rgsBovPHY1Uxyazw@mail.gmail.com>
 <20190527193016.yxngu5grsqnctx3z@core.my.home>
 <20190527195330.pugb7ypvnyv32fug@core.my.home>
 <CAJiuCccpnEqw_tGXST+WtGmZLbE+=wN1Hn9HKrk1+4WsW-abiA@mail.gmail.com>
Reply-To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDXLF6FR5INBBQPQWXTQKGQER3BST3A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAJiuCccpnEqw_tGXST+WtGmZLbE+=wN1Hn9HKrk1+4WsW-abiA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Cl=C3=A9ment,

On Tue, May 28, 2019 at 06:21:19PM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> Hi Ond=C5=99ej,
>=20
> On Mon, 27 May 2019 at 21:53, 'Ond=C5=99ej Jirman' via linux-sunxi
> <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org> wrote:
> >
> > Hi Cl=C3=A9ment,
> >
> > On Mon, May 27, 2019 at 09:30:16PM +0200, verejna wrote:
> > > Hi Cl=C3=A9ment,
> > >
> > > On Mon, May 27, 2019 at 08:49:59PM +0200, Cl=C3=A9ment P=C3=A9ron wro=
te:
> > > > Hi Ondrej,
> > > >
> > > > >
> > > > > I'm testing on Orange Pi 3.
> > > > >
> > > > > With your patches, I get kernel lockup after ~1 minute of use (ss=
h stops
> > > > > responding/serial console stops responding). I don't have RC cont=
roller to test
> > > > > the CIR. But just enabling the CIR causes kernel to hang shortly =
after boot.
> > > > >
> > > > > I tried booting multiple times. Other results:
> > > > >
> > > > > boot 2:
> > > > >
> > > > > - ssh hangs even before connecting (ethernet crashes/is reset)
> > > > >
> > > > > INFO: rcu_sched detected stalls on CPUs/tasks:
> > > > > rcu:    0-....: (1 GPs behind) idle=3D64a/0/0x3 softirq=3D4091/40=
91 fqs=3D2437
> > > > > dwmac-sun8i 5020000.ethernet eth0: Reset adapter.
> > > > > rcu: INFO: rcu_sched detected expedited stalls on CPUs/tasks: { 0=
-... } 5696 jiffies s: 81 root: 0x1/.
> > > > > rcu: blocking rcu_node structures:
> > > > >  rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> > > > > rcu:    0-....: (1 GPs behind) idle=3D64a/0/0x3 softirq=3D4091/40=
91 fqs=3D9714
> > > > > rcu: INFO: rcu_sched detected expedited stalls on CPUs/tasks: { 0=
-... } 21568 jiffies s: 81 root: 0x1/.
> > > > > rcu: blocking rcu_node structures:
> > > > > rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> > > > > rcu:    0-....: (1 GPs behind) idle=3D64a/0/0x3 softirq=3D4091/40=
91 fqs=3D17203
> > > > >
> > > > > above messages appear regularly.
> > > > >
> > > > > boot 3:
> > > > >
> > > > > rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> > > > > rcu:    0-....: (9 GPs behind) idle=3D992/0/0x3 softirq=3D6123/61=
23 fqs=3D2600
> > > > >
> > > > >
> > > > > Sometimes serial console keeps working. Sometimes it locks up too=
 (but not
> > > > > frequently). Storage locks up always (any program that was not ru=
n before
> > > > > the crash can't be started and lock up the kernel hard, programs =
that
> > > > > were executed prior, can be run again).
> > > > >
> > > > >
> > > > > Exactly the same kernel build on H5 seems to work (or at least I =
was not able to
> > > > > trigger the crash). So this seems to be limited to H6 for now.
> > > > >
> > > > > I suspect that the crash occurs sooner if I vary the light (turn =
on/off the table
> > > > > lamp light).
> > > > >
> > > > > Without your patches, everything works fine on H6, and I never se=
e
> > > > > crashes/lockups.
> > > > >
> > > > > I tired physically covering the IR receiver, and that helps preve=
nting the
> > > > > crash. As soon as I uncover it, the crash happens again in 1s or =
so:
> > > > >
> > > > > rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> > > > > rcu:    0-....: (1 GPs behind) idle=3D4ea/0/0x3 softirq=3D4483/44=
84 fqs=3D2444
> > > > > rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> > > > > rcu:    0-....: (1 GPs behind) idle=3D4ea/0/0x3 softirq=3D4483/44=
84 fqs=3D9777
> > > > >
> > > > > This time I got the hung task and reboot: (probably not directly =
related)
> > > > >
> > > > > INFO: task find:560 blocked for more than 120 seconds.
> > > > >       Not tainted 5.2.0-rc2+ #7
> > > > > "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this =
message.
> > > > > find            D    0   560    551 0x00000000
> > > > > Call trace:
> > > > >  __switch_to+0x6c/0x90
> > > > >  __schedule+0x1f4/0x578
> > > > >  schedule+0x28/0xa8
> > > > >  io_schedule+0x18/0x38
> > > > >  __lock_page+0x12c/0x208
> > > > >  pagecache_get_page+0x238/0x2e8
> > > > >  __get_node_page+0x6c/0x310
> > > > >  f2fs_get_node_page+0x14/0x20
> > > > >  f2fs_iget+0x70/0xc60
> > > > >  f2fs_lookup+0xcc/0x218
> > > > >  __lookup_slow+0x78/0x160
> > > > >  lookup_slow+0x3c/0x60
> > > > >  walk_component+0x1e4/0x2e0
> > > > >  path_lookupat.isra.13+0x5c/0x1e0
> > > > >  filename_lookup.part.23+0x6c/0xe8
> > > > >  user_path_at_empty+0x4c/0x60
> > > > >  vfs_statx+0x78/0xd8
> > > > >  __se_sys_newfstatat+0x24/0x48
> > > > >  __arm64_sys_newfstatat+0x18/0x20
> > > > >  el0_svc_handler+0x9c/0x170
> > > > >  el0_svc+0x8/0xc
> > > > > Kernel panic - not syncing: hung_task: blocked tasks
> > > > > CPU: 1 PID: 34 Comm: khungtaskd Not tainted 5.2.0-rc2+ #7
> > > > > Hardware name: OrangePi 3 (DT)
> > > > > Call trace:
> > > > >  dump_backtrace+0x0/0xf8
> > > > >  show_stack+0x14/0x20
> > > > >  dump_stack+0xa8/0xcc
> > > > >  panic+0x124/0x2dc
> > > > >  proc_dohung_task_timeout_secs+0x0/0x40
> > > > >  kthread+0x120/0x128
> > > > >  ret_from_fork+0x10/0x18
> > > > > SMP: stopping secondary CPUs
> > > > > Kernel Offset: disabled
> > > > > CPU features: 0x0002,20002000
> > > > > Memory Limit: none
> > > > > Rebooting in 3 seconds..
> > > > >
> > > > >
> > > > > Meanwhile H5 based board now runs for 15 minutes without issues.
> > > > >
> > > > > So to sum up:
> > > > >
> > > > > - these crashes are definitely H6 IR related
> > > > >   - the same kernel, on H5 works
> > > > >   - covering the sensor prevents the crashes on H6
> > > > >
> > > > > So we should probably hold on with the series, until this is figu=
red out.
> > > >
> > > > Thanks for testing, but I think it's more hardware related.
> > > > It seems that your IR is flooded or misconfigured for your board.
> > > > Could you add a simple print in the "sunxi_ir_irq"
> > >
> > > Yes, I get flood of IRQs with status =3D 0x30. (after I turn on the l=
amp,
> > > but it persists even after I turn it off and cover the IR sensor).
> >
> > Interestingly, status also contains RAC, and it's 0 in this case. So th=
e
> > interrupt if firing with "No available data in RX FIFO" repeatedly. Reg=
ardless
> > of input.
> >
> > So there's something else up.
>=20
> Really weird indeed...
>=20
> I have pushed a new version, where I didn't enabled the support for
> others H6 board and the cover letter include a link to this thread.
>=20
> It would be great if other sunxi users could test this series, to
> check if this issue in present in other OPi3 / Pine H64.

I don't know if this is enough. I'd rather prefer if the driver has a way
of detecting this situation and shutting the module down, at the very least=
,
instead of taking down the entire system with IRQ flood.

It may be detectable by checking RAC =3D=3D 0 when RX FIFO available interr=
upt
flag is set.

Otherwise, this will eventually be forgotten (cover letters are not even st=
ored
in git), and someone will fall into the trap again, after enabling r_ir on
their board, and end up chasing their tail for a day. I've initially only f=
ound
this is IR driver issue after a long unpleasant debugging session, chasing =
other
more obvious ideas (as when this happens there's absolutely nothing in the =
log
indicating this is IR issue).

regards,
	o.

> Regards,
> Cl=C3=A9ment
> >
> > regards,
> >         o.
> >
> > > That's weird, because on H6 in CIR_RXSTA, bit 5 is undefined but corr=
esponding
> > > bit in CIR_RXINT is DRQ_EN (RX FIFO DMA Enable)
> > >
> > > So I'm not sure what it could be flooded with and why IRQs keep being
> > > fired, even with no sensor input after the FIFO is read.
> > >
> > > regards,
> > >       o.
> > >
> > > > If it's confirmed, maybe tweak the threshold configuration or
> > > > implement the new active_threshold will help.
> > > >
> > > > With my hardware Beelink GS1 and on Jernej's board (A64) there is n=
o issue.
> > > >
> > > > I will disable all the other H6 boards until someone test it.
> > > >
> > > > Regards,
> > > > Cl=C3=A9ment
> > >
> > > _______________________________________________
> > > linux-arm-kernel mailing list
> > > linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> > > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> >
> > --
> > You received this message because you are subscribed to the Google Grou=
ps "linux-sunxi" group.
> > To unsubscribe from this group and stop receiving emails from it, send =
an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> > To view this discussion on the web, visit https://groups.google.com/d/m=
sgid/linux-sunxi/20190527195330.pugb7ypvnyv32fug%40core.my.home.
> > For more options, visit https://groups.google.com/d/optout.
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
To view this discussion on the web, visit https://groups.google.com/d/msgid=
/linux-sunxi/20190528180447.zlrdfmn73fntnf4n%40core.my.home.
For more options, visit https://groups.google.com/d/optout.
