From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/1] Documentation: mfd: Fix LDO index in s2mps11.txt
Date: Mon, 6 Jan 2014 11:42:30 +0000
Message-ID: <20140106114230.GR23772@lee--X1>
References: <1387877005-19035-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1387877005-19035-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, robh+dt@kernel.org, rob@landley.net
List-Id: devicetree@vger.kernel.org

On Tue, 24 Dec 2013, Sachin Kamat wrote:

> LDO indices start from 1. Fix the example appropriately.
>=20
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  Documentation/devicetree/bindings/mfd/s2mps11.txt |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/s2mps11.txt b/Docu=
mentation/devicetree/bindings/mfd/s2mps11.txt
> index 78a840d7510d..15ee89c3cc7b 100644
> --- a/Documentation/devicetree/bindings/mfd/s2mps11.txt
> +++ b/Documentation/devicetree/bindings/mfd/s2mps11.txt
> @@ -60,7 +60,7 @@ as per the datasheet of s2mps11.
> =20
>  	- LDOn
>  		  - valid values for n are 1 to 38
> -		  - Example: LDO0, LD01, LDO28
> +		  - Example: LDO1, LD02, LDO28
>  	- BUCKn
>  		  - valid values for n are 1 to 10.
>  		  - Example: BUCK1, BUCK2, BUCK9

You really do have too much time on your hands. ;)

Applied, thanks.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
