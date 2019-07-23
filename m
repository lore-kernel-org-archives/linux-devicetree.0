From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 00/10] Add further support for PHYTEC phyBOARD-Segin
Date: Tue, 23 Jul 2019 13:39:53 +0800
Message-ID: <20190723053951.GN3738@dragon>
References: <1562656767-273566-1-git-send-email-s.riedmueller@phytec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1562656767-273566-1-git-send-email-s.riedmueller@phytec.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Riedmueller <s.riedmueller@phytec.de>
Cc: s.hauer@pengutronix.de, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, martyn.welch@collabora.com, linux-kernel@vger.kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, festevam@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 09, 2019 at 09:19:17AM +0200, Stefan Riedmueller wrote:
> This patchstack adjusts the already existing naming for the PHYTEC
> phyBOARD-Segin to the PHYTEC naming scheme that is already used with the
> phyCORE-i.MX 6 and the phyBOARD-Mira.
> 
> Furthermore it introduces some small fixes and adds support for the PHYTEC
> phyCORE-i.MX 6ULL which also comes with the phyBORAD-Segin. It comes in a
> full featured option with either NAND flash or eMMC and a low cost option
> only with NAND flash.
> 
> Stefan Riedmueller (10):
>   ARM: dts: imx6ul: phyboard-segin: Rename dts to PHYTEC name scheme
>   ARM: dts: imx6ul: segin: Add boot media to dts filename
>   ARM: dts: imx6ul: segin: Reduce eth drive strength
>   ARM: dts: imx6ul: segin: Fix LED naming for phyCORE and PEB-EVAL-01
>   ARM: dts: imx6ul: segin: Make FEC and ethphy configurable in dts
>   ARM: dts: imx6ul: segin: Only enable NAND if it is populated
>   ARM: dts: imx6ul: phycore: Add eMMC at usdhc2
>   ARM: dts: imx6ul: segin: Move ECSPI interface to board include file
>   ARM: dts: imx6ul: segin: Move machine include to dts files
>   ARM: dts: imx6ull: Add support for PHYTEC phyBOARD-Segin with i.MX
>     6ULL

I applied the series, but please send a follow-up patch for those
undocumented board compatibles.

Shawn
