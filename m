From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH] of/irq: Fix device_node refcount in of_irq_parse_raw()
Date: Mon, 30 Dec 2013 14:59:37 +1100
Message-ID: <1388375977.4373.26.camel@pasglop>
References: <1387301573-30502-1-git-send-email-clg@fr.ibm.com>
	 <1388371049.4373.22.camel@pasglop>
	 <CAL_JsqJRtk+U4nA7hh9Kh2C4UgbWP6V7sYMnTpAooR_zaySZaw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJRtk+U4nA7hh9Kh2C4UgbWP6V7sYMnTpAooR_zaySZaw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg-NmTC/0ZBporQT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linux Kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, 2013-12-29 at 20:42 -0600, Rob Herring wrote:
> On Sun, Dec 29, 2013 at 8:37 PM, Benjamin Herrenschmidt
> <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
>=20
>         On Tue, 2013-12-17 at 18:32 +0100, C=C3=A9dric Le Goater wrot=
e:
>         > Commit 2361613206e6, "of/irq: Refactor interrupt-map
>         parsing" changed
>         > the refcount on the device_node causing an error in
>         of_node_put():
>        =20
>        =20
>         Grant, Thierry, this is a regression, please send to Linus
>         ASAP...
>        =20
>=20
>=20
> I'm working on doing that right this moment.

Thanks, looks like I'm not the only trying to get some work done
today :)

Cheers,
Ben.

>=20
> Rob
>=20
>         Cheers,
>         Ben.
>        =20
>         > ERROR: Bad of_node_put() on /pci@800000020000000
>         > CPU: 0 PID: 1 Comm: swapper/0 Not tainted 3.13.0-rc3-dirty
>         #2
>         > Call Trace:
>         > [c00000003e403500] [c0000000000144fc] .show_stack+0x7c/0x1f=
0
>         (unreliable)
>         > [c00000003e4035d0] [c00000000070f250] .dump_stack+0x88/0xb4
>         > [c00000003e403650] [c0000000005e8768] .of_node_release
>         +0xd8/0xf0
>         > [c00000003e4036e0] [c0000000005eeafc] .of_irq_parse_one
>         +0x10c/0x280
>         > [c00000003e4037a0] [c0000000005efd4c] .of_irq_parse_pci
>         +0x3c/0x1d0
>         > [c00000003e403840] [c000000000038240] .pcibios_setup_device
>         +0xa0/0x2e0
>         > [c00000003e403910]
>         [c0000000000398f0] .pcibios_setup_bus_devices+0x60/0xd0
>         > [c00000003e403990] [c00000000003b3a4] .__of_scan_bus
>         +0x1a4/0x2b0
>         > [c00000003e403a80] [c00000000003a62c] .pcibios_scan_phb
>         +0x30c/0x410
>         > [c00000003e403b60] [c0000000009fe430] .pcibios_init
>         +0x7c/0xd4
>         >
>         > This patch adjusts the refcount in the walk of the interrup=
t
>         tree.
>         > When a match is found, there is no need to increase the
>         refcount
>         > on 'out_irq->np' as 'newpar' is already holding a ref. The
>         refcount
>         > balance between 'ipar' and 'newpar' is maintained in the
>         skiplevel:
>         > goto label.
>         >
>         > This patch also removes the usage of the device_node
>         variable 'old'
>         > which seems useless after the latest changes.
>         >
>         > Signed-off-by: C=C3=A9dric Le Goater <clg-NmTC/0ZBporQT0dZR+AlfA@public.gmane.org>
>         > ---
>         >
>         > This patch was tested on powerpc, pseries and powernv. This
>         is a
>         > new area for me so I might have missed a path. Please take =
a
>         look.
>         >
>         > We could now introduce an helper routine to look for
>         #address-cells in
>         > of_irq_parse_raw(). This can be the subject of another
>         patch.
>         >
>         > Thanks,
>         >
>         > C.
>         >
>         >  drivers/of/irq.c |    5 +----
>         >  1 file changed, 1 insertion(+), 4 deletions(-)
>         >
>         > diff --git a/drivers/of/irq.c b/drivers/of/irq.c
>         > index 786b0b47fae4..27212402c532 100644
>         > --- a/drivers/of/irq.c
>         > +++ b/drivers/of/irq.c
>         > @@ -165,7 +165,6 @@ int of_irq_parse_raw(const __be32 *addr=
,
>         struct of_phandle_args *out_irq)
>         >               if (of_get_property(ipar,
>         "interrupt-controller", NULL) !=3D
>         >                               NULL) {
>         >                       pr_debug(" -> got it !\n");
>         > -                     of_node_put(old);
>         >                       return 0;
>         >               }
>         >
>         > @@ -250,8 +249,7 @@ int of_irq_parse_raw(const __be32 *addr=
,
>         struct of_phandle_args *out_irq)
>         >                * Successfully parsed an interrrupt-map
>         translation; copy new
>         >                * interrupt specifier into the out_irq
>         structure
>         >                */
>         > -             of_node_put(out_irq->np);
>         > -             out_irq->np =3D of_node_get(newpar);
>         > +             out_irq->np =3D newpar;
>         >
>         >               match_array =3D imap - newaddrsize - newintsi=
ze;
>         >               for (i =3D 0; i < newintsize; i++)
>         > @@ -268,7 +266,6 @@ int of_irq_parse_raw(const __be32 *addr=
,
>         struct of_phandle_args *out_irq)
>         >       }
>         >   fail:
>         >       of_node_put(ipar);
>         > -     of_node_put(out_irq->np);
>         >       of_node_put(newpar);
>         >
>         >       return -EINVAL;
>        =20
>        =20
>         --
>        =20
>         To unsubscribe from this list: send the line "unsubscribe
>         devicetree" in
>         the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>         More majordomo info at
>          http://vger.kernel.org/majordomo-info.html
>        =20
>=20
>=20


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
