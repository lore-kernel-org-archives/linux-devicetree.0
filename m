From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 01/19] dt-bindings: arm: cpu: Add Marvell MMP3 SMP enable method
Date: Mon, 12 Aug 2019 12:57:48 -0600
Message-ID: <CAL_JsqLyQjRNONDQT=RM0kYzztd4PdsSZssjiVfd8WUwCjFUVA@mail.gmail.com>
References: <20190809093158.7969-1-lkundrak@v3.sk> <20190809093158.7969-2-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190809093158.7969-2-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Lubomir Rintel <lkundrak@v3.sk>
Cc: Olof Johansson <olof@lixom.net>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-clk <linux-clk@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 9, 2019 at 3:32 AM Lubomir Rintel <lkundrak@v3.sk> wrote:
>
> Add the enable method for the second PJ4B core of the Marvell MMP3 SoC.
>
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---
>  Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Rob Herring <robh@kernel.org>
