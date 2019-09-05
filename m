From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 16/16] ARM: dts: mmp3: Add MMP3 SoC dts file
Date: Thu, 5 Sep 2019 12:17:36 +0200
Message-ID: <CAK8P3a1oqj5wXFgf+99=H4=hNrpnrwa05c+YctN64tHLvmoz5g@mail.gmail.com>
References: <20190830220743.439670-1-lkundrak@v3.sk> <20190830220743.439670-17-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190830220743.439670-17-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Lubomir Rintel <lkundrak@v3.sk>
Cc: "To : Olof Johansson" <olof@lixom.net>, Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Stephen Boyd <sboyd@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>, Russell King <linux@armlinux.org.uk>, Kishon Vijay Abraham I <kishon@ti.com>, "Cc : Rob Herring" <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-clk <linux-clk@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sat, Aug 31, 2019 at 12:12 AM Lubomir Rintel <lkundrak@v3.sk> wrote:

> +/ {
> +       #address-cells = <1>;
> +       #size-cells = <1>;
> +
> +       aliases {
> +               serial0 = &uart1;
> +               serial1 = &uart2;
> +               serial2 = &uart3;
> +               serial3 = &uart4;
> +       };

Better move the aliases into the per-board file, not every board
would have all four uarts connected, or labeled in that particular
order.

        Arnd
