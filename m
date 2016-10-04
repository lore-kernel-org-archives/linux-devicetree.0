From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 5/9] pinctrl: sunxi: Support generic binding
Date: Tue, 4 Oct 2016 10:29:46 +0800
Message-ID: <CAGb2v66jSJx1X0vvXyCF9TKyKO4MWmNMO1jK=x9W9Bzs=C0vog@mail.gmail.com>
References: <cover.26c6f76b361d146fb079d744251f020ef6d2db7d.1475489558.git-series.maxime.ripard@free-electrons.com>
 <1b45160fb37e2dcabd855d2192fc403a1c4db324.1475489558.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1b45160fb37e2dcabd855d2192fc403a1c4db324.1475489558.git-series.maxime.ripard@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 3, 2016 at 6:21 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> Our bindings are mostly irrelevant now that we have generic pinctrl
> bindings that cover exactly the same uses cases.
>
> Add support for the new ones, and obviously keep our old binding support in
> order to keep the ABI stable.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>
