From: Jamie Iles <jamie@jamieiles.com>
Subject: Re: [PATCH v2 1/4] clocksource: dw_apb_timer_of: enable the use the
 clocksource as sched clock
Date: Tue, 4 Jun 2013 15:13:42 +0100
Message-ID: <20130604141342.GA5308@maple>
References: <201306041136.09566.heiko@sntech.de>
 <201306041137.03319.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201306041137.03319.heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: John Stultz <john.stultz@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Jamie Iles <jamie@jamieiles.com>, Dinh Nguyen <dinguyen@altera.com>, Grant Likely <grant.likely@linaro.org>, linux-arm-kernel@lists.infradead.org, Rob Herring <rob.herring@calxeda.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>, Baruch Siach <baruch@tkos.co.il>
List-Id: devicetree@vger.kernel.org

Looks goot to me, Heiko!

On Tue, Jun 04, 2013 at 11:37:02AM +0200, Heiko St=FCbner wrote:
> Currently the dw_apb_timer always expects a separate special timer to=
 be
> availbable for the sched_clock. Some devices using dw_apb_timers do n=
ot
> have this sptimer but can use the clocksource as sched_clock instead.
>=20
> Therefore enable the driver to distiguish between devices with and wi=
thout
> sptimer based on the devicetree data and select the correct timer as
> sched_clock.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Acked-by: Jamie Iles <jamie@jamieiles.com>
