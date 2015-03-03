From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCHv2 05/15] ARM: mvebu: add stdout-path to all armada-*.dts
Date: Tue, 3 Mar 2015 10:45:41 +0100
Message-ID: <20150303104541.345608b4@free-electrons.com>
References: <1424451874-25375-1-git-send-email-thomas.petazzoni@free-electrons.com>
	<1424451874-25375-6-git-send-email-thomas.petazzoni@free-electrons.com>
	<54EB4E9B.6010001@free-electrons.com>
	<CAL_JsqJZJMkH953hq0_sOvEEu9o4pXxs0sdP5=7c2EXXNSyA9A@mail.gmail.com>
	<20150227174851.390d9f58@free-electrons.com>
	<CAL_Jsq+tP6wBcDti7x-B6ar8esE=65Ymg_CKANeOKSe=yYhNnw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+tP6wBcDti7x-B6ar8esE=65Ymg_CKANeOKSe=yYhNnw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Gregory CLEMENT <gregory.clement@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Mike Turquette <mturquette@linaro.org>, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <pawel.moll@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Stephen Boyd <sboyd@codeaurora.org>, Nadav Haklai <nadavh@marvell.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Lior Amsalem <alior@marvell.com>, Rob Herring <robh+dt@kernel.org>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Tawfik Bayouk <tawfik@marvell.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sebastian Hesselbarth <sebastian.hesselbarth>
List-Id: devicetree@vger.kernel.org

Dear Rob Herring,

On Fri, 27 Feb 2015 11:42:43 -0600, Rob Herring wrote:

> > It is worth mentioning that this also happens with
> >
> >      stdout-path = "uart0:115200n8";
> >
> > which was explicitly suggested by Mark in his e-mail. uart0 is an alias
> > to the proper DT node, since stdout-path = &uart0; works almost fine.
> 
> Mark forgot the '&'. So does 'stdout-path = "&uart0:115200n8";' work?

Nah, there is really no '&' needed, Mark was right. What was wrong in
my setup was that uart0 was a *label* for the serial port DT node, and
not an alias. Once I created an alias 'serial0' for '&uart0', things
started working all right.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
