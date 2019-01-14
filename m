From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] arm64/hisilicon: fix SDcard detection
Date: Mon, 14 Jan 2019 09:28:21 +0100
Message-ID: <CACRpkdY7c16C+NpoSXUV1QsLkQgNm3vjknOSea0p4aj-LM1xBg@mail.gmail.com>
References: <1547454274-1674-1-git-send-email-vincent.guittot@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1547454274-1674-1-git-send-email-vincent.guittot@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Xu Wei <xuwei5@hisilicon.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 14, 2019 at 9:24 AM Vincent Guittot
<vincent.guittot@linaro.org> wrote:

> The SDcard detection of hikey960 is active low so cd-inverted is wrong.
> Instead of adding cd-inverted, we should better set correctly cd-gpios
> to use GPIO_ACTIVE_LOW.
>
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
