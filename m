From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v5 5/5] ARM: dts: bcm2837-rpi-3-b: add GPIO expander
Date: Thu, 22 Feb 2018 12:06:50 -0800
Message-ID: <87bmggaiw5.fsf@anholt.net>
References: <cover.1519128054.git.baruch@tkos.co.il>
 <a6d59692dc4847e0b1639a26542e28c95ad5240f.1519128054.git.baruch@tkos.co.il>
 <CACRpkdaOv8yH2M8DVy-owY3zFGwAo52YCFksxEchjQyK3h47=A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0060048211621186050=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdaOv8yH2M8DVy-owY3zFGwAo52YCFksxEchjQyK3h47=A@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>, Baruch Siach <baruch@tkos.co.il>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-gpio@vger.kernel.org, Michael Zoran <mzoran@crowfest.net>, Rob Herring <robh+dt@kernel.org>, linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>, Dave Stevenson <dave.stevenson@raspberrypi.org>, Frank Rowand <frowand.list@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

--===============0060048211621186050==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Linus Walleij <linus.walleij@linaro.org> writes:

> On Tue, Feb 20, 2018 at 1:19 PM, Baruch Siach <baruch@tkos.co.il> wrote:
>
>> Add a description of the RPi3 GPIO expander that the VC4 firmware controls.
>>
>> Acked-by: Stefan Wahren <stefan.wahren@i2se.com>
>> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>> ---
>> v5:
>>   * Drop the 'firmware' property
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Please funnel this patch through the ARM SoC tree.

Picked up the reviews and applied these last 2 to bcm2835-dt-next.  I
didn't see the gpio tree's for-next updated, so I didn't integration
test it personally, but hopefully our branches can come together in
-next soon.

(FWIW, I was looking at
git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git for
gpio)

Thanks for pushing this to completion, Baruch!

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlqPItoACgkQtdYpNtH8
nugZahAAlF3HNOSWaoYpJ9Nrm5ppwRRHwxIiUIr5KaFvSbKDzKCj8Ly+L2f2+Pab
V/TMtKE+lKv6+X+/wd85huF/Af7yzbMw/dZqGtDYG2BQht7u0aYC/mu/LveROlLF
Fwekvutw07yNU8F1QlklHtetvo04I6eEeS8NMocSmeyzjPTsf93ZHOTZmGNRMhuo
wXSUm2M2UaldO3AsD69+LeojbZuGb2+xijz86h6zQ5k4Tx/Yx/L9XfbLwOig0FjV
DcUxRC4oZT2mHW/8GQAOh6zWJq2xHX2VrERzNYvB6Ui8dIY1jU0alKyzbmAue80X
EGj8YqKDg9QbrMcwvvnIDeqCyG4q1heurb+TBywV+Us2jKsEa/Dl5FMyDn9SNXn7
8l0Re4vAtwRTik3X/5HouIoF6PV2zGL3tkjosrfKFWv4eKRiY2a5KRUCyBTRqAH+
WcIsEFqs4eXTWCUMgaevIbnrA2osGhPksin2B/ajP68iVk+7zIGIy7O+mISTuU56
D82UZarOj1GkMU7GbWZmxkTfesMztZWsYKdgjrc410dKYFn4DxG9kHdPsL/BuJ2e
1vsJ5V05UA0Y8Fgd5LYXv+mYkh2DIA4kjmmOR9fY9woBaMbcnt/X4pElhxP46cqf
clkaiEEgKTQUcDUVkD5KBrHkaFYNPu1YpBTgPkuG5uBE4TRSgJA=
=x4I9
-----END PGP SIGNATURE-----
--=-=-=--


--===============0060048211621186050==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0060048211621186050==--
