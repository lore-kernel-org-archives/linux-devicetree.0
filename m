From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2] ARM: STi: Add STiH410 SoC support
Date: Thu, 5 Mar 2015 13:43:38 +0000
Message-ID: <20150305134338.GE31098@x1>
References: <1425560706-22907-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1425560706-22907-1-git-send-email-fabrice.gasnier@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabrice GASNIER <fabrice.gasnier@st.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Maxime Coquelin <maxime.coquelin@st.com>, Patrice Chotard <patrice.chotard@st.com>, Russell King <linux@arm.linux.org.uk>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@stlinux.com
List-Id: devicetree@vger.kernel.org

On Thu, 05 Mar 2015, Fabrice GASNIER wrote:

> This patch adds support to STiH410 SoC.
>=20
> Please note "st,stih410" is already present in device tree.
> The problem is that it is missing the entry in the match table,
> and so the L2 cache and other cpus than 0 don't get initialized.
>=20
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> Acked-by: Maxime Coquelin <maxime.coquelin@st.com>
> ---
>  Documentation/devicetree/bindings/arm/sti.txt | 4 ++++
>  arch/arm/mach-sti/board-dt.c                  | 1 +
>  2 files changed, 5 insertions(+)

Sorry, this is the one I was looking at oneline.

Same comments apply though.

Acked-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/Documentation/devicetree/bindings/arm/sti.txt b/Document=
ation/devicetree/bindings/arm/sti.txt
> index d70ec35..8d27f6b 100644
> --- a/Documentation/devicetree/bindings/arm/sti.txt
> +++ b/Documentation/devicetree/bindings/arm/sti.txt
> @@ -13,6 +13,10 @@ Boards with the ST STiH407 SoC shall have the foll=
owing properties:
>  Required root node property:
>  compatible =3D "st,stih407";
> =20
> +Boards with the ST STiH410 SoC shall have the following properties:
> +Required root node property:
> +compatible =3D "st,stih410";
> +
>  Boards with the ST STiH418 SoC shall have the following properties:
>  Required root node property:
>  compatible =3D "st,stih418";
> diff --git a/arch/arm/mach-sti/board-dt.c b/arch/arm/mach-sti/board-d=
t.c
> index b067390..b373aca 100644
> --- a/arch/arm/mach-sti/board-dt.c
> +++ b/arch/arm/mach-sti/board-dt.c
> @@ -18,6 +18,7 @@ static const char *stih41x_dt_match[] __initdata =3D=
 {
>  	"st,stih415",
>  	"st,stih416",
>  	"st,stih407",
> +	"st,stih410",
>  	"st,stih418",
>  	NULL
>  };

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
