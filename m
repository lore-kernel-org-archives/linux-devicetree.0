From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V4 3/5] arm64: dts: imx: add imx8qxp support
Date: Mon, 12 Nov 2018 20:06:25 -0600
Message-ID: <20181113020625.GA29822@bogus>
References: <1541864596-15958-1-git-send-email-aisheng.dong@nxp.com>
 <1541864596-15958-4-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1541864596-15958-4-git-send-email-aisheng.dong@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
Cc: "A.s. Dong" <aisheng.dong@nxp.com>, Mark Rutland <mark.rutland@arm.com>, "dongas86@gmail.com" <dongas86@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sat, 10 Nov 2018 15:48:19 +0000, "A.s. Dong" wrote:
> i.MX 8QuadXPlus is a quad (4x) Cortex-A35 proccessor with powerful
> graphic and multimedia features. This patch adds the core SoC dtsi
> file support.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: devicetree@vger.kernel.org
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
> v4->v5:
>  * update to new power domain binding
>    power domain subnodes removed from dts
>  * add LPCG clock nodes
>  * clock ID updated accordingly
> v2->v3:
>  * add more SoC specific compatible string to IP nodes
>  * move memory node into board dts
>  * change pd reg value into hex
>  * add more explanation about SoC in commit message
>  * add external clocks
>  * remove pmu compatible string which is not supported
> v1->v2:
>  * mu binding usage update
>  * no define for node address
>  * do not use '_' for node name
>  * drop 'fsl-' prefix for imx dtsi
>  * no defines for unit address
>  * generic node names
>  * range map for 32bit register
>  * separate board dts
> 
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.txt |   4 +
>  arch/arm64/boot/dts/freescale/imx8-ca35.dtsi  |  61 ++++
>  arch/arm64/boot/dts/freescale/imx8qxp.dtsi    | 409 ++++++++++++++++++++++++++
>  3 files changed, 474 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8-ca35.dtsi
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> 

Reviewed-by: Rob Herring <robh@kernel.org>
