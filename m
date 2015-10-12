From: Josh Cartwright <joshc@eso.teric.us>
Subject: Re: [PATCH 3/5] mtd: brcmnand: Optional DT flag to reset IPROC NAND
 controller
Date: Mon, 12 Oct 2015 16:54:59 -0500
Message-ID: <20151012215459.GA8843@kryptos>
References: <1443808606-21203-1-git-send-email-anup.patel@broadcom.com>
 <1443808606-21203-4-git-send-email-anup.patel@broadcom.com>
 <20151004214943.GA28904@localhost>
 <39063E8F96E11742B35A201CC5D095B7AD54C1@SJEXCHMB10.corp.ad.broadcom.com>
 <20151006134119.GB26818@localhost> <56144A62.70300@broadcom.com>
 <5614574C.2060701@gmail.com>
 <39063E8F96E11742B35A201CC5D095B7AD8ADD@SJEXCHMB10.corp.ad.broadcom.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7182616588964547138=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <39063E8F96E11742B35A201CC5D095B7AD8ADD@SJEXCHMB10.corp.ad.broadcom.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Anup Patel <anup.patel@broadcom.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Rafal Milecki <zajec5@gmail.com>, Will Deacon <will.deacon@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ray Jui <rjui@broadcom.com>, Vikram Prakash <vikramp@broadcom.com>, Rob Herring <robh+dt@kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Sandeep Tripathy <tripathy@broadcom.com>, Kumar Gala <galak@codeaurora.org>, Pramod Kumar <pramodku@broadcom.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@li
List-Id: devicetree@vger.kernel.org


--===============7182616588964547138==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Q68bSM7Ycu6FN28Q"
Content-Disposition: inline


--Q68bSM7Ycu6FN28Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 07, 2015 at 03:33:50AM +0000, Anup Patel wrote:
> From: Florian Fainelli [mailto:f.fainelli@gmail.com]
> > On 06/10/15 15:25, Scott Branden wrote:
[..]
> > Then instead of adding a "reset flag" to Device Tree, another approach =
could be
> > to put the desired or currently configured exhaustive list of NAND timi=
ngs in
> > Device Tree, and based on that you could have this:
> >=20
> > - the NAND controller driver finds that these timings match the current
> > configuration, you are good to go
> >=20
> > - the NAND controller drivers finds a difference in how current timings=
 are
> > configured vs. desired timings, and issues a controller reset, prior to=
 applying
> > new timing configuration
>
> To add to this ...
>
> The mechanism to reset is BRCM NAND controller is SOC specific so the
> SoC independent BRCM NAND driver (i.e. brcmnand.c) does not know how
> to reset the NAND controller.
>
> For iProc SoC family, the NAND controller reset is through IDM register
> space which is only iomap'ed by iproc_nand.c.
>
> We might end-up having one more SoC specific callback which will be
> Provided by iproc_nand.c to brcmnand.c.

Not that I'm familiar with these SoCs, but I did want to chime in and
make sure you are aware of the existing reset_controller_dev
abstraction, which is intended to solve exactly this problem.  Including
a reset_control_get_optional() that might fit your use case.  See
include/linux/reset{,-controller}.h.

  Josh

--Q68bSM7Ycu6FN28Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABCAAGBQJWHCwvAAoJEFQ/W/ipfAAc9NAH/2XHlcu00g8MIiknJJtCA4i+
7L7nfIzqwdVLYO/3Uwe5YKepGh9OOD0mqRvbsBv7WKFebTyR0Jsk6UKzBxsie2xb
vzoOe1pIBLwSVbYyn74tBOtQ2l9BC8DcpD9wv05hWE1qfqJAyJcUL0sXseqEl5Bc
d7ObzRQJKmgV4PxQUaYXSNrvzmwKku1/XJvxvjxEVH043DWf4vA59Wz81eGzTikm
barwW0LnwMSQK09ovVANVc9b3m0TuE9/nduKD6KDXECGOoWrkaqMAji5Pt7A+HgI
fM6tObngr3NqryzG7tN5R4ER1ivr1EQq5CllUE8DA41GSoPPdwIvDLxncZQPttg=
=4nbR
-----END PGP SIGNATURE-----

--Q68bSM7Ycu6FN28Q--


--===============7182616588964547138==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7182616588964547138==--
