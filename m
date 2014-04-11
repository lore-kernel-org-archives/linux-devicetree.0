From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/4] clocksource: Add support for the Mediatek SoCs
Date: Fri, 11 Apr 2014 11:21:59 +0200
Message-ID: <129772722.mXH1xx9vCv@wuerfel>
References: <1397072736-10793-1-git-send-email-matthias.bgg@gmail.com> <CAOesGMg2zvPPeyqTvztiNKVJzWP5PsNs2pkXKMaS+CfXHgO0rQ@mail.gmail.com> <CABuKBeKr77qJwusoTgjR2yOspWbi6Exvt5i8WPc5tjd7fez-YA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CABuKBeKr77qJwusoTgjR2yOspWbi6Exvt5i8WPc5tjd7fez-YA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Olof Johansson <olof@lixom.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Thierry Reding <thierry.reding@gmail.com>, Florian Vaussard <florian.vaussard@epfl.ch>, Jonathan Cameron <jic23@kernel.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Silvio F <silvio.fricke@gmail.com>, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko.stuebner@bq.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-doc@vger.kernel
List-Id: devicetree@vger.kernel.org

On Friday 11 April 2014 11:07:35 Matthias Brugger wrote:
> >
> > Of course, you'll still need these for the A9-based platforms, so the
> > driver might very well be needed anyway. Some of the earlier patches
> > seem to be for A7-based systems so I'm not sure what you're primarily
> > working on here. 
> 
> I'm working on a Cortex-A7 based platform. But ARM_ARCH_TIMER seems to
> get no clocking.
> Initializing the timer fails with:
> Architected timer frequency not available
> 
> That's why I use the SoC timer.

Are you sure you're not just missing a "clock-frequency" property
in your DT node for the timer?

	Arnd
