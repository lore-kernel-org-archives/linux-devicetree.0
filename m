From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH v2 0/7] of: setup dma parameters using dma-ranges and
 dma-coherent
Date: Mon, 21 Apr 2014 20:19:11 +0200
Message-ID: <20140421201911.10783191@skate>
References: <1397917972-6293-1-git-send-email-santosh.shilimkar@ti.com>
	<20140419182528.414b9b2e@skate>
	<53551E9D.9080107@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <53551E9D.9080107@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Santosh Shilimkar <santosh.shilimkar@ti.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Strashko, Grygorii" <grygorii.strashko@ti.com>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Olof Johansson <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Gregory =?UTF-8?B?Q2zDqW1lbnQ=?= <gregory.clement@free-electrons.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Lior Amsalem <alior@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>
List-Id: devicetree@vger.kernel.org

Dear Santosh Shilimkar,

On Mon, 21 Apr 2014 09:35:25 -0400, Santosh Shilimkar wrote:

> > In mach-mvebu, what we do is that we register a bus notifier on the
> > platform bus, so that we can set our custom DMA operations for all
> > platform devices in the system. Should this be done in a different way
> > after your series?
> > 
> Nope. Since you have a very custom SOC specific case, you can continue
> what you are doing.

True, but as you said, the goal is to remove machine code. So instead
of having just a 'dma-coherent' property, shouldn't we have a
dma-method property, which could be dma-method = "coherent" or
dma-method = "marvell,io-coherent" and therefore allow the DT binding
to cover more use cases than just the default non-coherent and coherent
DMA operations?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
