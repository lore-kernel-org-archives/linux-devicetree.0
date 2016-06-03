From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] mtd: brcmnand: Add v7.2 controller support
Date: Thu, 2 Jun 2016 20:47:49 -0500
Message-ID: <20160603014749.GA14989@rob-hp-laptop>
References: <1464715383-26053-1-git-send-email-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1464715383-26053-1-git-send-email-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-mtd@lists.infradead.org, thomas.petazzoni@free-electrons.com, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Brian Norris <computersforpeace@gmail.com>, Kamal Dasu <kdasu.kdev@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Simon Arlott <simon@fire.lp0.eu>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:BROADCOM STB NAND FLASH DRIVER" <bcm-kernel-feedback-list@broadcom.com>
List-Id: devicetree@vger.kernel.org

On Tue, May 31, 2016 at 10:23:02AM -0700, Florian Fainelli wrote:
> The 7.2 controller differs in a few area compared to its predecssor (7.1):
> 
> - NAND scrambler, which we are not using just yet
> - higher ECC levels (up to 120 bits) per 1KB data blocks, also not supported yet
> - up to 128B OOB
> 
> This patchs adds the ncessary code to support such a controller

s/patchs/patch/
s/ncessary/necessary/

> generation and updates the Device Tree binding.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
> Changes in v2:
> 
> - fixed a bunch of conditionals on the versions which should
>   have been exclusive (spotted by Thomas)
> 
>  .../devicetree/bindings/mtd/brcm,brcmnand.txt      |  1 +

With those changes,

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/mtd/nand/brcmnand/brcmnand.c               | 91 ++++++++++++++++++----
>  2 files changed, 78 insertions(+), 14 deletions(-)
