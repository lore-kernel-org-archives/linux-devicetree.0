From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 02/16] dt-bindings: arm: Convert Marvell MMP board/soc bindings to json-schema
Date: Mon, 02 Sep 2019 14:39:11 +0100
Message-ID: <5d6d1b7f.1c69fb81.3c9bb.222d@mx.google.com>
References: <20190830220743.439670-1-lkundrak@v3.sk> <20190830220743.439670-3-lkundrak@v3.sk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190830220743.439670-3-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Lubomir Rintel <lkundrak@v3.sk>
Cc: "To : Olof Johansson" <olof@lixom.net>, "Cc : Rob Herring" <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Kishon Vijay Abraham I <kishon@ti.com>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, 31 Aug 2019 00:07:29 +0200, Lubomir Rintel wrote:
> Convert Marvell MMP SoC bindings to DT schema format using json-schema.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> 
> ---
> Changes since v2:
> - Add mrvl,pxa910
> - s/MMP2 Brownstone Board/MMP2 based boards/
> 
> Changes since v1:
> - Added this patch
> 
>  .../devicetree/bindings/arm/mrvl/mrvl.txt     | 14 --------
>  .../devicetree/bindings/arm/mrvl/mrvl.yaml    | 32 +++++++++++++++++++
>  2 files changed, 32 insertions(+), 14 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/mrvl/mrvl.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/mrvl/mrvl.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
