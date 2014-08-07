From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] ARM: shmobile: koelsch: add VIN1/ADV7180 DT support
Date: Thu, 7 Aug 2014 09:47:41 +0900
Message-ID: <20140807004741.GA32766@verge.net.au>
References: <201408020402.14560.sergei.shtylyov@cogentembedded.com>
 <2131152.vMTPsJUYLQ@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2131152.vMTPsJUYLQ@wasted.cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: sergei.shtylyov@cogentembedded.com
Cc: linux-sh@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 06, 2014 at 10:38:22PM +0400, sergei.shtylyov@cogentembedded.com wrote:
> Define the Koelsch board dependent part of the VIN1 device node. Add the device
> node for Analog  Devices ADV7180  video decoder to  I2C2 bus. Add the necessary
> subnodes to interconnect VIN1 and ADV7180 devices.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> This patch is against the 'renesas-devel-v3.16-20140804' tag of Simon Horman's
> 'renesas.git' repo. It requires the 'soc_camera' and 'rcar_vin' device tree
> support patches (already merged to the 'media_tree.git' repo) in order to work.
> 
>  arch/arm/boot/dts/r8a7791-koelsch.dts |   35 ++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)

Thanks, I have queued this up for v3.18.
