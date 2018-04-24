From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH V2 0/9] ARM: bcm283x: RPi 3 B+ support and other
 improvements
Date: Mon, 23 Apr 2018 18:02:33 -0700
Message-ID: <87zi1to1qu.fsf@anholt.net>
References: <1524310122-9439-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3067156482382706672=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1524310122-9439-1-git-send-email-stefan.wahren@i2se.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, Phil Elwell <phil@raspberrypi.org>, Alexander Graf <agraf@suse.de>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============3067156482382706672==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Stefan Wahren <stefan.wahren@i2se.com> writes:

> The main focus of the patch series is to provide support for the new
> Raspberry Pi 3 B+ . The rest are parts which missed the merge window for 4.17.

I've merged this series to my -next branches, and once some kbuilds come
back clean, I'll send PRs up.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlregikACgkQtdYpNtH8
nuhwaw//WZeFl81kdNaMfoh24Lnbl+rQrXtUjY9WfA8KsMt01li+Ks+2H01VXGMA
tPpgxjzZAmri59pcTjqvCOj7N6GRKQqbo3AmF8mNNfNOzEvuXEOxlHONsUKZF9Y9
bW2h+BVZWCn61BLjywLsbZPxgHnFzrh8E9dg+EL9QOFc8rEaH0h3tCw7uHNNz80D
lH3Xm5avH1fGstkF3mr6arwZfKHfSA+mmtvhQpANafnJKUve0t0I5lDletI6UzDB
VkgoW2mnxyqGrpQGGQQjJU3aU6uWZUAH2ARJyKpfKs4ctOi8m0gqDVVldkw7PwA2
ApBnomLYtAvjfm3mzxjudlTizHgnSFztMlUHJ1pc9luLzviGBZ2YYO0vCra5QrdH
oXUz1WgkoMK6/hjHP68XWrvXU/E1umARR2lfzndDO3Ni1mSMFrusFPgucdZxvwjI
AWlextoeUAILw7Ah07yBh/0knZF3+nf5Rq/JJHIKtfU6tqcTfcqmGvwj2Me7BcTZ
+5wHk81puhoNQr27KWjOxu9UZ0nF68MZT5YpRh48Bkus79FnjEU299jhItW1hopI
bW4usNrg9Jxc5Id3rySlXv61v0bnv4H1AgVy1ryE85jt6ysM9vcjLGnHvszhBWJN
IwbKo2m2p3odaCG+A8A/Rs80awXEhFWgi9UXgcnuVmYvHORcPDE=
=JNHG
-----END PGP SIGNATURE-----
--=-=-=--


--===============3067156482382706672==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3067156482382706672==--
