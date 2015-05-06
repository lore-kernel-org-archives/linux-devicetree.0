From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH  0/2] gpio: Allow userspace export from DT
Date: Wed, 6 May 2015 12:24:50 +0100
Message-ID: <20150506112449.GQ2067@n2100.arm.linux.org.uk>
References: <20150413110515.9681.58848.stgit@localhost>
 <20150504084925.GB4047@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150504084925.GB4047@localhost>
Sender: linux-gpio-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Martin Fuzzey <mfuzzey@parkeon.com>, devicetree@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, May 04, 2015 at 10:49:25AM +0200, Johan Hovold wrote:
> Firmware should describe pin directionality and function, and undefined
> pins should never be allowed to be accessed from userspace.

No, that's totally wrong if you consider one of the most common use
cases out there...

Think about something like a Raspberry Pi, where you have a header with
GPIOs on it, which can be used for multiple different purposes (and are
even multiplexed with some on-SoC functions.)

"Firmware" can't know about all possible configurations of those IO pins.

That's why Raspberry Pi uses a userspace helper and programs stuff up
appropriately for the users application.

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
