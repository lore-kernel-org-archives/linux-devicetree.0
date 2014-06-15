From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v8 2/7] clocksource: Add support for the Mediatek SoCs
Date: Sun, 15 Jun 2014 23:34:37 +0200
Message-ID: <539E116D.6030002@linaro.org>
References: <1402490055-15197-1-git-send-email-matthias.bgg@gmail.com> <1402490055-15197-3-git-send-email-matthias.bgg@gmail.com> <alpine.DEB.2.10.1406112012460.5170@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.10.1406112012460.5170@nanos>
Sender: linux-doc-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rdunlap@infradead.org, linux@arm.linux.org.uk, grant.likely@linaro.org, thierry.reding@gmail.com, florian.vaussard@epfl.ch, jic23@kernel.org, jason@lakedaemon.net, andrew@lunn.ch, silvio.fricke@gmail.com, heiko.stuebner@bq.com, olof@lixom.net, sebastian.hesselbarth@gmail.com, sboyd@codeaurora.org, gregory.clement@free-electrons.com, arnd@arndb.de, robherring2@gmail.com, marc.zyngier@arm.com, maxime.ripard@free-electrons.com, soren.brinkmann@xilinx.com, shawn.guo@freescale.com, anders.berg@lsi.com, linus.walleij@linaro.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 06/11/2014 08:14 PM, Thomas Gleixner wrote:
> On Wed, 11 Jun 2014, Matthias Brugger wrote:
>> +static void mtk_clkevt_mode(enum clock_event_mode mode,
>> +				struct clock_event_device *clk)
>> +{
>> +	struct mtk_clock_event_device *evt =3D to_mtk_clk(clk);
>> +
>> +	mtk_clkevt_time_stop(evt, GPT_CLK_EVT);
>> +
>> +	switch (mode) {
>> +	case CLOCK_EVT_MODE_PERIODIC:
>> +		mtk_clkevt_time_setup(evt, evt->ticks_per_jiffy, GPT_CLK_EVT);
>> +		mtk_clkevt_time_start(evt, true, GPT_CLK_EVT);
>> +		break;
>> +	case CLOCK_EVT_MODE_ONESHOT:
>> +		mtk_clkevt_time_start(evt, false, GPT_CLK_EVT);
>
> Why start the timer here? The code will call set next event right awa=
y.
>
>> +		break;
>> +	case CLOCK_EVT_MODE_UNUSED:
>> +	case CLOCK_EVT_MODE_SHUTDOWN:
>> +	default:
>> +		/* No more interrupts will occur as source is disabled */
>> +		break;
>> +	}
>> +}
>
> Looks good otherwise.

Hi Thomas,

Can I consider the 8.1 patch (the one taking into account your comment)=
=20
as acked-by ?

Thanks

   -- Daniel


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

