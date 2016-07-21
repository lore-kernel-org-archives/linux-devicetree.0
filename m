From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 14/18] ARM: mvebu: add support for the Armada 395 SoC
 family
Date: Thu, 21 Jul 2016 17:16:05 -0500
Message-ID: <20160721221605.GA21883@rob-hp-laptop>
References: <1469105055-25181-1-git-send-email-jaz@semihalf.com>
 <1469105055-25181-16-git-send-email-jaz@semihalf.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1469105055-25181-16-git-send-email-jaz@semihalf.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grzegorz Jaszczyk <jaz@semihalf.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com, jason@lakedaemon.net, andrew@lunn.ch, sebastian.hesselbarth@gmail.com, linux@armlinux.org.uk, thomas.petazzoni@free-electrons.com, gregory.clement@free-electrons.com, mw@semihalf.com, alior@marvell.com
List-Id: devicetree@vger.kernel.org

On Thu, Jul 21, 2016 at 02:44:11PM +0200, Grzegorz Jaszczyk wrote:
> Beside interfaces described in the armada-39x.dtsi, the Armada 395 SoC
> family supports: 2 x SATA3 (2 ports in one unit) and the USB3.0
> 
> Signed-off-by: Grzegorz Jaszczyk <jaz@semihalf.com>
> ---
>  .../devicetree/bindings/arm/marvell/armada-39x.txt |  2 +-
>  arch/arm/boot/dts/armada-395.dtsi                  | 76 ++++++++++++++++++++++
>  2 files changed, 77 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/armada-395.dtsi
> 
> diff --git a/Documentation/devicetree/bindings/arm/marvell/armada-39x.txt b/Documentation/devicetree/bindings/arm/marvell/armada-39x.txt
> index 53d4ff9..f066801 100644
> --- a/Documentation/devicetree/bindings/arm/marvell/armada-39x.txt
> +++ b/Documentation/devicetree/bindings/arm/marvell/armada-39x.txt
> @@ -17,4 +17,4 @@ compatible: must contain "marvell,armada398"
>  
>  Example:
>  
> -compatible = "marvell,a398-db", "marvell,armada398", "marvell,armada390";
> +compatible = "marvell,a398-db", "marvell,armada398", "marvell,armada395", "marvell,armada390";

If 395 came after 398, then it should come first in the order. This 
implies that marvell,armada398 is a better match than marvell,armada395. 
Or perhaps you shouldn't have both?

Rob
