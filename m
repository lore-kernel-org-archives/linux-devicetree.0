From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2 0/3] ARM: dts: imx6: Support Poslab Savageboard dual &
 quad
Date: Tue, 6 Dec 2016 07:42:23 -0200
Message-ID: <CAOMZO5APWxuRmo5=QgNskxtmU-UN-P1pR1kFMZkHFMb2BPrJBQ@mail.gmail.com>
References: <20161206070829.24098-1-woogyom.kim@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161206070829.24098-1-woogyom.kim@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Milo Kim <woogyom.kim@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Milo,

On Tue, Dec 6, 2016 at 5:08 AM, Milo Kim <woogyom.kim@gmail.com> wrote:
> Poslab Savageboard is i.MX6 SoC base, but BSP code from the vendor is
> not mainline u-boot and kernel. Personal reason of using this board is
> testing etnaviv user-space driver, so I re-write device tree files based on
> mainline kernel for the first step.
>
> This patchset includes common DT file, dual and quad board files.
>
> Supported components are
>   - Display: HDMI and LVDS panel
>   - eMMC and SD card
>   - Ethernet
>   - Pinmux configuration
>   - SATA: only for Savageboard quad
>   - UART1 for debug console
>   - USB host
>
> Missing features are
>   - Audio (WM8903)
>   - USB OTG
>   - PMIC WM8326: default settings are used so no issue to bring-up the system
>   - MIPI DSI, CSI
>
> Patches are tested on the Savageboard quad but the dual version should work
> because the only difference between dual and quad is SATA support.
>
> More information in http://www.savageboard.org
>
> v2:
>   Fix DT node for regulator, phy-reset-gpios and iomuxc node.
>
> Milo Kim (3):
>   ARM: dts: imx6: Add Savageboard common file
>   ARM: dts: imx6: Support Savageboard dual
>   ARM: dts: imx6: Support Savageboard quad
>
>  arch/arm/boot/dts/imx6dl-savageboard.dts   |  50 ++++++
>  arch/arm/boot/dts/imx6q-savageboard.dts    |  54 ++++++
>  arch/arm/boot/dts/imx6qdl-savageboard.dtsi | 262 +++++++++++++++++++++++++++++

You missed to add imx6q-savageboard.dtb and imx6dl-savageboard.dtb
entries into arch/arm/boot/dts/Makefile
