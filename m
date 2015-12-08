From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: Add SolidRun Armada 388 Clearfog A1 DT file
Date: Tue, 8 Dec 2015 17:04:30 +0000
Message-ID: <20151208170429.GE8644@n2100.arm.linux.org.uk>
References: <E1a5hDy-0002rC-Oe@rmk-PC.arm.linux.org.uk>
 <87egew98ty.fsf@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <87egew98ty.fsf-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 08, 2015 at 05:57:45PM +0100, Gregory CLEMENT wrote:
> Hi Russell,
> =20
>  On dim., d=E9c. 06 2015, Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> =
wrote:
>=20
> > Add support for the SolidRun Armada 388 Clearfog A1 board.  This bo=
ard
> > has an Armada 388 microsom, dedicated gigabit ethernet, six switche=
d
> > gigabit ethernet ports, SFP cage, two Mini-PCIe/mSATA slots, a m.2 =
SATA
> > slot, and a MikroBUS connector to allow MikroBUS modules to be adde=
d.
> >
> > This DT file adds support for all board facilities with the excepti=
on
> > of full SFP support.
> >
> > Signed-off-by: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
>=20
> I made some tests it on the Clearfog v2.0 I have: Ethernet (CON8 and
> J11), i2c (using i2cdetect), USB stick on CON7.
>=20
> For this one I tried to use an USB3 stick, but it was enumerated usin=
g
> the High Speed profile and not the Super Speed one. But I think it is
> because of the Serdes configuration done in U-Boot.

Hmm, I don't have any USB3 hardware to check or debug.  Unless there's =
a
bug in uboot, it looks like it's correctly configured to use the serdes
lane 3 at the highest speed:

 | Lane # | Speed|    Type     |
 ------------------------------|
 |   0    |  3   |  SATA0      |
 |   1    |  0   |  SGMII1     |
 |   2    |  5   |  PCIe1      |
 |   3    |  5   |  USB3 HOST1 |
 |   4    |  5   |  PCIe2      |
 |   5    |  0   |  SGMII2     |
 -------------------------------

> so Acked-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> and applied on mvebu/dt.

Thanks.

--=20
RMK's Patch system: http://www.arm.linux.org.uk/developer/patches/
=46TTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
