From: =?ISO-8859-1?Q?Emilio_L=F3pez?= <emilio@elopez.com.ar>
Subject: Re: [PATCH v5 0/5] mfd: add basic sun6i A31 PRCM support
Date: Thu, 15 May 2014 12:33:11 -0300
Message-ID: <5374DE37.3030700@elopez.com.ar>
References: <1400144113-27659-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1400144113-27659-1-git-send-email-boris.brezillon@free-electrons.com>
Sender: linux-doc-owner@vger.kernel.org
To: Boris BREZILLON <boris.brezillon@free-electrons.com>, Mike Turquette <mturquette@linaro.org>, Lee Jones <lee.jones@linaro.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Philipp Zabel <p.zabel@pengutronix.de>, Shuge <shuge@allwinnertech.com>, kevin@allwinnertech.com, Hans de Goede <hdegoede@redhat.com>, Randy Dunlap <rdunlap@infradead.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dev@linux-sunxi.org
List-Id: devicetree@vger.kernel.org

Hi Boris,

El 15/05/14 05:55, Boris BREZILLON escribi=F3:
> Hello,
>
> This patch series adds support for some functions provided by the PRC=
M
> (Power/Reset/Clock Management) unit:
> - AR100, AHB0 and APB0 clocks
> - APB0 reset controller
(snip)
>    clk: sunxi: add PRCM (Power/Reset/Clock Management) clks support
>    clk: sunxi: document PRCM clock compatible strings

I have taken these two on sunxi-clk-for-mike, and I'll be sending the=20
pull to Mike soon.

Cheers,

Emilio
