From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/3] dt-bindings: Add Reset Controller for MediaTek SoC
Date: Thu, 30 Oct 2014 11:10:20 +0100
Message-ID: <2323181.epJX0Uxj7x@wuerfel>
References: <1414638733-10080-1-git-send-email-flora.fu@mediatek.com>
 <1414638733-10080-3-git-send-email-flora.fu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1414638733-10080-3-git-send-email-flora.fu@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: flora.fu@mediatek.com
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, arm@kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Olof Johansson <olof@lixom.net>, linux-kernel@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thursday 30 October 2014 11:12:12 flora.fu@mediatek.com wrote:
> +
> +example:
> +       infrarst: reset-controller@10001030 {
> +               #reset-cells = <1>;
> +               compatible = "mediatek,mt8135-infracfg-reset", "mediatek,reset";
> +               mediatek,syscon-reset = <&infracfg 0x30 0x8>;
> +       };

I think you need to change the 'unit-address' now, i.e. the @10001030
value above no longer matches any reg property. You could just
remove that part.

> +Specifying reset lines connected to IP modules
> +==============================================
> +
> +The reset controller(mtk-reset) manages various reset sources. Those device nodes should
> +specify the reset line on the rstc in their resets property, containing a phandle to the
> +rstc device node and a RESET_INDEX specifying which module to reset, as described in 
> +reset.txt.
> +
> +For MediaTek SoC, RESET_INDEX is reset bit defined in INFRACFG or PERICFG registers.
> +
> +example:
> +pwrap: pwrap@1000f000 {
> +       compatible = "mediatek,mt8135-pwrap";
> +       reg = <0 0x1000f000 0 0x1000>,
> +               <0 0x11017000 0 0x1000>;
> +       reg-names = "pwrap-base",
> +               "pwrap-bridge-base";
> +       resets = <&infrarst 7>, <&perirst 34>;
> +       reset-names = "infrarst", "perirst";
> +       };
> +};
> 

You have an extraneous '};' here.

	Arnd
