From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 02/14] clk: sunxi: Add apb0 gates for A83T
Date: Mon, 1 Feb 2016 23:11:23 +0800
Message-ID: <CAGb2v64VjfDVDMSO_ov0mJfXTbgB7ffehGu4N8tCTs8Kt00fRg@mail.gmail.com>
References: <1454203266-4450-1-git-send-email-vishnupatekar0510@gmail.com>
 <1454203266-4450-3-git-send-email-vishnupatekar0510@gmail.com> <20160201150218.GA4290@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160201150218.GA4290@rob-hp-laptop>
Sender: linux-clk-owner@vger.kernel.org
To: Vishnu Patekar <vishnupatekar0510@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Emilio Lopez <emilio@elopez.com.ar>, Jens Kuske <jenskuske@gmail.com>, Hans De Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Reinder de Haan <patchesrdh@mveas.com>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 1, 2016 at 11:02 PM, Rob Herring <robh@kernel.org> wrote:
> On Sun, Jan 31, 2016 at 09:20:54AM +0800, Vishnu Patekar wrote:
>> APB0 is part of PRCM, and is compatible with earlier SOCs.
>> apb0 gates controls R_PIO, R_UART, R_RSB, etc clocks.
>> This patch adds support for APB0 gates for A83T.
>>
>> Signed-off-by: Vishnu Patekar <vishnupatekar0510@gmail.com>
>> ---
>>  Documentation/devicetree/bindings/clock/sunxi.txt | 1 +
>>  drivers/clk/sunxi/clk-simple-gates.c              | 2 ++
>>  2 files changed, 3 insertions(+)
>
> Acked-by: Rob Herring <robh@kernel.org>

Acked-by: Chen-Yu Tsai <wens@csie.org>
