From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/2] net/smscx5xx: use the device tree for mac address
Date: Wed, 03 Feb 2016 16:23:59 +0100
Message-ID: <2240729.oauKHqo53h@wuerfel>
References: <1454511759-24827-1-git-send-email-lkundrak@v3.sk> <1454511759-24827-2-git-send-email-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1454511759-24827-2-git-send-email-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Lubomir Rintel <lkundrak@v3.sk>
Cc: linux-rpi-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Anholt <eric@anholt.net>, Lee Jones <lee@kernel.org>, Stephen Warren <swarren@wwwdotorg.org>, Peter Chen <peter.chen@freescale.com>
List-Id: devicetree@vger.kernel.org

On Wednesday 03 February 2016 16:02:38 Lubomir Rintel wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This takes the MAC address for smsc75xx/smsc95xx USB network devices
> from a the device tree. This is required to get a usable persistent
> address on the popular beagleboard, whose hardware designers
> accidentally forgot that an ethernet device really requires an a
> MAC address to be functional.
> 
> The smsc75xx and smsc95xx drivers are just two copies of the
> same code, so better fix both.
> 
> Tested-by: Lubomir Rintel <lkundrak@v3.sk>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 

I have no memory of writing this patch, where did you find it?

The changelog sounds like I wrote it, so I assume it was me after all.

> +       address = of_get_property(dev->udev->dev.of_node,
> +                                 "local-mac-address", NULL);
> +       if (address) {
> +               memcpy(dev->net->dev_addr, address, ETH_ALEN);
> +               return;
> +       }

This should use of_get_mac_address(), not an open-coded property
lookup. The function was probably added after I wrote the
the original patch.

	Arnd
