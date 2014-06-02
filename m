From: Shawn Guo <shawn.guo@freescale.com>
Subject: Re: [PATCH v3 0/7] of: setup dma parameters using dma-ranges and
 dma-coherent
Date: Mon, 2 Jun 2014 14:37:04 +0800
Message-ID: <20140602063702.GB7834@dragon>
References: <1398353407-2345-1-git-send-email-santosh.shilimkar@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1398353407-2345-1-git-send-email-santosh.shilimkar@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Santosh Shilimkar <santosh.shilimkar@ti.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Grygorii Strashko <grygorii.strashko@ti.com>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Apr 24, 2014 at 11:30:00AM -0400, Santosh Shilimkar wrote:
> Here is an updated v3 of the series. Series introduces support for setting up
> dma parameters based on device tree properties like 'dma-ranges' and
> 'dma-coherent' and also update to ARM 32 bit port. Earlier version of the
> series can be found here [3], [2] and [1].

Are these two generic device tree properties documented somewhere under
Documentation/devicetree/bindings?

Shawn
