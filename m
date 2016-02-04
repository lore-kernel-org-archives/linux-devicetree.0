From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/2] net/smscx5xx: use the device tree for mac address
Date: Thu, 04 Feb 2016 09:24 +0100
Message-ID: <40411294.EnLd2i85mo@wuerfel>
References: <1454571364-24708-1-git-send-email-lkundrak@v3.sk> <1454571364-24708-3-git-send-email-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1454571364-24708-3-git-send-email-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Lubomir Rintel <lkundrak@v3.sk>
Cc: linux-rpi-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Chen <peter.chen@freescale.com>, Olivier Blin <dev@blino.org>, Stephen Warren <swarren@wwwdotorg.org>, popcornmix <popcornmix@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thursday 04 February 2016 08:36:04 Lubomir Rintel wrote:
> 
> [lkundrak@v3.sk: updated to use of_get_property() as per suggestion from Arnd,
> reworded the message and comments a bit]
> 
> Tested-by: Lubomir Rintel <lkundrak@v3.sk>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> 

Looks good to me now. We could debate which MAC address should
be used when both EEPROM and DT exist. The current version prefers
the EEPROM address, and I think some other drivers do the opposite,
but I don't really know which is best.

	Arnd
