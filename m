From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Subject: Re: [PATCH] ARM: dts: imx6dl: Fix typo in Engicam i.CoreM6
 DualLite/Solo RQS
Date: Sat, 3 Mar 2018 11:40:50 +0100
Message-ID: <CAOf5uw=M8ew-j9XccOkviFZ-bLVDziBjWX2g1n_nF=vq0UM=Zg@mail.gmail.com>
References: <20180303103429.3063-1-jezz@sysmic.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180303103429.3063-1-jezz@sysmic.org>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jezz@sysmic.org>
Cc: devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Matteo Lisi <matteo.lisi@engicam.com>, Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

Hi

On Sat, Mar 3, 2018 at 11:34 AM, J=C3=A9r=C3=B4me Pouiller <jezz@sysmic.org=
> wrote:
> Obviously "Engicam i.CoreM6 DualLite/Solo RQS" include an imx6dl, not
> an imx6q.
>
> Signed-off-by: J=C3=A9r=C3=B4me Pouiller <jezz@sysmic.org>
> ---
>  arch/arm/boot/dts/imx6dl-icore-rqs.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/imx6dl-icore-rqs.dts b/arch/arm/boot/dts/i=
mx6dl-icore-rqs.dts
> index cf42c2f5cdc7..1281bc39b7ab 100644
> --- a/arch/arm/boot/dts/imx6dl-icore-rqs.dts
> +++ b/arch/arm/boot/dts/imx6dl-icore-rqs.dts
> @@ -42,7 +42,7 @@
>

Already fixed and queued

Michael

>  /dts-v1/;
>
> -#include "imx6q.dtsi"
> +#include "imx6dl.dtsi"
>  #include "imx6qdl-icore-rqs.dtsi"
>
>  / {
> --
> 2.11.0
>



--=20
| Michael Nazzareno Trimarchi                     Amarula Solutions BV |
| COO  -  Founder                                      Cruquiuskade 47 |
| +31(0)851119172                                 Amsterdam 1018 AM NL |
|                  [`as] http://www.amarulasolutions.com               |
