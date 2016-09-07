From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v2 5/7] clk: sunxi-ng: Add A33 CCU support
Date: Wed, 7 Sep 2016 15:06:14 +0800
Message-ID: <CAGb2v64Sviufr4j20W_GL6N87WSstsfnBqkU-4hovMigbHuhjA@mail.gmail.com>
References: <20160906121837.7517-1-maxime.ripard@free-electrons.com> <20160906121837.7517-6-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160906121837.7517-6-maxime.ripard@free-electrons.com>
Sender: linux-clk-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>, Mylene Josserand <mylene.josserand@free-electrons.com>, linux-clk <linux-clk@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 6, 2016 at 8:18 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> This commit introduces the clocks found in the Allwinner A33 CCU.
>
> Since this SoC is very similar to the A23, and we share a significant share
> of the DTSI, the clock IDs that are going to be used will also be shared
> with the A23, hence the name of the various header files.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>
