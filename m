From: Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v2 1/2] ARM64: arch_timer: Work around QorIQ Erratum
 A-008585
Date: Tue, 28 Jun 2016 21:05:49 -0500
Message-ID: <1467165949.32358.16.camel@buserror.net>
References: <1463114260-8724-1-git-send-email-oss@buserror.net>
	 <20160513112441.200f4349@arm.com> <1466559926.22191.203.camel@buserror.net>
	 <5771267D.7030102@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5771267D.7030102-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stuart.yoder-3arQi8VN3Tc@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 2016-06-27 at 14:13 +0100, Marc Zyngier wrote:
> On 22/06/16 02:45, Scott Wood wrote:
> >=20
> > On Fri, 2016-05-13 at 11:24 +0100, Marc Zyngier wrote:
> > >=20
> > > On Thu, 12 May 2016 23:37:39 -0500
> > > Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org> wrote:
> > >=20
> > > > +{
> > > > +	u64 cval_old, cval_new;
> > > > +	int timeout =3D 200;
> > > Can we have a comment on how this value has been chosen?=C2=A0
> > It's an arbitrary value well beyond the point at which we've seen i=
t fail.
> So can we please have a comment *in the code* that explains how this
> value has been picked?

Sure, if you want. =C2=A0I just wasn't sure there was much value in a c=
omment that
essentially says that there's no special meaning to this particular val=
ue.

> > > > int
> > > > access, unsigned long evt,
> > > > =C2=A0	arch_timer_reg_write(access, ARCH_TIMER_REG_CTRL, ctrl, =
clk);
> > > > =C2=A0}
> > > > =C2=A0
> > > > +#ifdef CONFIG_ARM64
> > > > +static __always_inline void rewrite_tval(const int access,
> > > > +		unsigned long evt, struct clock_event_device *clk)
> > > > +{
> > > > +	u64 cval_old, cval_new;
> > > > +	int timeout =3D 200;
> > > > +
> > > > +	do {
> > > > +		cval_old =3D __arch_counter_get_cntvct();
> > > > +		arch_timer_reg_write(access, ARCH_TIMER_REG_TVAL,
> > > > evt,
> > > > clk);
> > > > +		cval_new =3D __arch_counter_get_cntvct();
> > > Don't you need to guarantee the order of accesses here?
> > I'm not 100% sure.=C2=A0=C2=A0The erratum workaround sample code do=
esn't show any
> > barriers, and adding more barriers could make it harder for the loo=
p to
> > successfully complete.=C2=A0=C2=A0There's already a barrier after t=
he write, so the
> > only
> > concern should be whether the timer read could be reordered after t=
he
> > timer
> > write, which could cause the loop to exit even if the write was bad=
=2E=C2=A0=C2=A0Do
> > you
> > know if A53 or A57 will reorder a counter read relative to a tval w=
rite?
> I can't see any absolute guarantee that they wouldn't be reordered (b=
ut
> I have no insight on the micro-architecture either). I'd rather err o=
n
> the side of caution here.

OK, I'll see how well it works with the added barrier.

> > > > =C2=A0			clk->set_state_shutdown =3D
> > > > arch_timer_shutdown_virt;
> > > > =C2=A0			clk->set_state_oneshot_stopped =3D
> > > > arch_timer_shutdown_virt;
> > > > =C2=A0			clk->set_next_event =3D
> > > > arch_timer_set_next_event_virt;
> > > > +
> > > > +#ifdef CONFIG_ARM64
> > > > +			if
> > > > (static_branch_unlikely(&arch_timer_read_ool_enabled))
> > > > +				clk->set_next_event =3D
> > > > +					arch_timer_set_next_event_vir
> > > > t_er
> > > > rata;
> > > On the same line, please.
> > I was trying to avoid going beyond 80 columns.
> Please ignore what checkpatch says. Readability is more important (an=
d
> I've given up using a vintage vt100...).

I'm not using a vintage vt100 either but I still have (approximately) 8=
0-
column terminals, because I like having two terminals side-by-side with=
 a
reasonable font size... and since different people have different termi=
nal
setups, CodingStyle specifies a standard limit.

I think I can make it moot with the suggestion to have a helper functio=
n,
though.

> > > =C2=A0	} else {
> > > > =C2=A0		arch_timer_read_counter =3D
> > > > arch_counter_get_cntvct_mem;
> > > > =C2=A0
> > > > @@ -763,6 +870,9 @@ static void __init arch_timer_of_init(struc=
t
> > > > device_node *np)
> > > > =C2=A0
> > > > =C2=A0	arch_timer_c3stop =3D !of_property_read_bool(np, "always=
-on");
> > > > =C2=A0
> > > > +	if (of_property_read_bool(np, "fsl,erratum-a008585"))
> > > > +		static_branch_enable(&arch_timer_read_ool_enabled);
> > > > +
> > > > =C2=A0	/*
> > > > =C2=A0	=C2=A0* If we cannot rely on firmware initializing the t=
imer
> > > > registers
> > > > then
> > > > =C2=A0	=C2=A0* we should use the physical timers instead.
> > > An outstanding question is how we're going to deal with this in K=
VM,
> > > because a guest absolutely needs to know about it (I can definite=
ly see
> > > time jumping in guests running on a LS2080).
> > The property will need to be in the guest's device tree.=C2=A0=C2=A0=
I'm not too
> > familiar
> > with how KVM handles device trees on arm...=C2=A0=C2=A0From looking=
 at the QEMU
> > source
> > it seems that the dtb is passed in by the user.=C2=A0=C2=A0So eithe=
r that dtb will
> > need
> > the erratum property in it, or QEMU (and KVM tool?) would need to p=
atch it
> > =C2=A0into the guest dtb based on seeing the property in /proc/devi=
ce-tree.
> There is no guarantee that the host device tree is always accessible =
to
> userspace. So we're probably looking at requiring a new KVM device AP=
I
> that would expose the timer properties, one of them being this erratu=
m.
> That's certainly going to be fun to handle.

KVM on PPC relies on /proc/device-tree -- when would it not be availabl=
e?
=C2=A0Where is the dtb passed to QEMU expected to come from?

In any case, let's get the kernel sorted out first.

-Scott

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
