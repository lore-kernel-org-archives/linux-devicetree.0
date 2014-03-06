From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [Linux-kernel] [PATCH] ARM: kernel: respect device tree status
 of cpu nodes
Date: Thu, 6 Mar 2014 16:51:37 +0000
Message-ID: <20140306165137.GC13346@red-moon>
References: <1393240960-31846-1-git-send-email-j@bitron.ch>
 <53178A03.3090004@codeaurora.org>
 <5318472A.5060700@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5318472A.5060700-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Cc: "linux-kernel-81qHHgoATdFT9dQujB1mzip2UmYkHbXO@public.gmane.org" <linux-kernel-81qHHgoATdFT9dQujB1mzip2UmYkHbXO@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

[CC'in BenH and Grant to check how this is handled in powerPC]

On Thu, Mar 06, 2014 at 10:00:10AM +0000, Ben Dooks wrote:
> On 05/03/14 20:33, Stephen Boyd wrote:
> > +Lorenzo
> >
> > On 02/24/14 03:22, J=FCrg Billeter wrote:
> >> Skip 'disabled' cpu nodes when building the cpu logical map. This =
avoids
> >> booting cpus that have been disabled in the device tree.
> >>
> >> Signed-off-by: J=FCrg Billeter <j@bitron.ch>
> >> Reviewed-by: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
> >> ---
> >>   arch/arm/kernel/devtree.c | 4 ++++
> >>   1 file changed, 4 insertions(+)
> >>
> >> diff --git a/arch/arm/kernel/devtree.c b/arch/arm/kernel/devtree.c
> >> index 739c3df..9aed299 100644
> >> --- a/arch/arm/kernel/devtree.c
> >> +++ b/arch/arm/kernel/devtree.c
> >> @@ -95,6 +95,10 @@ void __init arm_dt_init_cpu_maps(void)
> >>   		if (of_node_cmp(cpu->type, "cpu"))
> >>   			continue;
> >>
> >> +		/* Check if CPU is enabled */
> >> +		if (!of_device_is_available(cpu))
> >> +			continue;
> >> +
> >>   		pr_debug(" * %s...\n", cpu->full_name);
> >>   		/*
> >>   		 * A device tree containing CPU nodes with missing "reg"
> >
> > This doesn't follow the ePAPR spec. According to ePAPR status=3D"di=
sabled"
> > in a cpu node means "the cpu is in a quiescent state" and one can e=
nable
> > it by using the "enable-method". At the least, we should document t=
his
> > in bindings/arm/cpus.txt if we can all agree that we want this
> > definition of disabled.
>=20
> My view was that disabled should be the same as for the device case
> as it makes sense that way.

Ok, it has been brought up before.

ePAPR v1.1, 2.3.4 "status"

"disabled" - Indicates that the device is not presently operational, bu=
t
             it might become operational in the future (for example,
             something is not plugged in, or switched off).
             Refer to the device binding for details on what disabled m=
eans
             for a given device.

So "disabled" for devices does not read that different to me to what
Stephen mentioned for a CPU.

After all you just want the CPU node to be ignored, and that's not a CP=
U
status, it is a DT trick to use one .dtsi for multiple boot scenarios.

I wonder how the status property has been used on powerPC.

By grepping the sources, it is checked in arch/powerpc/kernel/prom_init=
=2Ec
and that's just to check CPU that are already in status =3D=3D"okay", s=
o
they can be put in a holding loop (I guess).

It should be fine to deviate from the ePAPR and consider using:

status =3D "disabled"

for your aim (it has been ignored so far on all ARM platforms I am awar=
e
of, so this should not break the kernel).

We need to update cpus.txt accordingly and override it for ARM.

> We have a position where we want to use the .dtsi files but not all
> cpus are available to the Linux. If we cannot use disabled then we
> need some other method to say this cpu node is not available, so
> please do not try and bring it online (saves boot time waiting for
> CPU nodes that cannot online)

Understood, see above.

Lorenzo

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
