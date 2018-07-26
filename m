From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH] MIPS: mscc: ocelot: add MIIM1 bus
Date: Thu, 26 Jul 2018 10:41:56 -0700
Message-ID: <20180726174156.kj4xcxbvv4q7tc32@pburton-laptop>
References: <20180725122241.31370-1-quentin.schulz@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180725122241.31370-1-quentin.schulz@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Quentin Schulz <quentin.schulz@bootlin.com>
Cc: alexandre.belloni@bootlin.com, robh+dt@kernel.org, mark.rutland@arm.com, ralf@linux-mips.org, jhogan@kernel.org, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com
List-Id: devicetree@vger.kernel.org

Hi Quentin,

On Wed, Jul 25, 2018 at 02:22:41PM +0200, Quentin Schulz wrote:
> There is an additional MIIM (MDIO) bus in this SoC so let's declare it
> in the dtsi.
> 
> This bus requires GPIO 14 and 15 pins that need to be muxed. There is no
> support for internal PHY reset on this bus on the contrary of MIIM0 so
> there is only one register address space and not two.
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>
> ---
>  arch/mips/boot/dts/mscc/ocelot.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Thanks - applied to mips-next for 4.19.

Paul
