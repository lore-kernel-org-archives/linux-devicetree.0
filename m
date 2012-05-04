From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v8] gpio: Device tree support for LPC32xx
Date: Fri, 4 May 2012 12:57:58 +0000
Message-ID: <201205041257.58252.arnd@arndb.de>
References: <1336076428-29419-1-git-send-email-stigge@antcom.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1336076428-29419-1-git-send-email-stigge@antcom.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Roland Stigge <stigge@antcom.de>
Cc: grant.likely@secretlab.ca, arm@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linus.walleij@stericsson.com, kevin.wells@nxp.com, srinivas.bakki@nxp.com, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com
List-Id: devicetree@vger.kernel.org

On Thursday 03 May 2012, Roland Stigge wrote:
> This patch adds device tree support for gpio-lpc32xx.c.
> 
> The various GPIO groups correspond to the different irregular GPIO banks of the
> LPC32xx hardware. Most importantly, there are the GPI(0-27), GPO(0-23) and
> GPIO(0-5) banks. Each bank must be registered individually since they are
> implemented with different functions. Registration is done via gpiochip_add()
> which requires an individual gpio bank subnode in the device tree for each
> call.
> 
> Signed-off-by: Roland Stigge <stigge@antcom.de>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
