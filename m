From: Sergei Ianovich <ynvich-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5] mtd: support BB SRAM on ICP DAS LP-8x4x
Date: Sun, 20 Dec 2015 13:43:58 +0300
Message-ID: <1450608238.15911.24.camel@gmail.com>
References: <1397668667-27328-4-git-send-email-ynvich@gmail.com>
	 <1450205941-15593-1-git-send-email-ynvich@gmail.com>
	 <20151220033807.GC9883@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151220033807.GC9883@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Cyril Bur <cyrilbur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Neelesh Gupta <neelegup-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:MEMORY TECHNOLOGY DEVICES (MTD)" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, 2015-12-19 at 21:38 -0600, Rob Herring wrote:
> On Tue, Dec 15, 2015 at 09:58:53PM +0300, Sergei Ianovich wrote:
> > This provides an MTD device driver for 512kB of battery backed up
> > SRAM
> > on ICPDAS LP-8X4X programmable automation controllers.
> >=20
> > SRAM chip is connected via FPGA and is not accessible without a
> > driver,
> > unlike flash memory which is wired to CPU MMU.
> >=20
> > This SRAM becomes an excellent persisent storage of volatile proces=
s
> > data like counter values and sensor statuses. Storing those data in
> > flash or mmc card is not a viable solution.
> >=20
> > Signed-off-by: Sergei Ianovich <ynvich-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > Reviewed-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> > =C2=A0=C2=A0=C2=A0v4..v5
> > =C2=A0=C2=A0=C2=A0* remove .owner from struct platform_driver
> > =C2=A0=C2=A0=C2=A0* constify struct of_device_id
> > =C2=A0=C2=A0=C2=A0=C2=A0for further Brian Norris comments:
> > =C2=A0=C2=A0=C2=A0* drop unused property from doc file
> > =C2=A0=C2=A0=C2=A0* move defconfig update to a different file
> > =C2=A0=C2=A0=C2=A0* drop extra match w/ of_match_device()
> >=20
> > =C2=A0=C2=A0=C2=A0v3..v4 for Brian Norris 'Reviewed-by'
> > =C2=A0=C2=A0=C2=A0* add doc file for DT binding
> > =C2=A0=C2=A0=C2=A0* move DTS binding to a different patch (8/21)
> > =C2=A0=C2=A0=C2=A0* drop unused include directive
> > =C2=A0=C2=A0=C2=A0* drop safely unused callback
> > =C2=A0=C2=A0=C2=A0* drop non-default partion probe types
> > =C2=A0=C2=A0=C2=A0* drop duplicate error checks
> > =C2=A0=C2=A0=C2=A0* drop duplicate error reporting
> > =C2=A0=C2=A0=C2=A0* fixed error message on MTD registeration
> > =C2=A0=C2=A0=C2=A0* fixed module removal routine
> >=20
> > =C2=A0=C2=A0=C2=A0v2..v3
> > =C2=A0=C2=A0=C2=A0* no changes (except number 08/16 -> 10/21)
> >=20
> > =C2=A0=C2=A0=C2=A0v0..v2
> > =C2=A0=C2=A0=C2=A0* use device tree
> > =C2=A0=C2=A0=C2=A0* use devm helpers where possible
> >=20
> > =C2=A0.../devicetree/bindings/mtd/sram-lp8x4x.txt=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A020 +++
> > =C2=A0drivers/mtd/devices/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A014 ++
> > =C2=A0drivers/mtd/devices/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A01 +
> > =C2=A0drivers/mtd/devices/sram_lp8x4x.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0| 199
> > +++++++++++++++++++++
> > =C2=A04 files changed, 234 insertions(+)
> > =C2=A0create mode 100644 Documentation/devicetree/bindings/mtd/sram=
-
> > lp8x4x.txt
> > =C2=A0create mode 100644 drivers/mtd/devices/sram_lp8x4x.c
> >=20
> > diff --git a/Documentation/devicetree/bindings/mtd/sram-lp8x4x.txt
> > b/Documentation/devicetree/bindings/mtd/sram-lp8x4x.txt
> > new file mode 100644
> > index 0000000..476934f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mtd/sram-lp8x4x.txt
> > @@ -0,0 +1,20 @@
> > +512kB battery backed up SRAM on LP-8x4x industrial computers
> > +
> > +Required properties:
> > +- compatible : should be "icpdas,sram-lp8x4x"
>=20
> No wildcards please. Otherwise looks fine.

There is a similar review comment from Arnd Bergmann in the discussion
of `[PATCH v5] serial: support for 16550A serial ports on LP-8x4x`.

I'll quote my latest clarification:
> ... This driver will support ports on LP-8081,=C2=A0
> LP-8141, LP-8441, LP-8841. Last time I checked the vendor was announc=
ing
> a series with 3 as the last digit. They use lp8x4x name, eg. in
> documentation like `LP-8x4x_ChangeLog.txt`. They ship their proprieta=
ry
> SDK in `lp8x4x_sdk_for_linux.tar`. All of this implies that it is a
> single board.

I think the solution should be the same for all LP-8x4x drivers (IRQ,
SRAM, SERIAL, IIO).
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
