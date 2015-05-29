From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH 1/2] pinctrl: mvebu: Fix mapping of pin 63 (gpo -> gpio)
Date: Fri, 29 May 2015 12:06:29 +0200
Message-ID: <20150529120629.1cb0d8ae@free-electrons.com>
References: <1428784160-19431-1-git-send-email-andrew@ncrmnt.org>
	<1428784160-19431-2-git-send-email-andrew@ncrmnt.org>
	<20150529111002.7368ca50@free-electrons.com>
	<1e014a41f99caee6f054713546efdf20@mail.ncrmnt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1e014a41f99caee6f054713546efdf20@mail.ncrmnt.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Andrew <andrew@ncrmnt.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Wolfram Sang <wsa@the-dreams.de>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Andrew,

On Fri, 29 May 2015 12:55:44 +0300, Andrew wrote:

> Yep, exactly. I've seen that in the public docs. It must be a typo,
> unless there's something we don't know.
> 
> On DNS-327L this pin is wired as a button. Without th patch only
> gpio-buttons driver fails probing, but you can still configure the pin
> as input via sysfs gpio interface and even read sensible values from it.
> If you have a board where this pin is broken out - it's easy to test.

Ok, I've made a request for Marvell to check this aspect. If there's a
mistake, they should hopefully fix the datasheet at some point.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
