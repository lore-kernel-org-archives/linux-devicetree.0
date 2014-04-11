From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 3/4] arm: add basic support for Mediatek MT6589 boards
Date: Fri, 11 Apr 2014 11:53:03 +0200
Message-ID: <20140411095303.GV28585@lukather>
References: <1397072736-10793-1-git-send-email-matthias.bgg@gmail.com>
 <1397072736-10793-4-git-send-email-matthias.bgg@gmail.com>
 <CAL_JsqJowqV2bsxE2VeYXQQSj4_L_KcH+C_dD=ZUvC=1crN4dA@mail.gmail.com>
 <87ha6136dz.fsf@approximate.cambridge.arm.com>
 <CABuKBeKLexBsTwF-nX15AYfLNA9bFDRm2XyeLpwQg9+3m6Xf=w@mail.gmail.com>
 <5347B942.2040703@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0285944143665644973=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5347B942.2040703@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Mark Rutland <Mark.Rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, "heiko.stuebner@bq.com" <heiko.stuebner@bq.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Daniel Lezcano <daniel.lezcano@linaro.org>, Florian Vaussard <florian.vaussard@epfl.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Randy Dunlap <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--===============0285944143665644973==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="thwsKKN5whlRGe6j"
Content-Disposition: inline


--thwsKKN5whlRGe6j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2014 at 10:43:30AM +0100, Marc Zyngier wrote:
> On 11/04/14 10:11, Matthias Brugger wrote:
> > 2014-04-10 11:01 GMT+02:00 Marc Zyngier <marc.zyngier@arm.com>:
> >> A couple of things on top of Rob's comments:
> >>
> >> On Wed, Apr 09 2014 at 10:50:33 pm BST, Rob Herring <robherring2@gmail=
=2Ecom> wrote:
> >>> On Wed, Apr 9, 2014 at 2:45 PM, Matthias Brugger <matthias.bgg@gmail.=
com> wrote:
> >>>> This adds a generic devicetree board file and a dtsi for boards
> >>>> based on the MT6589 SoCs from Mediatek.
> >>>>
> >>>> Apart from the generic parts (gic, clocks) the only component
> >>>> currently supported are the timers.
> >>>>
> >>>> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> >>
> >> [...]
> >>
> >>>> diff --git a/arch/arm/mach-mediatek/Kconfig b/arch/arm/mach-mediatek=
/Kconfig
> >>>> new file mode 100644
> >>>> index 0000000..c0139ca
> >>>> --- /dev/null
> >>>> +++ b/arch/arm/mach-mediatek/Kconfig
> >>>> @@ -0,0 +1,14 @@
> >>>> +config ARCH_MEDIATEK
> >>>> +       bool "Mediatek MT6589 SoC" if ARCH_MULTI_V7
> >>>> +       select ARCH_REQUIRE_GPIOLIB
> >>>
> >>> Then where is your GPIO driver?
> >>>
> >>>> +       select ARM_GIC
> >>>> +       select CACHE_L2X0
> >>>> +       select HAVE_ARM_TWD if LOCAL_TIMERS
> >>
> >> Hell no! ;-) ARM_ARCH_TIMER is the way (please also add the missing
> >> node).
> >=20
> > I considered this, but the timer wasn't able to get it's clock frequenc=
y:
> > "Architected timer frequency not available
> > Division by zero in kernel."
>=20
> This is because your bootloader/firmware is utterly broken, and doesn't
> set CNTFRQ (it must be set on all CPUs, from secure mode). As a
> *workaround*, you can set the timer frequency in the timer node, but
> that's just a hack, and will prevent virtual machines from running on
> such hardware.

Is it?

=46rom what I understood from ARM's ARM, CNTFRQ must be set during the
system boot, but even though the arch timer driver can fetch the
frequency from clock-frequency, I don't see anywhere that it actually
writes to CNTFRQ whatever it retrieved.

But I'm probably missing something here...

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--thwsKKN5whlRGe6j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJTR7t+AAoJEBx+YmzsjxAgg8QP/2/4RVvZNuPUnF2vUI6AVjFM
iMQTDDrbjRL5AdT+x/jSxTW8GerhA2CFmw9/MoTaBcD7RHTVvEj8QOrNUlYSFOBF
/D7acgplQ5/8QRzdMDLjISFSd3md4lFm9DjC7ly+lSDOb0oY0ERaFSToFBQzP53F
akEN0g6g8rMGzvWFcph5/gnHfdOUzpZr8Maf/Z3otBNvH3r92cG50FFo+MkDUewx
0535m4BfXgry0UISZCwICvMOFIUmHyCsBuMwKY6mLsisyqyAuukFWZ3YkZz2gva+
5JClUTsE9abuDUo79UjOrOmqdqKhCzE5Lheq/tZCY69lzjqCFnl71W0QBjuy/Qb4
2FU8ypIO+SXXVWjbW0+9fNQqCKZpz2EvVlGZSkXUofUJx4gni+CfkbG+kjrqFYRq
eJUVdPiY05CeB+ePakRf74yLAYpOvJHNTB4jlQ1LU9Xem8V6WAEUnatIMFACx6Ow
KpkVJHnujfcmAGjHr7mPacLpVVB2TW3w4lCO8qyGY3CqPVIGPKe75x+aPQH3ONz9
SLhwlNxEzY8dxMtM1/78u+3kBGjixVGRjjPjZ6fmc1cZxMYYJf80fXl+e5dFTORg
BJ1i40BfBWBQCHmTNOZGRl12moIz5Gvhhfs0mOCgR7b8NwNEbXg/nNbfn8R7V7DY
jUyJD/4PwqxEc7+XwpOD
=VOfu
-----END PGP SIGNATURE-----

--thwsKKN5whlRGe6j--


--===============0285944143665644973==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0285944143665644973==--
