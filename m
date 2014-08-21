From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [RESEND PATCH v2 4/4] dt-bindings: add bindings for mediatek intpol
Date: Thu, 21 Aug 2014 17:02:18 +0200
Message-ID: <CABuKBeJ0OsaBex_5D9tazTVZX1T8pnUjG7v0nVay-jzqL2nuqQ@mail.gmail.com>
References: <1407895884-18131-1-git-send-email-srv_yingjoe.chen@mediatek.com>
	<1407895884-18131-5-git-send-email-srv_yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1407895884-18131-5-git-send-email-srv_yingjoe.chen@mediatek.com>
Sender: linux-doc-owner@vger.kernel.org
To: "Joe.C" <srv_yingjoe.chen@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, Russell King <linux@arm.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, "Joe.C" <yingjoe.chen@mediatek.com>, Olof Johansson <olof@lixom.net>, Jonas Jensen <jonas.jensen@gmail.com>, Arnd Bergmann <arnd@arndb.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, srv_heupstream <srv_heupstream@mediatek.com>, Yingjoe Chen <yingjoe.chen@gmail.com>, Hsien-Chun Yen <hc.yen@mediatek.com>, =?UTF-8?B?RWRkaWU
List-Id: devicetree@vger.kernel.org

2014-08-13 4:11 GMT+02:00 Joe.C <srv_yingjoe.chen@mediatek.com>:
> From: "Joe.C" <yingjoe.chen@mediatek.com>
>
> Add binding documentation for Mediatek SoC GIC interrupt polarity extension.
>
> Signed-off-by: Joe.C <yingjoe.chen@mediatek.com>
> ---
>  .../bindings/interrupt-controller/mediatek,intpol.txt    | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/mediatek,intpol.txt

I think the place for the file should be in
Documentation/devicetree/bindings/arm/mediatek/mediatek,intpol.txt as
it is a interrupt-controller extension of the mediatek architecture.

>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/mediatek,intpol.txt b/Documentation/devicetree/bindings/interrupt-controller/mediatek,intpol.txt
> new file mode 100644
> index 0000000..16ea372
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/mediatek,intpol.txt
> @@ -0,0 +1,16 @@
> +Mediatek 65xx/81xx GIC interrupt polarity extension
> +
> +Mediatek SOCs contain controllable inverter for each GIC SPI interrupt,
> +these can be used as GIC interrupt polarity extension.
> +
> +Required properties:
> +- compatible: Compatible property value should be "mediatek,mt6577-intpol"
> +
> +- reg: Physical base address of the int pol registers and length of memory
> +  mapped region.
> +
> +Example:
> +       intpol: intpol@10200100 {
> +               compatible = "mediatek,mt6577-intpol";
> +               reg = <0x10200100 0x1c>;
> +       };
> --
> 1.8.1.1.dirty
>



-- 
motzblog.wordpress.com
