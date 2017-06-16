From: Simon Horman <horms@verge.net.au>
Subject: Re: [RESEND PATCH v5 06/16] ARM: dts: r7s72100: Add generic
 compatible string for I2C EEPROM
Date: Fri, 16 Jun 2017 15:36:44 +0200
Message-ID: <20170616133644.GA26834@verge.net.au>
References: <20170615185418.13980-1-javier@dowhile0.org>
 <20170615185418.13980-7-javier@dowhile0.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170615185418.13980-7-javier@dowhile0.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@dowhile0.org>
Cc: linux-kernel@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 15, 2017 at 08:54:08PM +0200, Javier Martinez Canillas wrote:
> The at24 driver allows to register I2C EEPROM chips using different vendor
> and devices, but the I2C subsystem does not take the vendor into account
> when matching using the I2C table since it only has device entries.
> 
> But when matching using an OF table, both the vendor and device has to be
> taken into account so the driver defines only a set of compatible strings
> using the "atmel" vendor as a generic fallback for compatible I2C devices.
> 
> So add this generic fallback to the device node compatible string to make
> the device to match the driver using the OF device ID table.
> 
> Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, I have queued this up in the renesas tree for v4.14.
