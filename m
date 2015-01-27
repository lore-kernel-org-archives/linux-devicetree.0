From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/2] dt: watchdog: Add DT binding documentation for jz47xx watchdog timer
Date: Tue, 27 Jan 2015 22:29:49 +0100
Message-ID: <16185448.sH4QMJhjYS@wuerfel>
References: <1422371490-44402-1-git-send-email-Zubair.Kakakhel@imgtec.com> <11680810.808F8uDyN0@wuerfel> <20150127205229.GA6983@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150127205229.GA6983@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, wim@iguana.be, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, paul@crapouillou.net
List-Id: devicetree@vger.kernel.org

On Tuesday 27 January 2015 12:52:29 Guenter Roeck wrote:
> Driver does this (today):
> 
>          drvdata->rtc_clk = clk_get(&pdev->dev, "rtc");
> 
> Isn't that the name to use ? Just wondering.

Just because the driver uses it at the moment does not mean it's the name
that the IP block uses.

clk_get() has the unpleasant property of doing fuzzy matching
on the name that is passed. It first tries to use the string
as the name of the clock input of the device, but if that is
not there, it falls back to looking for a global clk with a con_id.

In DT, we only support the first kind, but if a driver currently
uses the second, you get the wrong name.

Looking at arch/mips/jz4740/clock.c now, this seems to be exactly
what is going on here: there is no clkdev_add call to associate
the device clocks, so it can only match a global clock entry. :(

	Arnd
