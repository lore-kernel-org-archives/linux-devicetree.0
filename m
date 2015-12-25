From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v2 0/8] Raspberry Pi 2 support.
Date: Thu, 24 Dec 2015 16:01:40 -0800
Message-ID: <87lh8jqtuj.fsf@eliezer.anholt.net>
References: <1450310115-22163-1-git-send-email-eric@anholt.net>
 <201512220011.32234.arnd@arndb.de> <20151222142045.GA29335@omega>
 <201512222223.52449.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8825556399905071606=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <201512222223.52449.arnd@arndb.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>, Alexander Aring <alex.aring@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Scott Branden <sbranden@broadcom.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Marc Zyngier <marc.zyngier@arm.com>, Ray Jui <rjui@broadcom.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, Kumar Gala <galak@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============8825556399905071606==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Arnd Bergmann <arnd@arndb.de> writes:

> On Tuesday 22 December 2015, Alexander Aring wrote:
>> Later while booting the kernel hangs forever, the solution on my side
>> was to enable:
>>=20
>> CONFIG_HAVE_ARM_ARCH_TIMER
>>=20
>> I think this doesn't use the BCM2835 timer anymore and some cortex-a7
>> related "generic timer", or?
>
> Right, but I don't see how that relates to the irqchip. Is the BCM2835 ti=
mer
> connected to a secondary irqchip, while the arch timer connects to the pr=
imary GIC?

The 2835 timer is a "peripheral", and connects to the second level
irqchip, while the arm arch timer can give us per-cpu interrupts in the
first level controller.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWfIdkAAoJELXWKTbR/J7onFsP/22O7LiNE9td9J010tDu1dIO
SekNqS75oYDFjYq0ZL2Rw0kGATqFCkr1OpnIyI7da8qdFn6Pa3eFngu4FCQFMvMC
/KmrZwHY4lEvxND/jS/MdzzNWurjrmfOLR6kc/MM1lU3tnmiKxD3gR2e3ZzuWTVp
hZgXmI3wPZQuY4S0vWgVWpd2KSBtJlA7BRc37N24gUvORiVaUDLsezlaD7RIv59+
8V2i8DCcgG9tkP1FfTuz+a1GN4aobolAtmGY/kAd87b2p+ji5s+ryc3t6i8V9V2g
KnY9NSv0zrpC/UK3FtvRBDc74nmGktszlWmCYDRho5pj/dWZEkXMGVmUNXGhcvSj
kGc4F4LVRTGI603Zku5ECWWXa6HdrTugTjcWVgtk2ZHJ7DkdVcUup9O/sPWhPNvo
/veJSg87YIm8/+meqrGpx6S3Gb2d7VfwzXyu4+LFd7r0vxLWB03sz8RAi0Zt0tWS
3gip26HFohMvkftvyqjZYiIJ0TydaPSIOWmehXjuBTIQ3OAhgzPfNkt74oFbb5Px
HfMmzrvRbE/pPp97kwM7PRa4Y0vurejOZ73BsYiC4ua+Z2ye17jwOd8BwgCkzWSx
xlvmGhHEdXFvW5jGiCrA+oe5km72P3fi0KVezFVwg2NxSsIfhOZoKhIdtzchkSvu
aEwsnioVzM/CFyzkBfin
=LZ3M
-----END PGP SIGNATURE-----
--=-=-=--


--===============8825556399905071606==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8825556399905071606==--
