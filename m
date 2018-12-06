From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH V5 4/6] dts: imx: add common imx7ulp dtsi support
Date: Thu, 6 Dec 2018 22:51:38 +0800
Message-ID: <20181206145135.GE12929@dragon>
References: <1541862478-7839-1-git-send-email-aisheng.dong@nxp.com>
 <1541862478-7839-5-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1541862478-7839-5-git-send-email-aisheng.dong@nxp.com>
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

On Sat, Nov 10, 2018 at 03:13:08PM +0000, A.s. Dong wrote:
> The i.MX 7ULP family of processors features NXP's advanced implementation
> of the Arm Cortex-A7 core, the Arm Cortex-M4 core, as well as a 3D and 2D
> Graphics Processing Units (GPUs).
> 
> This patch aims to add the initial support including:
> 1) CLK
> 2) GPIO PTC, PTD, PTE, PTF
> 3) uSDHC 1/2
> 4) LPUART 4/5/6/7
> 5) LPI2C 6/7
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

Changed the subject prefix like 'ARM: dts: imx: ...', and applied the
patch.

Shawn
