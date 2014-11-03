From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH 06/17] gpio: mvebu: add suspend/resume support
Date: Mon, 3 Nov 2014 22:21:55 +0100
Message-ID: <20141103222155.49bcb7ef@free-electrons.com>
References: <1414151970-6626-1-git-send-email-thomas.petazzoni@free-electrons.com>
	<1414151970-6626-7-git-send-email-thomas.petazzoni@free-electrons.com>
	<5457C119.90809@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <5457C119.90809@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-arm-kernel@lists.infradead.org, Tawfik Bayouk <tawfik@marvell.com>, Nadav Haklai <nadavh@marvell.com>, Lior Amsalem <alior@marvell.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Dear Gregory CLEMENT,

On Mon, 03 Nov 2014 18:53:29 +0100, Gregory CLEMENT wrote:

> I don't know if the suspend is supported on this platform but as we were
> on the road to remove this platform I don't know it it worth testing it unless
> some interested users show up.

The same can be said of the entire mv78xx0 support in gpio-mvebu: it's
completely unused today. Since the migration to mv78xx0 has not been
started, this platform is still using the old style GPIO driver in
plat-orion/gpio.c. And therefore, all the mv78xx0 specific code in
gpio-mvebu.c is purely "tentative" and has never been actually tested
on HW.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
