From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] DT: marvell,mmp2: add MMC controllers
Date: Mon, 10 Sep 2018 10:14:59 -0500
Message-ID: <CAL_JsqJ=9M9LxKjWQ7f3ARUkp_54BxCuRdJ-=JVNBefVswroew@mail.gmail.com>
References: <20180910120243.163979-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180910120243.163979-1-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: lkundrak@v3.sk
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Eric Miao <eric.y.miao@gmail.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 10, 2018 at 7:02 AM Lubomir Rintel <lkundrak@v3.sk> wrote:
>
> There's apparently four of them on a MMP2.
>
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---
>  arch/arm/boot/dts/mmp2.dtsi | 40 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>
> diff --git a/arch/arm/boot/dts/mmp2.dtsi b/arch/arm/boot/dts/mmp2.dtsi
> index 766bbb8495b6..51d4a2d70db9 100644
> --- a/arch/arm/boot/dts/mmp2.dtsi
> +++ b/arch/arm/boot/dts/mmp2.dtsi
> @@ -18,6 +18,10 @@
>                 serial3 = &uart4;
>                 i2c0 = &twsi1;
>                 i2c1 = &twsi2;
> +               sdhci0 = &mmc1;
> +               sdhci1 = &mmc2;
> +               sdhci2 = &mmc3;
> +               sdhci3 = &mmc4;

Please drop this. MMC nodes don't need an alias and if they did,
"sdhci" wouldn't be the name.

Rob
