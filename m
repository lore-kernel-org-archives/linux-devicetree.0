From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH] mtd: brcmnand: Add v7.2 controller support
Date: Sat, 28 May 2016 20:01:15 +0200
Message-ID: <20160528200115.1cdb1d29@free-electrons.com>
References: <1464386293-18862-1-git-send-email-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464386293-18862-1-git-send-email-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-mtd@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Richard Weinberger <richard@nod.at>, Kamal Dasu <kdasu.kdev@gmail.com>, open list <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "open list:BROADCOM STB NAND FLASH DRIVER" <bcm-kernel-feedback-list@broadcom.com>, Kumar Gala <galak@codeaurora.org>, Simon Arlott <simon@fire.lp0.eu>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

Hello,

On Fri, 27 May 2016 14:58:11 -0700, Florian Fainelli wrote:

> +	if (ctrl->nand_version >= 0x0702)
> +		bits = 7;
>  	if (ctrl->nand_version >= 0x0600)

Don't you want an "else if" here ?

Otherwise, even for the 7.2 version of your controller bits will be set
to 1.

Ditto when setting ctrl->max_oob.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
