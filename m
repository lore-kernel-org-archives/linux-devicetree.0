From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/1] Documentation/mfd: Fix typos in s2mps11.txt
Date: Fri, 8 Nov 2013 10:28:53 +0000
Message-ID: <20131108102853.GV30901@lee--X1>
References: <1383634640-26869-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1383634640-26869-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree@vger.kernel.org, rob@landley.net
List-Id: devicetree@vger.kernel.org

As this is only a trivial patch, I'll take it out the hands of the
already overloaded DT maintainers.

> Fixed trivial typos to improve readability.
>=20
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  Documentation/devicetree/bindings/mfd/s2mps11.txt |    9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/s2mps11.txt b/Docu=
mentation/devicetree/bindings/mfd/s2mps11.txt
> index c9332c6..0ff4e65 100644
> --- a/Documentation/devicetree/bindings/mfd/s2mps11.txt
> +++ b/Documentation/devicetree/bindings/mfd/s2mps11.txt
> @@ -1,10 +1,10 @@
> =20
>  * Samsung S2MPS11 Voltage and Current Regulator
> =20
> -The Samsung S2MP211 is a multi-function device which includes voltag=
e and
> +The Samsung S2MPS11 is a multi-function device which includes voltag=
e and

Nice catch eagle-eye!

>  current regulators, RTC, charger controller and other sub-blocks. It=
 is
> -interfaced to the host controller using a I2C interface. Each sub-bl=
ock is
> -addressed by the host system using different I2C slave address.
> +interfaced to the host controller using an I2C interface. Each sub-b=
lock is
> +addressed by the host system using different I2C slave addresses.
> =20
>  Required properties:
>  - compatible: Should be "samsung,s2mps11-pmic".
> @@ -43,7 +43,8 @@ sub-node should be of the format as listed below.
> =20
>   BUCK[2/3/4/6] supports disabling ramp delay on hardware, so explict=
ly
>   regulator-ramp-delay =3D <0> can be used for them to disable ramp d=
elay.
> - In absence of regulator-ramp-delay property, default ramp delay wil=
l be used.
> + In the absence of regulator-ramp-delay property, default ramp delay=
 will
> + be used.

So if we're being pertinacity here, your correction isn't much better.

s/of regulator-ramp-delay property,/of {the,an} regulator-ramp-delay pr=
operty, the

or=20

s/of regulator-ramp-delay property,/of regulator-ramp-delay, the

>  NOTE: Some BUCKs share the ramp rate setting i.e. same ramp value wi=
ll be set
>  for a particular group of BUCKs. So provide same regulator-ramp-dela=
y<value>.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
