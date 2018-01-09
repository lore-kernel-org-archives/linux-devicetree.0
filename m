From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 5/5] pinctrl: imx6ul: add IOMUXC SNVS pinctrl driver
 for i.MX 6ULL
Date: Tue, 9 Jan 2018 15:07:47 +0100
Message-ID: <CACRpkdYJcS3Ng=uR-iPgJ22ABfbiVENjWGsaWwShUfbg1hU4+g@mail.gmail.com>
References: <20180106142553.15322-1-stefan@agner.ch>
 <20180106142553.15322-6-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180106142553.15322-6-stefan@agner.ch>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stefan Agner <stefan@agner.ch>, Dong Aisheng <aisheng.dong@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Bai Ping <ping.bai@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sat, Jan 6, 2018 at 3:25 PM, Stefan Agner <stefan@agner.ch> wrote:

> From: Bai Ping <ping.bai@nxp.com>
>
> On i.MX 6ULL, the BOOT_MODEx and TAMPERx pin MUX and CTRL registers
> are available in a separate IOMUXC_SNVS module. Add support for the
> IOMUXC_SNVS module to the i.MX 6UL pinctrl driver.
>
> Signed-off-by: Bai Ping <ping.bai@nxp.com>
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> Reviewed-by: Rob Herring <robh@kernel.org>

Patch applied.

I need clear maintainership for Freescale pin controllers.

Stefan, would you consider making a patch adding you, Dong
Aisheng and Shawn Guo as maintainers in
MAINTAINERS for
drivers/pinctrl/freescale/*
Documentation/devicetree/bindings/pinctrl/fsl,*
?

I don't know if Shawn want to be added, but he wrote the first
version so unless he says explicitly no I think he should be
included.

Sascha, do you also wanna be included?

Yours,
Linus Walleij
