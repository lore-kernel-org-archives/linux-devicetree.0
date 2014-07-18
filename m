From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v10 5/7] arm: add basic support for Mediatek MT6589 boards
Date: Fri, 18 Jul 2014 11:46:51 +0200
Message-ID: <53C8ED0B.5080802@linaro.org>
References: <1404745988-32558-1-git-send-email-matthias.bgg@gmail.com> <1404745988-32558-6-git-send-email-matthias.bgg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1404745988-32558-6-git-send-email-matthias.bgg@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rdunlap@infradead.org, linux@arm.linux.org.uk, tglx@linutronix.de, grant.likely@linaro.org, thierry.reding@gmail.com, florian.vaussard@epfl.ch, jic23@kernel.org, jason@lakedaemon.net, andrew@lunn.ch, silvio.fricke@gmail.com, heiko.stuebner@bq.com, olof@lixom.net, sebastian.hesselbarth@gmail.com, sboyd@codeaurora.org, gregory.clement@free-electrons.com, arnd@arndb.de, robherring2@gmail.com, marc.zyngier@arm.com, maxime.ripard@free-electrons.com, soren.brinkmann@xilinx.com, shawn.guo@freescale.com, anders.berg@lsi.com, linus.walleij@linaro.org, ak@linux.intel.com, hpa@linux.intel.com, akpm@linux-foundation.org, u.kleine-koenig@pengutronix.de, gregkh@linuxfoundation.org, fabf@skynet.be, rostedt@goodmis.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 07/07/2014 05:13 PM, Matthias Brugger wrote:
> This adds a generic devicetree board file and a dtsi for boards
> based on MT6589 SoCs from Mediatek.
>
> Apart from the generic parts (gic, clocks) the only component
> currently supported are the timers.
>
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> --

I will take this patchset through my tree but this patch touches an are=
a=20
I am not handling.

Olof, Arnd, do you mind to ack this patch ?

Thanks !

     -- Daniel


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

