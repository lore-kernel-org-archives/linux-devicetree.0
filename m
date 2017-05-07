From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [PATCH v2 3/3] gpiolib: Add GPIO initialization
Date: Sun, 7 May 2017 11:22:01 +0100
Message-ID: <20170507102201.GL22219@n2100.armlinux.org.uk>
References: <1440920686-6892-1-git-send-email-mpa@pengutronix.de>
 <1440920686-6892-4-git-send-email-mpa@pengutronix.de>
 <20170207110950.zy5pzo2hq6hrvmr5@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170207110950.zy5pzo2hq6hrvmr5@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, chrisrfq@gmail.com, Arun Bharadwaj <arun@gumstix.com>, devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Johan Hovold <johan@kernel.org>, linux-gpio@vger.kernel.org, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 07, 2017 at 12:09:50PM +0100, Uwe Kleine-K=F6nig wrote:
> Now additionally I want to initialize some gpios but allow them to be
> grabbed later. IMHO there are the following new cases:
> =

> It should be possible to:
> =

>  a) change the value of a gpio initially configured as output
>  b) change the direction of a gpio initially configured as output
>  c) change the direction of a gpio initially configured as input
> =

> IMHO the dts should describe which case should be applied to a given
> gpio.

Isn't it the job of the board firmware to ensure that the hardware is
setup to a reasonably sane state for the board?

You give an example of holding GPIOs low in Linux for "ESD reasons"
later in this thread, but if you're only doing that in Linux, what if
Linux isn't running yet, and the GPIO has been left floating by the
board firmware?  Fixing this in Linux is really too late.

Floating GPIOs are also a source of higher current drain - a GPIO
sitting mid-rail turns both transistors on for a MOS input, which gives
a direct path across the power supply.  The quicker that the GPIOs can
be initialised, the less wasted power there is.  So, that's another
argument for board firmware doing the basic GPIO initialisation and not
stuffing this into DT and having the kernel do it.

We could then talk about floating GPIOs that activate higher power
devices, and the arguments for doing GPIO initialisation as early as
possible in board firmware continue to stack up.

IMHO, initial configuration of GPIOs is the job of board firmware, not
the kernel.  I see no sane reason to push that into the kernel.

-- =

RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
