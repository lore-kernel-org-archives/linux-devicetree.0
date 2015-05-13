From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 08/11] mtd: brcmnand: add BCM63138 support
Date: Wed, 13 May 2015 22:48:19 +0200
Message-ID: <2173063.OarFjbCqhk@wuerfel>
References: <1431478424-29230-1-git-send-email-computersforpeace@gmail.com> <5685584.0QXUdSHDpG@wuerfel> <20150513202415.GI11598@ld-irv-0074>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150513202415.GI11598@ld-irv-0074>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, Dmitry Torokhov <dtor@google.com>, Anatol Pomazao <anatol@google.com>, Ray Jui <rjui@broadcom.com>, Corneliu Doban <cdoban@broadcom.com>, Jonathan Richardson <jonathar@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Dan Ehrenberg <dehrenberg@chromium.org>, Gregory Fong <gregory.0xf0@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kevin Cernekee <cernekee@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wednesday 13 May 2015 13:24:15 Brian Norris wrote:
> > > 
> > > static int bcm63138_nand_probe(...)
> > > {
> > >     struct bcm63138_nand_soc *priv;
> > > 
> > >     priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > >     ...
> > >     return brcmnand_probe(pdev, &priv->soc);
> > > }
> > 
> > That would make struct brcmnand_soc an empty structure, right?
> 
> No, it still contains the function pointers for our callbacks, which is
> the entire point. I guess it's more of a 'nand_soc_ops' structure than a
> 'nand_soc' pointer now though.
> 

Ah, I see.

This is fine for a small number of function pointers, but if you ever
get a structure like this with a lot of pointers, it's better to
keep them separate, so you can define the structure of function pointers
as 'static const' in the client driver, as we do for a number of
other operations.

The main advantage of that is that you don't have to assign the members
manually at run-time, but also putting them into the read-only segment
makes it harder for an attacker to overwrite a known function pointer
with a pointer to an exploit (assuming they have limited control over
writing to kernel memory).

	Arnd
