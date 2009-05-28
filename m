From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Thu, 28 May 2009 12:17:32 +0000 (UTC)
Message-ID: <gvlvcs$ub5$1@ger.gmane.org>
References: <20090527175609.GB31861@flint.arm.linux.org.uk>
	<1243496236.3171.140.camel@pasglop>
	<20090528091513.GA14789@n2100.arm.linux.org.uk>
	<20090528.025739.16559619.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1761426AbZE1MRx@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: devicetree-discuss@ozlabs.org, linux-arm-kernel@lists.arm.linux.org.uk
List-Id: devicetree@vger.kernel.org

David Miller wrote:

> From: Russell King - ARM Linux
> <linux@arm.linux.org.uk> Date: Thu, 28 May 2009
> 10:15:13 +0100
> 
>> For example, how would an IrDA transceiver be expressed in OF?
> 
> As a child device node of the IRDA device, with associated properties.
> 
> You can express _ANYTHING_ using the OF device tree.  It is not even
> something to discuss, it's flexible enough.

Hmmm. How to express the following situation:
On one of my platforms (sharp tosa) the backlight controller
is separated into two parts: one sitting on SPI, one on the I2C.
The tricky part is that the I2C part is only available when some
of registers of SPI part are programmed in a specific way.

-- 
With best wishes
Dmitry
