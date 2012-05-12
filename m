From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v9 2/2] gpio: Device tree support for LPC32xx
Date: Sat, 12 May 2012 13:21:32 +0000
Message-ID: <201205121321.33106.arnd@arndb.de>
References: <1336729660-7670-1-git-send-email-stigge@antcom.de> <1336729660-7670-2-git-send-email-stigge@antcom.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1336729660-7670-2-git-send-email-stigge@antcom.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Roland Stigge <stigge@antcom.de>
Cc: glikely@secretlab.ca, arm@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linus.walleij@stericsson.com, kevin.wells@nxp.com, srinivas.bakki@nxp.com, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com
List-Id: devicetree@vger.kernel.org

On Friday 11 May 2012, Roland Stigge wrote:
> This patch adds device tree support for gpio-lpc32xx.c.
> 
> To register the various GPIO banks as (struct) gpio_chips via the same DT
> gpio-controller, we utilize the adjusted of_xlate API to manipulate the
> actually used struct gpio_chip.
> 
> Signed-off-by: Roland Stigge <stigge@antcom.de>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
