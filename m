From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 0/4] MIPS: ath79: Add USB support on the TL-WR1043ND
Date: Mon, 07 Sep 2015 15:20:42 +0200
Message-ID: <3589971.cbF7muh57v@wuerfel>
References: <1441120994-31476-1-git-send-email-albeu@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1441120994-31476-1-git-send-email-albeu@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Alban Bedel <albeu@free.fr>
Cc: linux-mips@linux-mips.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Ralf Baechle <ralf@linux-mips.org>, Kishon Vijay Abraham I <kishon@ti.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tuesday 01 September 2015 17:23:10 Alban Bedel wrote:
> 
> this serie add a driver for the USB phy on the ATH79 SoCs and enable the
> USB port on the TL-WR1043ND. The phy controller is really trivial as it
> only use reset lines.
> 

Is this a common thing to have? If other PHY devices are like this, we
could instead add a simple generic PHY driver that just asserts all
its reset lines in the order as provided, rather than making this a
hardware specific driver that ends up getting copied several times.

	Arnd
