From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v2 3/4] mtd: nand: add NAND driver for Broadcom STB NAND
 controller
Date: Thu, 19 Mar 2015 09:36:57 -0700
Message-ID: <550AFB29.9040403@gmail.com>
References: <1426733358-15596-1-git-send-email-computersforpeace@gmail.com> <1426733358-15596-4-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1426733358-15596-4-git-send-email-computersforpeace@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: Dmitry Torokhov <dtor@google.com>, Anatol Pomazao <anatol@google.com>, Ray Jui <rjui@broadcom.com>, Corneliu Doban <cdoban@broadcom.com>, Jonathan Richardson <jonathar@broadcom.com>, Scott Branden <sbranden@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Dan Ehrenberg <dehrenberg@chromium.org>, Gregory Fong <gregory.0xf0@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kevin Cernekee <cernekee@gmail.com>
List-Id: devicetree@vger.kernel.org

On 18/03/15 19:49, Brian Norris wrote:
> This core originated in Set-Top Box chips (BCM7xxx) but is used in a
> variety of other Broadcom chips, including some BCM63xxx, BCM33xx, and
> iProc/Cygnus. It's been used only on ARM and MIPS SoCs, so restrict it
> to those architectures.
> 
> There are multiple revisions of this core throughout the years, and
> almost every version broke register compatibility in some small way, but
> with some effort, this driver is able to support v4.0, v5.0, v6.x, v7.0,
> and v7.1. It's been tested on v5.0, v6.0, v7.0, and v7.1 recently, so
> there hopefully are no more lurking inconsistencies.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
