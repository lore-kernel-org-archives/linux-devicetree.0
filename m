From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH] ARM: dts: bcm2835-rpi-zero-w: Drop unnecessary pinctrl
Date: Mon, 21 Jan 2019 12:29:08 -0800
Message-ID: <87y37d3gbv.fsf@anholt.net>
References: <1548003960-4807-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7233481504113563960=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1548003960-4807-1-git-send-email-stefan.wahren@i2se.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============7233481504113563960==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Stefan Wahren <stefan.wahren@i2se.com> writes:

> There is no need to specify a pinctrl for the reset GPIO. So we better
> remove this avoid a potential conflict between pinctrl and pwrseq
> after the pinmux driver has been changed to strict:
>
> pinctrl-bcm2835 20200000.gpio: pin gpio41 already requested by wifi-pwrseq;
> cannot claim for pinctrl-bcm2835:499
> pinctrl-bcm2835 20200000.gpio: pin-41 (pinctrl-bcm2835:499) status -22
> pwrseq_simple: probe of wifi-pwrseq failed with error -22
>
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>

Reviewed-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlxGK5QACgkQtdYpNtH8
nuiUbQ//U3KGqKij+SJ32+YotSZa64EUJT4R00K4D27hd0/HMWcS/yECReOGv0RX
gAjxgAc5AIihAZjjlFRfN4fj3mKe+NhQMNNebDAQCdrD8yFFDhAeV5gpOMGLkcbU
fPEzSQz6/wSkJcAY20VSzBpuavCrUQI+g9w7TFyzhfqnTx1ftZdIinWxtdLudrMI
/L1eFH4R2XuUOzQ2enyPbvIBka4ouW2rjYZ5q8nwXQWdONSWkxt1UVAK1FvsZtyp
V/HRq9YvsAttDrJIjuo2kx4U6tWRWAOydfpMjQ67BRbVU/Y8LrXXapZiI3aqvRbG
88xfiY1zWqncUs9qtumtuUTSlzxPfWx8EInW+ZD9Ys/6IZ86K5Kngb9d5U1UQUxI
hvea/3wyE+tJI4FawWhZfer9+dzXHFIhpk/PjZGnWCEjcfIAwszSZ/Ctv+vbz2fW
X6kFgw+jm2oDezO92qy43YnefghpM13rC8CGjI1rhPH/IzOow5t+IBc+Nab5xHqj
5ESQ1v7pywdPyE1Gn8TRpGnAuohtErt8QR9zCvCNA7Ffiq1XplFfdGyKc3/xgxyP
zeam0dMkHnNPwclazRe64c+BIK81JiUx7JlFSkoZ8Gob3Y8cjlwrWjKJyMll5M8l
HjkrPzldf1D/cH7mT9GuMaWv8NmAq4c7DxVwzKptgN1AAG2qGnQ=
=ZREv
-----END PGP SIGNATURE-----
--=-=-=--


--===============7233481504113563960==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7233481504113563960==--
