From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 2/2] arm64: allwinner: h6: enable i2c0 in PineH64
Date: Mon, 12 Aug 2019 12:19:17 +0800
Message-ID: <CAGb2v65xDCNywexZGW=EBrsJwm-KwANxpdCv-AM2sgVNbz6qQQ@mail.gmail.com>
References: <20190811090503.32396-1-bshah@kde.org>
 <20190811090503.32396-3-bshah@kde.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190811090503.32396-3-bshah@kde.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bhushan Shah <bshah@kde.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>, linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org

On Sun, Aug 11, 2019 at 5:05 PM Bhushan Shah <bshah@kde.org> wrote:
>
> i2c0 bus is exposed by PI-2 BUS in the PineH64, model B.
>
> Signed-off-by: Bhushan Shah <bshah@kde.org>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
> index 684d1daa3081..a184361bc10d 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
> @@ -160,6 +160,14 @@
>         vcc-pg-supply = <&reg_aldo1>;
>  };
>
> +&i2c0 {
> +       status = "okay";

We don't enable interfaces that are exposed on the extension headers
by default. Instead we let the users enable it themselves, by modifying
the device tree either with overlays or through U-boot commands.

Please set this to "disabled", and add a comment mentioning that it is
on the PI-2 BUS. Having it explicitly listed in the source serves as a
pointer to people looking at how to enable stuff.

ChenYu

> +};
> +
> +&i2c0_pins {
> +       bias-pull-up;
> +};
> +
>  &r_i2c {
>         status = "okay";
>
> --
> 2.17.1
>
