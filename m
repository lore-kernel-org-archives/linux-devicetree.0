From: Dong Aisheng <dongas86@gmail.com>
Subject: Re: [PATCH 6/7] ARM: dts: imx6ull: add IOMUXC SNVS instance
Date: Tue, 9 Jan 2018 17:35:28 +0800
Message-ID: <20180109093528.GE26312@b29396-OptiPlex-7040>
References: <20180102164223.15230-1-stefan@agner.ch>
 <20180102164223.15230-6-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180102164223.15230-6-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: shawnguo@kernel.org, kernel@pengutronix.de, fabio.estevam@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 02, 2018 at 05:42:22PM +0100, Stefan Agner wrote:
> The i.MX 6ULL features another IOMUX Controller called IOMUXC
> SNVS which allows to control BOOT_MODE and TAMPER pins. Add the
> controller to the i.MX 6ULL specific imx6ull.dtsi device tree.
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>

Looks good.
Acked-by: Dong Aisheng <aisheng.dong@nxp.com>

Regards
Dong Aisheng
