From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 03/20] dt-bindings: arm: mrvl: Document MMP3 compatible string
Date: Tue, 27 Aug 2019 07:00:59 -0500
Message-ID: <CAL_JsqKb4j5Yz2RvOY=H7iCQzMS6Y6pqhkSv+CLzQ2L=jzSHTg@mail.gmail.com>
References: <20190822092643.593488-1-lkundrak@v3.sk> <20190822092643.593488-4-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190822092643.593488-4-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Lubomir Rintel <lkundrak@v3.sk>
Cc: Olof Johansson <olof@lixom.net>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-clk <linux-clk@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 22, 2019 at 4:33 AM Lubomir Rintel <lkundrak@v3.sk> wrote:
>
> Marvel MMP3 is a successor to MMP2, containing similar peripherals with two
> PJ4B cores.
>
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
>
> ---
> Changes since v1:
> - Rebased on top of mrvl.txt->mrvl.yaml conversion
>
>  Documentation/devicetree/bindings/arm/mrvl/mrvl.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
