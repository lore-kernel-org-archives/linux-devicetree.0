From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH V5 5/6] dts: fsl: add imx7ulp evk support
Date: Thu, 6 Dec 2018 22:54:31 +0800
Message-ID: <20181206145426.GF12929@dragon>
References: <1541862478-7839-1-git-send-email-aisheng.dong@nxp.com>
 <1541862478-7839-6-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1541862478-7839-6-git-send-email-aisheng.dong@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "A.s. Dong" <aisheng.dong@nxp.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "dongas86@gmail.com" <dongas86@gmail.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sat, Nov 10, 2018 at 03:13:12PM +0000, A.s. Dong wrote:
> The NXP i.MX 7ULP Evaluation Kit (EVK) provides a platform for rapid
> evaluation of the i.MX 7ULP, which features NXP's advanced implementation
> of the Arm Cortex-A7 core, the Arm Cortex-M4 core, as well as a 3D and
> 2D Graphics Processing Units (GPUs).
> 
> The EVK enables HDMI output for simple out-of-the-box to bring up but
> allows reconfiguration for MIPI displays. The EVK is designed as a
> System-On-Module(SOM) board that connects to an associated baseboard.
> The SOM provides 1 GB LPDDR3, 8 MB Quad SPI flash, Micro SD 3.0 card
> socket, WiFi/ Bluetooth capability, USB 2.0 OTG with Type C connector
> and an NXP PF1550 power management IC (PMIC). The baseboard provides
> additional capabilities including a full SD/MMC 3.0 card socket, audio
> codec, multiple sensors, an HDMI connector, and an alternate MIPI display
> connector. Additionally, the EVK facilitates software development with the
> ultimate goal of faster time to market through the support of both
> Linux OS and AndroidTM rich operating systems, as well as FreeRTOS.
> 
> This patch aims to support the preliminary booting up features
> as follows:
> GPIO
> LPUART
> FEC
> SD/MMC
> 
> See more board details:
> https://www.nxp.com/products/processors-and-microcontrollers/
> arm-based-processors-and-mcus/i.mx-applications-processors/
> i.mx-7-processors/evaluation-kit-for-the-i.mx-7ulp-applications
> -processor:MCIMX7ULP-EVK
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Reviewed-by: Fabio Estevam <festevam@gmail.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

Changed the subject prefix like 'ARM: dts: imx: ...', and applied the
patch.

Shawn
