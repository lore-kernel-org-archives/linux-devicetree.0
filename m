From: Vishnu Patekar <vishnupatekar0510@gmail.com>
Subject: Re: [PATCH v4 01/13] pinctrl: sunxi: Add A83T R_PIO controller
Date: Thu, 17 Mar 2016 23:34:18 +0800
Message-ID: <CAEzqOZugVOGarjy9NjDOhwJeU6P26Ch2aX13Tec2N0z2Gb9g7A@mail.gmail.com>
References: <1458144276-31108-1-git-send-email-vishnupatekar0510@gmail.com>
 <1458144276-31108-2-git-send-email-vishnupatekar0510@gmail.com> <CACRpkdaFekCnRKoYQ=Fq1LT0FcH7RobwkLi_G1YfXJAb=4RTHQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <CACRpkdaFekCnRKoYQ=Fq1LT0FcH7RobwkLi_G1YfXJAb=4RTHQ@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Jon Corbet <corbet@lwn.net>, =?UTF-8?Q?Pawe=C5=82_Moll?= <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Emilio Lopez <emilio@elopez.com.ar>, Jens Kuske <jenskuske@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>R
List-Id: devicetree@vger.kernel.org

Hello Linus,

On Thu, Mar 17, 2016 at 10:51 PM, Linus Walleij
<linus.walleij@linaro.org> wrote:
> On Wed, Mar 16, 2016 at 5:04 PM, Vishnu Patekar
> <vishnupatekar0510@gmail.com> wrote:
>
>> The A83T has R_PIO pin controller, it's same as A23, execpt A83T
>> interrupt bit is 6th and A83T has one extra pin PL12.
>>
>> Signed-off-by: Vishnu Patekar <vishnupatekar0510@gmail.com>
>> Acked-by: Chen-Yu Tsai <wens@csie.org>
>> Acked-by: Rob Herring <robh@kernel.org>
>
> I think I already merged this?
AFAIK, this one is not yet merged. At least, you did not say it's merged. :)
>
> Yours,
> Linus Walleij
