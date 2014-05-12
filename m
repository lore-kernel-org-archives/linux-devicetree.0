From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 3/4] arm: add basic support for Mediatek MT6589 boards
Date: Mon, 12 May 2014 11:30:15 +0200
Message-ID: <80525303.7Oax6ZBozr@wuerfel>
References: <1399772463-859-1-git-send-email-matthias.bgg@gmail.com> <1399772463-859-4-git-send-email-matthias.bgg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1399772463-859-4-git-send-email-matthias.bgg@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rdunlap@infradead.org, linux@arm.linux.org.uk, daniel.lezcano@linaro.org, tglx@linutronix.de, thierry.reding@gmail.com, florian.vaussard@epfl.ch, jic23@kernel.org, jason@lakedaemon.net, andrew@lunn.ch, silvio.fricke@gmail.com, heiko.stuebner@bq.com, olof@lixom.net, sebastian.hesselbarth@gmail.com, sboyd@codeaurora.org, gregory.clement@free-electrons.com, robherring2@gmail.com, marc.zyngier@arm.com, maxime.ripard@free-electrons.com, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sunday 11 May 2014 03:41:02 Matthias Brugger wrote:
> +
> +static void __init mediatek_dt_init(void)
> +{
> +       of_platform_populate(NULL, of_default_bus_match_table, NULL, NULL);
> +}
> +
> +static const char * const mediatek_board_dt_compat[] = {
> +       "mediatek,mt6589",
> +       NULL,
> +};
> +
> +DT_MACHINE_START(MEDIATEK_DT, "Mediatek Cortex-A7 (Device Tree)")
> +       .init_machine   = mediatek_dt_init,
> +       .dt_compat      = mediatek_board_dt_compat,
> +MACHINE_END

Since the mediatek_dt_init function now only does the default populate
call, you can leave it out completely and keep only the compat list.

	Arnd
