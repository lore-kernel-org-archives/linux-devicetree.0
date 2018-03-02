From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/5] arm: zynq: Add Xilinx cc108 board
Date: Fri, 2 Mar 2018 12:13:28 -0600
Message-ID: <20180302181328.wbgnnw2jsuorfahi@rob-hp-laptop>
References: <cover.1519398009.git.michal.simek@xilinx.com>
 <eb2fec632fcb7fbfed39dcbeae92b38a98518618.1519398009.git.michal.simek@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <eb2fec632fcb7fbfed39dcbeae92b38a98518618.1519398009.git.michal.simek@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: devicetree@vger.kernel.org, monstr@monstr.eu, Steffen Trumtrar <s.trumtrar@pengutronix.de>, linux-kernel@vger.kernel.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, Rob Herring <robherring2@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Josh Cartwright <josh.cartwright@ni.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Feb 23, 2018 at 04:00:19PM +0100, Michal Simek wrote:
> The board contains 7z010 with 512MB memory, ethernet, qspi, uart, usbs
> and sd. But board is not supporting booting from sd card.
> 
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> ---
> 
> Changes in v2:
> - Record compatible string to xilinx.txt
> 
>  Documentation/devicetree/bindings/arm/xilinx.txt |  5 ++
>  arch/arm/boot/dts/Makefile                       |  1 +
>  arch/arm/boot/dts/zynq-cc108.dts                 | 75 ++++++++++++++++++++++++
>  3 files changed, 81 insertions(+)
>  create mode 100644 arch/arm/boot/dts/zynq-cc108.dts

Reviewed-by: Rob Herring <robh@kernel.org>
