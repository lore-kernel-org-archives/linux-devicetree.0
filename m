From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 0/2] ARM: mvebu: Add DLINK-DNS327L support
Date: Sat, 11 Apr 2015 23:28:23 +0200
Message-ID: <20150411212823.GI5244@lunn.ch>
References: <1428784160-19431-1-git-send-email-andrew@ncrmnt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1428784160-19431-1-git-send-email-andrew@ncrmnt.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Andrianov <andrew@ncrmnt.org>, Gregory Clement <gregory.clement@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Wolfram Sang <wsa@the-dreams.de>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

> When power button is pressed to turn the NAS off, weltrend signals 
> the SoC by driving mpp63 line low. Apparently right now pinctrl assumes
> that this line can only work as 'gpo' that screws up gpio-buttons driver.
> Since without gpio-buttons, mpp63 works as input properly via sysfs 
> interface, I've added a patch for pinctrl-armada-370.c that fixes the 
> issue.

Hi Andrew

This is odd. I just checked the Marvell datasheets, and they list this
pin a GPO.

We probably want Thomas or Gregory to check this with Marvell.

   Andrew
