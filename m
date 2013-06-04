From: Jamie Iles <jamie@jamieiles.com>
Subject: Re: [PATCH v2 2/4] clocksource: dw_apb_timer_of: add clock-handling
Date: Tue, 4 Jun 2013 15:15:26 +0100
Message-ID: <20130604141526.GB5308@maple>
References: <201306041136.09566.heiko@sntech.de>
 <201306041137.37036.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201306041137.37036.heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: John Stultz <john.stultz@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Jamie Iles <jamie@jamieiles.com>, Dinh Nguyen <dinguyen@altera.com>, Grant Likely <grant.likely@linaro.org>, linux-arm-kernel@lists.infradead.org, Rob Herring <rob.herring@calxeda.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>, Baruch Siach <baruch@tkos.co.il>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 04, 2013 at 11:37:36AM +0200, Heiko St=FCbner wrote:
> Add the possibility to get the clock-frequency from a timer clock ins=
tead
> of specifying it as dt property. Additionally also add the possibilit=
y
> to also define a controlling periphal clock for the timer block.
>=20
> The clock-frequency property is kept to act as fallback if no clocks
> are specified.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Acked-by: Jamie Iles <jamie@jamieiles.com>
