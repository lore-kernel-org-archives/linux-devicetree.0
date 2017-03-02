From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2] ARM: dts: imx50: imx50-esdhc use imx53-esdhc
Date: Thu, 2 Mar 2017 19:12:42 -0300
Message-ID: <CAOMZO5CK=EijB651LC74Wn=hFAs10wmjxvaCGgGrQ8+XcaF1kw@mail.gmail.com>
References: <1488488628-11711-1-git-send-email-akurz@blala.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1488488628-11711-1-git-send-email-akurz@blala.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alexander Kurz <akurz@blala.de>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 2, 2017 at 6:03 PM, Alexander Kurz <akurz@blala.de> wrote:
> According to the reference manuals, both imx50/imx53 SOC seem to share
> the same eSDHC controller, especially the section on "Multi-block Read"
> mentioned in commit 361b8482026c ("mmc: sdhci-esdhc-imx: fix multiblock
> reads on i.MX53") is identical for both SOC.
> Hence, let imx50 use imx53-esdhc.
>
> Signed-off-by: Alexander Kurz <akurz@blala.de>

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
