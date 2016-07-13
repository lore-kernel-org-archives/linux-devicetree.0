From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] ARM: dts: NSP: Correct RAM amount for BCM958625HR board
Date: Wed, 13 Jul 2016 14:23:37 -0700
Message-ID: <5786B159.7060102@gmail.com>
References: <1468433929-12232-1-git-send-email-jon.mason@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1468433929-12232-1-git-send-email-jon.mason@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Mason <jon.mason@broadcom.com>, f.fainelli@gmail.com
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 07/13/2016 11:18 AM, Jon Mason wrote:
> The BCM958625HR board has 2GB of RAM available.  Increase the amount
> from 512MB to 2GB and add the device type to the memory entry.
> 
> Signed-off-by: Jon Mason <jon.mason@broadcom.com>
> ---
>  arch/arm/boot/dts/bcm958625hr.dts | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/bcm958625hr.dts b/arch/arm/boot/dts/bcm958625hr.dts
> index 4239e58..66c658a 100644
> --- a/arch/arm/boot/dts/bcm958625hr.dts
> +++ b/arch/arm/boot/dts/bcm958625hr.dts
> @@ -47,7 +47,8 @@
>  	};
>  
>  	memory {
> -		reg = <0x60000000 0x20000000>;
> +		device_type = "memory";
> +		reg = <0x60000000 0x40000000>;

That's just one 1GB, did you intend to provide 0x8000_0000 instead here?
-- 
Florian
