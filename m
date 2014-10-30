From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 3/3] ARM: dts: mt8135: Add Reset Controller for MediaTek SoC
Date: Thu, 30 Oct 2014 11:11:09 +0100
Message-ID: <2325869.W8YWKQm70A@wuerfel>
References: <1414638733-10080-1-git-send-email-flora.fu@mediatek.com> <1414638733-10080-4-git-send-email-flora.fu@mediatek.com> <1414659745.3069.2.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1414659745.3069.2.camel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: flora.fu@mediatek.com, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, arm@kernel.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, Olof Johansson <olof@lixom.net>
List-Id: devicetree@vger.kernel.org

On Thursday 30 October 2014 10:02:25 Philipp Zabel wrote:
> Since the reset controller driver accesses registers solely through the
> syscon regmap, I'd prefer to keep with the device tree control graph
> concept and make the reset-controller nodes children of the syscon
> nodes. I've brought this up before: https://lkml.org/lkml/2014/5/27/422,
> and I think this is another case where child node support for syscon
> makes sense:
> 
>         infracfg: syscon@10001000 {
>                 compatible = "mediatek,mt8135-infracfg", "syscon";
>                 reg = <0 0x10001000 0 0x1000>;
>                 
>                 infrarst: reset-controller@30 {
>                         #reset-cells = <1>;
>                         compatible = "mediatek,mt8135-infracfg-reset", "mediatek,reset";
>                         reg = <0x30 0x8>;
>                 };
>         };
> 

Yes, this looks much better to me too.

	Arnd
