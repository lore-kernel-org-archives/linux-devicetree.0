From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 12/18] arm64: dts: ulcb-kf: enable PCIE0/1
Date: Wed, 20 Sep 2017 15:06:31 +0200
Message-ID: <CAMuHMdW6S7euEYw8u2xn4CcwrVNXxxwSGvwWuxpj7FE4o6xdQQ@mail.gmail.com>
References: <1504737267-22829-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1504737401-23308-1-git-send-email-vladimir.barinov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1504737401-23308-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Vladimir,

On Thu, Sep 7, 2017 at 12:36 AM, Vladimir Barinov
<vladimir.barinov@cogentembedded.com> wrote:
> This supports PCIE0/1 on ULCB Kingfisher board
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> ---
>  arch/arm64/boot/dts/renesas/ulcb-kf.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> index 46e3a34..952d2b7 100644
> --- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> @@ -52,6 +52,19 @@
>         status = "okay";
>  };
>
> +&pcie_bus_clk {
> +       clock-frequency = <100000000>;
> +       status = "okay";

The status update is superfluous, as the PCIe bus clock is already enabled
in r8a779[56].dtsi.

With that fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
