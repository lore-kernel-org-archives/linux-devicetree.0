From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] ARM: dts: realtek: Add support for Realtek RTD16XX
 evaluation board
Date: Thu, 5 Sep 2019 10:51:28 +0200
Message-ID: <CAK8P3a3L7mzR+FUMgG75_hrp4HQm4vJR3hsUO_BkQp_247OLsA@mail.gmail.com>
References: <20190905080835.1376-1-james.tai@realtek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190905080835.1376-1-james.tai@realtek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jamestai.sky@gmail.com
Cc: DTML <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, CY_Huang <cy.huang@realtek.com>, Phinex Hung <phinex@realtek.com>, "james.tai" <james.tai@realtek.com>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 5, 2019 at 10:10 AM <jamestai.sky@gmail.com> wrote:

> +
> +/ {
> +       model= "Realtek Mjolnir Evaluation Board";
> +       model_hex= <0x00000653>;

The 'mode_hex' property is rather unusual, please drop that for now.

> +       chosen {
> +               bootargs = "console=ttyS0,115200 earlycon";
> +       };
> +
> +       memory@0 {
> +               device_type = "memory";
> +               reg = <0x0 0x0 0x0 0x80000000>;
> +       };
> +
> +       uart0: serial0@98007800 {
> +               compatible = "snps,dw-apb-uart";
> +               reg = <0x0 0x98007800 0x0 0x400>,
> +                       <0x0 0x98007000 0x0 0x100>;
> +               reg-shift = <2>;
> +               reg-io-width = <4>;
> +               interrupts = <0 68 4>;
> +               clock-frequency = <27000000>;
> +               status = "okay";
> +       };

This looks like an on-chip uart. Please move that into rtd16xx.dtsi
instead, and just mark it as 'status="disabled"' there if there are
multiple uarts (and add the other ones as well), then enable
it for the board here.

There should also be an 'aliases'. You normally also want to add

aliases {
        serial0 = &uart0;
};

chosen {
       stdout-path= "serial0:115200n8"
};

in the board file to make earlycon work right.

      Arnd
