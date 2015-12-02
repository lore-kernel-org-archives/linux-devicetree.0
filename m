From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 3/7] clk: Amlogic: Add reset controller for CPU cores for Meson8b
Date: Wed, 02 Dec 2015 20:39:16 +0100
Message-ID: <1589870.aoo3TedUT8@wuerfel>
References: <1449076953-5058-1-git-send-email-carlo@caione.org> <1449076953-5058-4-git-send-email-carlo@caione.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1449076953-5058-4-git-send-email-carlo@caione.org>
Sender: linux-clk-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Carlo Caione <carlo@caione.org>, robh+dt@kernel.org, devicetree@vger.kernel.org, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux@arm.linux.org.uk, linux-meson@googlegroups.com, drake@endlessm.com, jerry.cao@amlogic.com, victor.wan@amlogic.com, pawel.moll@arm.com, Carlo Caione <carlo@endlessm.com>
List-Id: devicetree@vger.kernel.org

On Wednesday 02 December 2015 18:22:29 Carlo Caione wrote:
>  
> +#define RST_CORE0              0
> +#define RST_CORE1              1
> +#define RST_CORE2              2
> +#define RST_CORE3              3

These defines are rather silly and just cause interdependencies with the header
file. Just drop them and use the numbers directly.

	Arnd
