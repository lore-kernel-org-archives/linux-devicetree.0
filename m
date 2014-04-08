From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH v2 2/5] ARM: zynq: dt: Convert to preprocessor includes
Date: Tue, 08 Apr 2014 09:03:27 +0200
Message-ID: <53439F3F.2030801@monstr.eu>
References: <1396653256-28397-1-git-send-email-soren.brinkmann@xilinx.com> <1396653256-28397-3-git-send-email-soren.brinkmann@xilinx.com> <53423E75.3020008@monstr.eu> <53429754.8080105@topic.nl> <534298E7.2020409@monstr.eu> <20140407171012.GC9952@obsidianresearch.com> <20140407180228.GN12170@pengutronix.de>
Reply-To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="Ljx13ktaJQghgPJKEWmvalLEIxpdi0Vj0"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140407180228.GN12170-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Mike Looijmans <mike.looijmans-Oq418RWZeHk@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Ljx13ktaJQghgPJKEWmvalLEIxpdi0Vj0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 04/07/2014 08:02 PM, Steffen Trumtrar wrote:
> Hi!
>=20
> On Mon, Apr 07, 2014 at 11:10:12AM -0600, Jason Gunthorpe wrote:
>> On Mon, Apr 07, 2014 at 02:24:07PM +0200, Michal Simek wrote:
>>
>>> Device-tree BSP and in 2014.01 there will be new BSP which just
>>> generate them directly from the Vivado tools which just target your
>>> reference design.  You can connect your custom IP (or Xilinx or 3rd
>>> party) directly to the GIC which using different IRQ sensitivity
>>> with whatever register addresses and make no sense to write it by
>>> hand.
>>
>> On our Zynq design here we ended up being unwilling to use platform
>> generation from Vivado. Basically all our IP was custom, so there was
>> no win at all to invoking the complexity of the automatic tools.
>>
>> Thus we write the DT by hand, and our DT is complex, integrating
>> peripherals that span two FPGAs.
>>
>> I think the in-kernel DT should use the kernel conventions, which
>> means using #include and the binding constants over magic values.
>>
>=20
> ACK.
>=20
> If in doubt follow common mainline practice. Although using includes
> for DT is not necessarily common practice, readability of DTs is
> really important IMHO.

Let me give you one example. When you add xilinx intc controller
to zynq HW design which uses gic with headers you are using
then you will find out that sensitivity for both controllers
are just different.
This is just one case I am aware of. I expect there will be one more.

Also dtses from kernel are copied to other project because separation
from kernel hasn't be done but there is any plan regarding this.

Using dtc preprocessor and macros improve DTS readability but at the same=

time force other users to copy all necessary files from the kernel
to that projects which is just hassle.
With example above there are also cases where using macros is just wrong
that's why I don't want to start to use it.

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



--Ljx13ktaJQghgPJKEWmvalLEIxpdi0Vj0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlNDnz8ACgkQykllyylKDCFCQACeKgyiQxss0DD0HOCQc98pm9x6
IHQAnjDHIvLt1PAytU7SuRLoiQiV3gVt
=U/O1
-----END PGP SIGNATURE-----

--Ljx13ktaJQghgPJKEWmvalLEIxpdi0Vj0--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
