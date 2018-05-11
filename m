From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] arm: dts: imx: fix IPU OF graph endpoint node names
Date: Fri, 11 May 2018 16:35:56 +0800
Message-ID: <20180511083554.GF26863@dragon>
References: <20180508135930.5768-1-robh@kernel.org>
 <20180508135930.5768-2-robh@kernel.org>
 <CAOMZO5A+7YW89E5PEo6841hk8GQUr2k7D+xWPGb1iqvpD096Rg@mail.gmail.com>
 <CAL_JsqKcz=i0ELosVvuhevMSxa2q8pE+2WcAk57sg8ns5X-mtg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqKcz=i0ELosVvuhevMSxa2q8pE+2WcAk57sg8ns5X-mtg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Fabio Estevam <festevam@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 08, 2018 at 10:22:29AM -0500, Rob Herring wrote:
> On Tue, May 8, 2018 at 9:06 AM, Fabio Estevam <festevam@gmail.com> wrote:
> > Hi Rob,
> >
> > On Tue, May 8, 2018 at 10:59 AM, Rob Herring <robh@kernel.org> wrote:
> >
> >> diff --git a/arch/arm/boot/dts/imx6qdl-sabrelite.dtsi b/arch/arm/boot/dts/imx6qdl-sabrelite.dtsi
> >> index 18b65052553d..654cf2c9b073 100644
> >> --- a/arch/arm/boot/dts/imx6qdl-sabrelite.dtsi
> >> +++ b/arch/arm/boot/dts/imx6qdl-sabrelite.dtsi
> >> @@ -379,9 +379,6 @@
> >>                 powerdown-gpios = <&gpio6 9 GPIO_ACTIVE_HIGH>; /* NANDF_WP_B */
> >>
> >>                 port {
> >> -                       #address-cells = <1>;
> >> -                       #size-cells = <0>;
> >> -
> >>                         ov5640_to_mipi_csi2: endpoint {
> >>                                 remote-endpoint = <&mipi_csi2_in>;
> >>                                 clock-lanes = <0>;
> >> diff --git a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi b/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
> >> index f019f9900369..c2de2250718c 100644
> >> --- a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
> >> +++ b/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
> >> @@ -294,9 +294,6 @@
> >>                 reset-gpios = <&gpio1 20 GPIO_ACTIVE_LOW>;
> >>
> >>                 port {
> >> -                       #address-cells = <1>;
> >> -                       #size-cells = <0>;
> >> -
> >>                         ov5640_to_mipi_csi2: endpoint {
> >
> > These two changes seem unrelated and I have already fixed them at:
> > https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git/commit/?h=imx/dt&id=1b215c73d1586e6f2586e9a6d6dfaf49cc142b3a
> 
> Right. Will drop them.

Applied.  The git am command dropped them automatically.  Thanks.

Shawn
