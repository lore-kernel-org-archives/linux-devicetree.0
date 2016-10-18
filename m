From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v2 8/9] ARM: sunxi: Remove useless allwinner,pull property
Date: Tue, 18 Oct 2016 15:39:03 +0800
Message-ID: <CAGb2v64E64vXEmfFymVONXbecMWzLD2VTSfDa-AOh5i1uPOLOg@mail.gmail.com>
References: <cover.7edc6c25be8a5e2efdda6a82e102dbf7ece6aa64.1476200742.git-series.maxime.ripard@free-electrons.com>
 <b643d1e525835365a6ae63bcd065cb3650a839d6.1476200742.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <b643d1e525835365a6ae63bcd065cb3650a839d6.1476200742.git-series.maxime.ripard@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 11, 2016 at 11:46 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> The allwinner,pull property set to NO_PULL was really considered our
> default (and wasn't even changing the default value in the code).
>
> Remove these properties to make it obvious that we do not set anything in
> such a case.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>
