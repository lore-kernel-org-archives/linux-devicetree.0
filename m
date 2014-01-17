From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH v7 0/2] ohci and ehci-platform clks, phy and dt support
Date: Fri, 17 Jan 2014 12:12:29 -0500 (EST)
Message-ID: <Pine.LNX.4.44L0.1401171053180.1162-100000@iolanthe.rowland.org>
References: <2909743.WgOIUglCS0@lenovo>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2909743.WgOIUglCS0@lenovo>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 16 Jan 2014, Florian Fainelli wrote:

> Le mercredi 15 janvier 2014, 15:26:21 Alan Stern a =E9crit :
> > On Wed, 15 Jan 2014, Hans de Goede wrote:
> > > Hi All,
> > >=20
> > > This version of my ohci and ehci-platform clks, phy and dt suppor=
t
> > > patch-set, really fixes the 2 small bugs Alan found.
> >=20
> > All okay -- this time I can't find anything to complain about.  :-)
>=20
> There is one minor issue; which is that the ehci binding claims the d=
river=20
> supports the following optional boolean properties:
>=20
> - big-endian-regs : boolean, set this for hcds with big-endian regist=
ers
> - big-endian-desc : boolean, set this for hcds with big-endian descri=
ptors
> - big-endian : boolean, for hcds with big-endian-regs + big-endian-de=
sc
>=20
> while it does not (yet) so this is misleading. Can we at get that fix=
ed before=20
> merging? Copy pasting the PPC ehci driver should do the job.

I agree it needs to be fixed.  This can be done in a follow-up patch,
though.  It doesn't have to be in this one because nobody is using
ehci-platform with DT yet.

A simple copy from the PPC driver isn't quite enough, because the
platform data settings would override the DT values. =20
ehci_platform_reset has to be changed so that it sets
ehci->big_endian_desc and _mmio if the pdata flags are set, but
otherwise leaves them alone.

Hans, would you like to write another patch to take care of this?

Alan Stern

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
