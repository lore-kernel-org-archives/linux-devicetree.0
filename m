From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 04/16] arm: dts: Add devicetree for RDA8810PL SoC
Date: Mon, 19 Nov 2018 20:37:14 +0100
Message-ID: <CAK8P3a1ZOTrUFKvBCdMX-1Fj5Pnk__+GJdee7pOieb2oiWkpuQ@mail.gmail.com>
References: <20181119170939.19153-1-manivannan.sadhasivam@linaro.org> <20181119170939.19153-5-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181119170939.19153-5-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, zhao_steven@263.net, service@rdamicro.com, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 19, 2018 at 6:11 PM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> Add initial device tree for RDA8810PL SoC from RDA Microelectronics.

> +       aliases {
> +               serial0 = &uart0;
> +               serial1 = &uart1;
> +               serial2 = &uart2;
> +       };

Better move the aliases into the board file, there might be boards
that only expose one or two of them on physical connectors,
or that count them in a different order from the SoC.

      Arnd
