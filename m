From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 03/14] clk: sunxi: add bus gates for A83T
Date: Mon, 1 Feb 2016 23:13:10 +0800
Message-ID: <CAGb2v67BcLx8g+MDZnMyrgDpHWmQ-kcxFVqDNpMWzyJ_QoDrQA@mail.gmail.com>
References: <1454203266-4450-1-git-send-email-vishnupatekar0510@gmail.com>
 <1454203266-4450-4-git-send-email-vishnupatekar0510@gmail.com> <20160201150344.GA4947@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20160201150344.GA4947@rob-hp-laptop>
Sender: linux-gpio-owner@vger.kernel.org
To: Vishnu Patekar <vishnupatekar0510@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Emilio Lopez <emilio@elopez.com.ar>, Jens Kuske <jenskuske@gmail.com>, Hans De Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Reinder de Haan <patchesrdh@mveas.com>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 1, 2016 at 11:03 PM, Rob Herring <robh@kernel.org> wrote:
> On Sun, Jan 31, 2016 at 09:20:55AM +0800, Vishnu Patekar wrote:
>> A83T has similar bus gates that of H3, including single gating register has
>> different clock parent.
>>
>> As per H3 and A83T datasheet, usbhost is under AHB2.
>>
>> However,below shows allwinner source code assignment:
>> bits: 26 (ehci0), 27 (ehci1), 29 (ohci0) => AHB1 for A83T.
>> bits: 26 (ehci0), 27 (ehci1) => AHB1 for H3
>> bits  29, 30, 31(ohci0,1,2) => AHB2 for H3.
>>
>> until, this confusion is cleared keep it H3 way.
>>
>> Signed-off-by: Vishnu Patekar <vishnupatekar0510@gmail.com>
>> ---
>>  Documentation/devicetree/bindings/clock/sunxi.txt | 1 +
>>  drivers/clk/sunxi/clk-sun8i-bus-gates.c           | 2 ++
>>  2 files changed, 3 insertions(+)
>
> Acked-by: Rob Herring <robh@kernel.org>

Acked-by: Chen-Yu Tsai <wens@csie.org>

We should really get the clk parents sorted out though.
