From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: qcom: Make muxing of gpio function explicit
Date: Tue, 22 Jul 2014 16:33:07 +0200
Message-ID: <CACRpkdZr6sWNW3Jb2zSmjyLP0h-0b32966f_NQiAE_s17DKFxQ@mail.gmail.com>
References: <1405128084-15731-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1405128084-15731-1-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sat, Jul 12, 2014 at 3:21 AM, Bjorn Andersson
<bjorn.andersson@sonymobile.com> wrote:

> Instead of relying on pinmux->disable(), make the gpio function an
> explicit function for all pins that supports it.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>

Thanks, patch applied!

> This fixes the regression that was introduced by removing the disable function
> from the pinmux ops. I was exploiting the disable function to put the gpio pins
> "back" into gpio state and this was apparently not the right way to do things.

This is so much cleaner I think.

Please proceed to patch your DTS files for this as needed.

Yours,
Linus Walleij
