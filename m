From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 3/4] arm: add basic support for Mediatek MT6589 boards
Date: Thu, 10 Apr 2014 11:36:53 +0200
Message-ID: <8724412.Xp2CkgARik@wuerfel>
References: <1397072736-10793-1-git-send-email-matthias.bgg@gmail.com> <CABuKBeKnEw38sQYwrkheoWetZZcPTJhKRsBK4a62FS6-6dRFTA@mail.gmail.com> <53465A4B.4040906@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <53465A4B.4040906@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Gregory CLEMENT <gregory.clement@free-electrons.com>, Matthias Brugger <matthias.bgg@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko.stuebner@bq.com>, Russell King <linux@arm.linux.org.uk>, Daniel Lezcano <daniel.lezcano@linaro.org>, Florian Vaussard <florian.vaussard@epfl.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Randy Dunlap <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Silvio F <silvio.frick>
List-Id: devicetree@vger.kernel.org

On Thursday 10 April 2014 08:46:03 Gregory CLEMENT wrote:
> >>
> >> Is it really a fixed clock without any parent, or do you
> >> declare it as a fixed clock because you don't have any clock
> >> common framework support yet?
> > 
> > I don't have any common clock framework support yet.
> 
> So maybe you should provide one (even a very simple one).
> 
> Pretending a clock is a fixed clock and ignoring its parents
> will be problematic when you will add the common clock framework
> support because the device tree is supposed to be stable and you won't
> be able to change it then.

But is this actually a problem here? The current device tree file
will keep working even if the proper driver is there, you just need
to update both the driver and the dts file in order to actually
use the clocks at run-time.

I guess it comes down to the question of whether we want to handle
old kernels with new device trees again, which would be broken here.

	Arnd
