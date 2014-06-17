From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] dt-binding: mfd: as3722: correct macro name
Date: Tue, 17 Jun 2014 21:11:15 +0100
Message-ID: <20140617201115.GV29841@lee--X1>
References: <1402302719-9766-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1402302719-9766-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: swarren@nvidia.com, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dwillemsen@nvidia.com
List-Id: devicetree@vger.kernel.org

On Mon, 09 Jun 2014, Laxman Dewangan wrote:

> The macro name for enable3 pin is named as AS3722_EXT_CONTROL_PIN_ENA=
BLE2
> which is conflict with the enable2 pin.
>=20
> Correct this macro name to correctly reflect the enable pin i.e.
> AS3722_EXT_CONTROL_PIN_ENABLE3.
>=20
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Reported-by: Dan Willemsen <dwillemsen@nvidia.com>
> ---
>  include/dt-bindings/mfd/as3722.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

> diff --git a/include/dt-bindings/mfd/as3722.h b/include/dt-bindings/m=
fd/as3722.h
> index 0e69256..e66c089 100644
> --- a/include/dt-bindings/mfd/as3722.h
> +++ b/include/dt-bindings/mfd/as3722.h
> @@ -13,7 +13,7 @@
>  /* External control pins */
>  #define AS3722_EXT_CONTROL_PIN_ENABLE1 1
>  #define AS3722_EXT_CONTROL_PIN_ENABLE2 2
> -#define AS3722_EXT_CONTROL_PIN_ENABLE2 3
> +#define AS3722_EXT_CONTROL_PIN_ENABLE3 3
> =20
>  /* Interrupt numbers for AS3722 */
>  #define AS3722_IRQ_LID			0

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
