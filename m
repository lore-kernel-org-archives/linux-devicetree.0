From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v3 3/8] clk: sunxi-ng: div: Allow to set a maximum
Date: Thu, 8 Sep 2016 18:26:34 +0800
Message-ID: <CAGb2v64Fmzi57xgLn2hx9g_K+PgtNnWHTN+3iLOT9g1MsBz1fg@mail.gmail.com>
References: <20160908094843.14710-1-maxime.ripard@free-electrons.com> <20160908094843.14710-4-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160908094843.14710-4-maxime.ripard@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>, Mylene Josserand <mylene.josserand@free-electrons.com>, linux-clk <linux-clk@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 8, 2016 at 5:48 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> Some dividers might have a maximum value that is lower than the width of
> the register.
>
> Add a field to _ccu_div to handle those case properly. If the field is set
> to 0, the code will assume that the maximum value is the maximum one that
> can be used with the field register width.
>
> Otherwise, we'll use whatever value has been set.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>
