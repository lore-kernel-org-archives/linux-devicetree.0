From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [RESEND, v5, 16/16] powerpc/44x: Add generic compatible string for I2C EEPROM
Date: Thu, 29 Jun 2017 22:21:16 +1000 (AEST)
Message-ID: <3wyzKS5H8Rz9s3T@ozlabs.org>
References: <20170615185418.13980-17-javier@dowhile0.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170615185418.13980-17-javier@dowhile0.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>, Javier Martinez Canillas <javier@dowhile0.org>, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Thu, 2017-06-15 at 18:54:18 UTC, Javier Martinez Canillas wrote:
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

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/adeb8667eaf5f00b5a7f0cede680cd

cheers
