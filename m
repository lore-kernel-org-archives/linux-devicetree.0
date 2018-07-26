From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH] MIPS: mscc: ocelot: fix length of memory address space
 for MIIM
Date: Thu, 26 Jul 2018 10:41:28 -0700
Message-ID: <20180726174128.vixw6ratago26sli@pburton-laptop>
References: <20180725122132.31187-1-quentin.schulz@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180725122132.31187-1-quentin.schulz@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Quentin Schulz <quentin.schulz@bootlin.com>
Cc: alexandre.belloni@bootlin.com, robh+dt@kernel.org, mark.rutland@arm.com, ralf@linux-mips.org, jhogan@kernel.org, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com
List-Id: devicetree@vger.kernel.org

Hi Quentin,

On Wed, Jul 25, 2018 at 02:21:32PM +0200, Quentin Schulz wrote:
> The length of memory address space for MIIM0 is from 0x7107009c to
> 0x710700bf included which is 36 bytes long in decimal, or 0x24 bytes in
> hexadecimal and not 0x36.
> 
> Fixes: 49b031690abe ("MIPS: mscc: Add switch to ocelot")
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>
> ---
>  arch/mips/boot/dts/mscc/ocelot.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks - applied to mips-next for 4.19.

Paul
