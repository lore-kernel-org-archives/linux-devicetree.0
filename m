From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v5 3/5] ARM: davinci: da8xx: Add USB PHY platform
 declaration
Date: Tue, 10 May 2016 14:24:12 +0300
Message-ID: <01040628-8116-f0db-dc20-f511f6d3a2b0@cogentembedded.com>
References: <1462837612-7803-1-git-send-email-david@lechnology.com>
 <1462837612-7803-4-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1462837612-7803-4-git-send-email-david@lechnology.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>, nsekhar@ti.com, khilman@kernel.org
Cc: petr@barix.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Kishon Vijay Abraham I <kishon@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>, Bin Liu <b-liu@ti.com>, Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello.

On 5/10/2016 2:46 AM, David Lechner wrote:

> There is now a proper phy driver for the DA8xx SoC USB PHY. This adds the
> platform device declarations needed to use it.
>
> Signed-off-by: David Lechner <david@lechnology.com>

[...]
> diff --git a/arch/arm/mach-davinci/include/mach/da8xx.h b/arch/arm/mach-davinci/include/mach/da8xx.h
> index c32444b..38d932e 100644
> --- a/arch/arm/mach-davinci/include/mach/da8xx.h
> +++ b/arch/arm/mach-davinci/include/mach/da8xx.h
[...]
> @@ -230,6 +231,16 @@ int __init da8xx_register_usb11_phy_clk(bool use_usb_refclkin)
>  	return ret;
>  }
>
> +static struct platform_device da8xx_usb_phy = {
> +	.name		= "da8xx-usb-phy",
> +	.id		= 0,

    I'd have used -1 here, as this PHY device is singular.

[...]

MBR, Sergei
