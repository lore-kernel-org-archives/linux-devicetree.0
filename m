From: Thomas.Betker@rohde-schwarz.com
Subject: Re: [PATCH 0/3] Using SPI NOR flah on sunxi.
Date: Thu, 30 Apr 2015 18:30:32 +0200
Message-ID: <OF23B05612.4290AF80-ONC1257E37.00589292-C1257E37.005AB106__11501.5413532548$1430412040$gmane$org@rohde-schwarz.com>
References: <cover.1430403750.git.hramrach@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <cover.1430403750.git.hramrach@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Michal Suchanek <hramrach@gmail.com>
Cc: linux-mtd <linux-mtd-bounces@lists.infradead.org>, devicetree@vger.kernel.org, Marek Vasut <marex@denx.de>, "grmoore@altera.com" <grmoore@altera.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, David Woodhouse <dwmw2@infradead.org>, Rafa?? Mi??ecki <zajec5@gmail.com>, linux-kernel@vger.kernel.org, Huang Shijie <b32955@freescale.com>, linux-sunxi@googlegroups.com, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Brian Norris <computersforpeace@gmail.com>, Ben Hutchings <ben@decadent.org.uk>, Alison Chaiken <alison_chaiken@mentor.com>, "Bean Huo ????????? (beanhuo)" <beanhuo@micron.com>
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

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
