From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 10/25] arm: orion5x: dts: Remove leading 0x and 0s from
 bindings notation
Date: Fri, 15 Dec 2017 14:01:02 +0100
Message-ID: <20171215130102.GF4213@lunn.ch>
References: <20171215124642.30384-1-malat@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171215124642.30384-1-malat@debian.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathieu Malaterre <malat@debian.org>
Cc: Rob Herring <robh+dt@kernel.org>, Jason Cooper <jason@lakedaemon.net>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@free-electrons.com>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Dec 15, 2017 at 01:46:42PM +0100, Mathieu Malaterre wrote:
> Improve the DTS files by removing all the leading "0x" and zeros to fix the

...

>  			};
>  
> -			uboot_env@3F000 {
> +			uboot_env@3f000 {
>  				reg = <0x3F000 0x1000>;

Hi Mathieu

Thanks for looking at this. But the commit message does not fit the
actual change.

       Andrew
