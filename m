From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH V2 2/2] mfd: stmpe: Extend DT support in stmpe driver
Date: Fri, 23 Nov 2012 09:23:28 +0000
Message-ID: <20121123092328.GB17471@gmail.com>
References: <f1d508c64a01dfd492a1ab1fda28af4b7647d8ab.1353560936.git.viresh.kumar@linaro.org>
 <b81641051dad9660b72b0028d001e5620d901160.1353560936.git.viresh.kumar@linaro.org>
 <20121122112451.GE4328@gmail.com>
 <CAKohpo=F91sZ7St3XVXqwAEgmSWXjAxxXwRs1RD5qPyW99P1vA@mail.gmail.com>
 <20121122154612.GC10986@gmail.com>
 <CAKohpok6v65TH5yZAthyxcH7bCVgF8A8m2bY_mp3yS_Y_yH1Xw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAKohpok6v65TH5yZAthyxcH7bCVgF8A8m2bY_mp3yS_Y_yH1Xw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: sameo@linux.intel.com, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, spear-devel@list.st.com, Vipul Kumar Samar <vipulkumar.samar@st.com>
List-Id: devicetree@vger.kernel.org

On Thu, 22 Nov 2012, Viresh Kumar wrote:

> On 22 November 2012 21:16, Lee Jones <lee.jones@linaro.org> wrote:
> >> >> diff --git a/Documentation/devicetree/bindings/mfd/stmpe.txt b/=
Documentation/devicetree/bindings/mfd/stmpe.txt
> >> >> +- irq-over-gpio: bool, true if gpio is used to get irq
> >> >> +- irq-gpios: gpio number over which irq will be requested (sig=
nificant only if
> >> >> +  irq-over-gpio is true)
> >> >
> >> > You don't need these. Use gpio_to_irq() instead.
> >>
> >> I am passing gpio numbers here and am doing gpio_to_irq() in drive=
r.
> >> Didn't get this one :(
> >
> > For a start you have 'irq-over-gpio' in the binding document and De=
vice Tree
> > and 'irq_over_gpio' in the code. Has it even been tested?
> >
> > GPIOs are used as IRQ lines in many other previously DT:ed drivers.=
 Take a
> > look to see how they are handled without adding unnecessary DT bind=
ings.
>=20
> I already knew it, should have picked that up. :(
>=20
> >> stmpe is an interrupt controller for the IP's which are present in=
side
> >> it: gpio, adc.
> >> But interrupt lines for them are managed by stmpe driver internall=
y. So should
> >> we really add interrupt-controller for it?
> >
> > You can't manage IRQ lines internally, you have to go through
> > the IRQ subsystem. When you request an IRQ via device tree you
> > will do so like this:
>=20
> By that i meant, there is no external node which would have stmpe as
> interrupt controller. Because all of them would be its child node.
>=20
> This is guaranteed because stmpe is an external device is present on =
board.
> So, it will have its entry in board dts file, and so wouldn't be
> scattered in different
> files.

It doesn't matter how it's wired up.=20

If another node references it as it's IRQ controller you have to
declare it as one using the interrupt-controller binding.

> > The STMPE GPIO controller can't be used by Device Tree yet in any c=
ase,
> > because it doesn't have an IRQ domain. This is compulsory, or it wo=
n't
> > work. Have you tried to test this functionality yet?
>=20
> I don't have SPEAr board to test it anymore. I have moved out of ST n=
ow and
> working in linaro as ARM asignee. Just pushing these as an part time =
activity.

Surely you can't push patches which haven't been tested?!

Try to get yourself some hardware. Does anyone near you have an HREF?

In the mean-time, I will write you an IRQ domain.

> Though ST guys would have tested stmpe, but stmpe-gpio, i am not sure=
 about.

It needs to be tested before being accpeted.

> > I didn't go through them, but are you sure that:
> >
> > 1. Can I do without them?
> >    1.1 Can I derive the configuration from other things?
> >    2.2 Are they _really_ required, or am I just blindly copying pla=
tform data?
> > 2. Does a similar binding already exist?
> > 3. Can other drivers make use of them?
> >    3.1 If so, create a generic binding
> >    3.2 If not, prepend the binding with "<vendor>,"
>=20
> I will go through them again.

Thanks.

--=20
Lee Jones
Linaro ST-Ericsson Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
