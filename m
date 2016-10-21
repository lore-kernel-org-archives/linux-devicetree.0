From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 00/10] [v3] arm64: dts: add QorIQ LS1046A SoC and boards
 support
Date: Fri, 21 Oct 2016 21:38:41 +0800
Message-ID: <20161021133707.GH30578@tiger>
References: <1473754203-22970-1-git-send-email-shh.xie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1473754203-22970-1-git-send-email-shh.xie@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: shh.xie@gmail.com
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will.deacon@arm.com, linux-kernel@vger.kernel.org, Shaohui Xie <Shaohui.Xie@nxp.com>, arnd@arndb.de
List-Id: devicetree@vger.kernel.org

On Tue, Sep 13, 2016 at 04:09:53PM +0800, shh.xie@gmail.com wrote:
> From: Shaohui Xie <Shaohui.Xie@nxp.com>
> 
> This patchest adds support for QorIQ LS1046A SoC which is based on ARMv8
> architecture, also adds LS1046A-RDB and LS1046A-QDS board support.
> 
> Also, updates bindings for SoC-specific devices SCFG and DCFG,
> I2C devices, qoriq-clock and ahci-fsl-qoriq.
> 
> Mingkai Hu (2):
>   arm64: dts: add QorIQ LS1046A SoC support
>   arm64: dts: add LS1046A-RDB board support
> 
> Shaohui Xie (8):
>   dt-bindings: fsl: update for more SoCs
>   dt-bindings: fsl: updates bindings for some SoC-specific devices
>   dt-bindings: i2c: adds two more nxp devices
>   dt-bindings: qoriq-clock: update for more SoCs
>   dt-bindings: ahci-fsl-qoriq: updated for SoC ls1046a
>   Documentation: DT: Add entry for QorIQ LS1046A-RDB board
>   Documentation: DT: Add entry for QorIQ LS1046A-QDS board
>   arm64: dts: add LS1046A-QDS board support

I updated dt-bindings patch subject per Rob's comment, and then applied
the series.

Shawn
