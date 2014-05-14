From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 0/6] Add platform support for LSI AXM55xx
Date: Wed, 14 May 2014 20:56:24 +0200
Message-ID: <6334605.NlytHCzYVP@wuerfel>
References: <cover.1400072260.git.anders.berg@avagotech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1400072260.git.anders.berg@avagotech.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anders Berg <anders.berg@avagotech.com>
Cc: Olof Johansson <olof@lixom.net>, Linus Walleij <linus.walleij@linaro.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wednesday 14 May 2014 20:37:55 Anders Berg wrote:
> 
> This is version 3 of this series to introduces basic platform support for the LSI
> AXM5516 SoC.
> 
> No major changes since v2. Ready to be applied to the arm-soc tree?

I think it's good, but I'm not sure if we should put them all into arm-soc.
There are no dependencies between the drivers that I can see, so why not
merge the clock and reset drivers through the individual subsystem maintainers?

We can take patches 1/3/4/6, and the others if there is a good reason
not to have the regular maintainers pick them up.

The hip04 platform series is also adding a multi_v7_lpae_defconfig file.
it would be good to add axxia to that config and also to the regular
multi_v7_defconfig, but that can be an add-on patch once we have merged
hip04.

	Arnd
