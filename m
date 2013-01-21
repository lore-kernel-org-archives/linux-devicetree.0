From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/7] ARM: sunxi: Add pinctrl driver for Allwinner SoCs
Date: Mon, 21 Jan 2013 22:28:25 +0000
Message-ID: <201301212228.25770.arnd@arndb.de>
References: <1358544639-14761-1-git-send-email-maxime.ripard@free-electrons.com> <1358544639-14761-3-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1358544639-14761-3-git-send-email-maxime.ripard@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Olof Johansson <olof@lixom.net>, Linus Walleij <linus.walleij@linaro.org>, Stefan Roese <sr@denx.de>, Alejandro Mery <amery@geeks.cl>, linux-arm-kernel@lists.infradead.org, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Friday 18 January 2013, Maxime Ripard wrote:
> The Allwinner SoCs have an IP module that handle both the muxing and the
> GPIOs.
> 
> This IP has 8 banks of 32 bits, with a number of pins actually useful
> for each of these banks varying from one to another, and depending on
> the SoC used on the board.
> 
> This driver only implements the pinctrl part, the gpio part will come
> eventually.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>
