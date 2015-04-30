From: Thomas.Betker@rohde-schwarz.com
Subject: Re: [PATCH 0/3] Using SPI NOR flah on sunxi.
Date: Thu, 30 Apr 2015 18:30:32 +0200
Message-ID: <OF23B05612.4290AF80-ONC1257E37.00589292-C1257E37.005AB106__25095.4002993696$1430412380$gmane$org@rohde-schwarz.com>
References: <cover.1430403750.git.hramrach@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1430403750.git.hramrach@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Suchanek <hramrach@gmail.com>
Cc: Alison Chaiken <alison_chaiken@mentor.com>, Huang Shijie <b32955@freescale.com>, "Bean Huo ????????? (beanhuo)" <beanhuo@micron.com>, Ben Hutchings <ben@decadent.org.uk>, Brian Norris <computersforpeace@gmail.com>, devicetree@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, Kumar Gala <galak@codeaurora.org>, "grmoore@altera.com" <grmoore@altera.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, linux-mtd <linux-mtd-bounces@lists.infradead.org>, linux-sunxi@googlegroups.com, Marek Vasut <marex@denx.de>, Mark Rutland <mark.rutland@arm.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Rafa?? Mi??ecki <zajec5@gmail.com>
List-Id: devicetree@vger.kernel.org

Hello Michal:

> I tried to connect a SPI NOR flash to my sunxi board and due to the 
current
> sunxi SPI driver limitations it does not work.
> 
> The SPI driver returns an error when more than 64 bytes are 
> transferred at once
> due to lack of DMA support.

Wouldn't it be easier to fix the SPI driver to handle transfers larger 
than 64 bytes, filling and draining the FIFO multiple times if neccessary? 
(As far as I can tell, most SPI drivers do this.)

Just asking,
Thomas
