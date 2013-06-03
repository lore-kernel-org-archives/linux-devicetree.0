From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC] dw_apb_timer_of: use clocksource_of_init
Date: Mon, 03 Jun 2013 15:20:49 +0200
Message-ID: <2776800.oNsvP2SGCJ@wuerfel>
References: <201306030055.15413.heiko@sntech.de> <1822564.TIKVDZSzqK@wuerfel> <201306031415.29411.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <201306031415.29411.heiko@sntech.de>
Sender: linux-mmc-owner@vger.kernel.org
To: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, John Stultz <john.stultz@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Mike Turquette <mturquette@linaro.org>, Seungwon Jeon <tgih.jun@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>, Chris Ball <cjb@laptop.org>, linux-mmc@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Linus Walleij <linus.walleij@linaro.org>, devicetree-discuss@lists.ozlabs.org, Russell King <linux@arm.linux.org.uk>, Olof Johansson <olof@lixom.net>
List-Id: devicetree@vger.kernel.org

On Monday 03 June 2013 14:15:28 Heiko St=FCbner wrote:
> dw_apb_timer_init used to search the devicetree for matching timer
> devices, making calls to it from board files necessary.
>=20
> Change the dw_apb_timer_init to work with CLOCKSOURCE_OF_DECLARE.
> With this change the function gets called once for each timer node
> and tracks these number of calls to attach clockevent and clocksource
> devices to the nodes.
>=20
> Also convert all previous users of dw_apb_timer_init to use
> clocksource_of_init.
>=20
> Tested on the upcoming rk3066 code.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Acked-by: Arnd Bergmann <arnd@arndb.de>
