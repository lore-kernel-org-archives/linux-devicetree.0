From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 09/32] bcm2837-rpi-3-b.dts for 32bit arm
Date: Thu, 02 Jun 2016 00:00:25 +0200
Message-ID: <7065434.SNfT8zjcK3@wuerfel>
References: <1464817421-8519-1-git-send-email-kraxel@redhat.com> <1464817421-8519-10-git-send-email-kraxel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464817421-8519-10-git-send-email-kraxel@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: linux-rpi-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@armlinux.org.uk>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wednesday, June 1, 2016 11:43:18 PM CEST Gerd Hoffmann wrote:
> diff --git a/arch/arm/boot/dts/bcm2837-rpi-3-b.dts b/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
> new file mode 100644
> index 0000000..36178a6
> --- /dev/null
> +++ b/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
> @@ -0,0 +1 @@
> +#include "../../../arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts"
> -- 
> 1.8.3.1
> 

What does this gain you?

	Arnd
