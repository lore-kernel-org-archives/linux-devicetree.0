From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 0/2] mtd: atmel_nand: remove compatible
 "atmel,sama5d4-nfc"
Date: Mon, 9 May 2016 15:13:24 -0500
Message-ID: <20160509201324.GA9845@rob-hp-laptop>
References: <1462776680-5284-1-git-send-email-wenyou.yang@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1462776680-5284-1-git-send-email-wenyou.yang@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wenyou Yang <wenyou.yang@atmel.com>
Cc: Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Pawel Moll <pawel.moll@arm.com>, Mark Brown <broonie@kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, Nicolas Ferre <nicolas.ferre@atmel.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Russell King <linux@arm.linux.org.uk>, Josh Wu <rainyfeeling@outlook.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, May 09, 2016 at 02:51:17PM +0800, Wenyou Yang wrote:
> It is a datasheet bug, for current SoCs, the RB_EDGE3(i.e. bit 27)
> of HSMC_SR register does not exist, the RB_EDGE0 (i.e. bit 24) is
> the ready/busy line edge status bit. So the compatible
> "atmel,sama5d4-nfc" is unneeded.

The compatible is needed if the SOC still exists. You can list both for 
the sama5d4 if the block is the same.

Rob
