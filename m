From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Subject: Re: ARC dw-mshc binding compat string
Date: Sat, 26 Mar 2016 19:26:17 +0200
Message-ID: <56F6C639.5000301@mentor.com>
References: <56F66121.8050507@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56F66121.8050507@denx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Vasut <marex@denx.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Alexey Brodkin <abrodkin@synopsys.com>
List-Id: devicetree@vger.kernel.org

On 26.03.2016 12:14, Marek Vasut wrote:
> Hi!
> 
> I noticed that arch/arc/boot/dts/axs10x_mb.dtsi uses "altr," prefix in
> the DT compatible string:
> 
> mmc@0x15000 {
>         compatible = "altr,socfpga-dw-mshc";
>         reg = < 0x15000 0x400 >;
>         num-slots = < 1 >;
>         fifo-depth = < 16 >;
>         card-detect-delay = < 200 >;
>         clocks = <&apbclk>, <&mmcclk>;
>         clock-names = "biu", "ciu";
>         interrupts = < 7 >;
>         bus-width = < 4 >;
> };
> 
> I don't think this is OK, since ARC is unrelated to Altera, which is
> what the "altr," prefix stands for. I think the socfpga-dw-mshc shim
> should be extended with another compatibility string, something like
> "snps,arc-dw-mshc" and the axs10x_mb.dtsi should be adjusted
> accordingly. What do you think ?
> 

There is "snps,dw-mshc" described in
Documentation/devicetree/bindings/mmc/synopsys-dw-mshc.txt and supported by
dw_mmc host controller driver.
