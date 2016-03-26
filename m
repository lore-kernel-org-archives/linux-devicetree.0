From: Marek Vasut <marex@denx.de>
Subject: ARC dw-mshc binding compat string
Date: Sat, 26 Mar 2016 11:14:57 +0100
Message-ID: <56F66121.8050507@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Alexey Brodkin <abrodkin@synopsys.com>
List-Id: devicetree@vger.kernel.org

Hi!

I noticed that arch/arc/boot/dts/axs10x_mb.dtsi uses "altr," prefix in
the DT compatible string:

mmc@0x15000 {
        compatible = "altr,socfpga-dw-mshc";
        reg = < 0x15000 0x400 >;
        num-slots = < 1 >;
        fifo-depth = < 16 >;
        card-detect-delay = < 200 >;
        clocks = <&apbclk>, <&mmcclk>;
        clock-names = "biu", "ciu";
        interrupts = < 7 >;
        bus-width = < 4 >;
};

I don't think this is OK, since ARC is unrelated to Altera, which is
what the "altr," prefix stands for. I think the socfpga-dw-mshc shim
should be extended with another compatibility string, something like
"snps,arc-dw-mshc" and the axs10x_mb.dtsi should be adjusted
accordingly. What do you think ?

-- 
Best regards,
Marek Vasut
