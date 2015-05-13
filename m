From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 00/11] mtd: nand: add Broadcom NAND controller support
Date: Wed, 13 May 2015 12:39:49 +0200
Message-ID: <11076117.x0XPW2jeEk@wuerfel>
References: <1431478424-29230-1-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431478424-29230-1-git-send-email-computersforpeace@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, Dmitry Torokhov <dtor@google.com>, Anatol Pomazao <anatol@google.com>, Ray Jui <rjui@broadcom.com>, Corneliu Doban <cdoban@broadcom.com>, Jonathan Richardson <jonathar@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Dan Ehrenberg <dehrenberg@chromium.org>, Gregory Fong <gregory.0xf0@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kevin Cernekee <cernekee@gmail.com>
List-Id: devicetree@vger.kernel.org

On Tuesday 12 May 2015 17:53:33 Brian Norris wrote:
> 
> This is the fourth (and final?) version of support for the Broadcom BCM7xxx
> Set-Top Box NAND controller. This controller has been used in a variety of
> Broadcom SoCs.
> 
> Tested to work on Cygnus, BCM7445, and BCM63138.
> 

Looks very nice overall. I have one remaining comment about the way
that the base driver interacts with the subdrivers, I'll reply to
one of the patches directly.

	Arnd
