From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: ARM: Mediatek: Document devicetree
 bindings for clock controllers
Date: Wed, 1 Jul 2015 11:03:00 -0500
Message-ID: <CAL_JsqLcqH9UBuKQwsg42tbZZbFkoYE8BKs628r9DRyZuLF-Ew@mail.gmail.com>
References: <1435633127-31952-1-git-send-email-jamesjj.liao@mediatek.com> <1435633127-31952-3-git-send-email-jamesjj.liao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1435633127-31952-3-git-send-email-jamesjj.liao@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: James Liao <jamesjj.liao@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, srv_heupstream@mediatek.com, Daniel Kurtz <djkurtz@chromium.org>, Ricky Liang <jcliang@chromium.org>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 29, 2015 at 9:58 PM, James Liao <jamesjj.liao@mediatek.com> wrote:
> This adds the binding documentation for the mmsys, imgsys, vdecsys,
> vencsys and vencltsys controllers found on Mediatek SoCs.
>
> Signed-off-by: James Liao <jamesjj.liao@mediatek.com>
> ---
>  .../bindings/arm/mediatek/mediatek,imgsys.txt      | 22 ++++++++++++++++++++++
>  .../bindings/arm/mediatek/mediatek,mmsys.txt       | 22 ++++++++++++++++++++++
>  .../bindings/arm/mediatek/mediatek,vdecsys.txt     | 22 ++++++++++++++++++++++
>  .../bindings/arm/mediatek/mediatek,vencltsys.txt   | 22 ++++++++++++++++++++++
>  .../bindings/arm/mediatek/mediatek,vencsys.txt     | 22 ++++++++++++++++++++++
>  5 files changed, 110 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,imgsys.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,vdecsys.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,vencltsys.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,vencsys.txt
>
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,imgsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,imgsys.txt
> new file mode 100644
> index 0000000..7612bac
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,imgsys.txt
> @@ -0,0 +1,22 @@
> +Mediatek imgsys controller
> +============================
> +
> +The Mediatek imgsys controller provides various clocks to the system.

Perhaps some detail on what clocks exactly.

> +
> +Required Properties:
> +
> +- compatible: Should be:
> +       - "mediatek,mt8173-imgsys", "syscon"
> +- #clock-cells: Must be 1
> +
> +The imgsys controller uses the common clk binding from
> +Documentation/devicetree/bindings/clock/clock-bindings.txt
> +The available clocks are defined in dt-bindings/clock/mt*-clk.h.

The header should be part of this patch as it is part of the binding doc.

Same comments apply to the other files.
