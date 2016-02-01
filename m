From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 04/14] clk: sunxi: add ahb1 clock for A83T
Date: Mon, 1 Feb 2016 22:54:16 +0800
Message-ID: <CAGb2v65zMGEagqML+2Y27M1hbdEWpMj96i0Dr5Ak67jnTcwhyw@mail.gmail.com>
References: <1454203266-4450-1-git-send-email-vishnupatekar0510@gmail.com>
 <1454203266-4450-5-git-send-email-vishnupatekar0510@gmail.com> <20160201144923.GA29286@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160201144923.GA29286@rob-hp-laptop>
Sender: linux-clk-owner@vger.kernel.org
To: Vishnu Patekar <vishnupatekar0510@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Emilio Lopez <emilio@elopez.com.ar>, Jens Kuske <jenskuske@gmail.com>, Hans De Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Reinder de Haan <patchesrdh@mveas.com>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 1, 2016 at 10:49 PM, Rob Herring <robh@kernel.org> wrote:
> On Sun, Jan 31, 2016 at 09:20:56AM +0800, Vishnu Patekar wrote:
>> AHB1 on A83T is similar to ahb1 on A31, except parents are different.
>> clock index 0b1x is PLL6.
>>
>> Signed-off-by: Vishnu Patekar <vishnupatekar0510@gmail.com>
>> ---
>>  Documentation/devicetree/bindings/clock/sunxi.txt |  1 +
>
> Acked-by: Rob Herring <robh@kernel.org>
>
>>  drivers/clk/sunxi/clk-sunxi.c                     | 75 +++++++++++++++++++++++
>>  2 files changed, 76 insertions(+)

Acked-by: Chen-Yu Tsai <wens@csie.org>
