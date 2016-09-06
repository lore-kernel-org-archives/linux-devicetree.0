From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v2 2/7] clk: sunxi-ng: div: Allow to set a maximum
Date: Wed, 7 Sep 2016 00:20:10 +0800
Message-ID: <CAGb2v66C9GJ5Svm+7NE2cStc5KiNgoriB329K4fhZJMTSbZ8Kw@mail.gmail.com>
References: <20160906121837.7517-1-maxime.ripard@free-electrons.com> <20160906121837.7517-3-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160906121837.7517-3-maxime.ripard@free-electrons.com>
Sender: linux-clk-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>, Mylene Josserand <mylene.josserand@free-electrons.com>, linux-clk <linux-clk@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 6, 2016 at 8:18 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> Some dividers might have a maximum value that is lower than the width of
> the register.
>
> Add a field to _ccu_div to handle those case properly. If the field is set
> to 0, the code will assume that the maximum value is the maximum one that
> can be used with the field register width.

This is a bit confusing. What is the maximum referring to? The raw value
in the register? Or the actual divider?

Personally I'd go with the maximum valid value of the register. You
could get rid of the special power-of-2 handling code you added.

Either way I think the message and the field name should be more explicit.

>
> Otherwise, we'll use whatever value has been set.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

[...]

The code looks correct.


Regards
ChenYu
