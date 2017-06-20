From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/2] DT: pinctrl: Add binding documentation for
 Spreadtrum pin controller
Date: Tue, 20 Jun 2017 11:10:41 +0200
Message-ID: <CACRpkdZMdKPwMt0hQ+5k731pJEnsgyzqYULbD=S7iXbOyai7CQ@mail.gmail.com>
References: <359d62c1f2f7ef61c6160df9b60c1af4bfcea89a.1496664241.git.baolin.wang@spreadtrum.com>
 <CACRpkdbtuPKr=tWGoJC-sg2Oj47rYMpo6fs_Us=Nynew1Wkz=w@mail.gmail.com> <20170612060718.GA8566@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170612060718.GA8566@spreadtrum.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Baolin Wang <baolin.wang@linaro.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 12, 2017 at 8:07 AM, Baolin Wang <baolin.wang@spreadtrum.com> wrote:

> I agree we should add these into core code, something like:
> static const struct pinconf_generic_params dt_params[] = {
(...)
>         { "slew-rate", PIN_CONFIG_SLEW_RATE, 0 },
> +       { "sleep-bias-pull-up", PIN_CONFIG_SLEEP_BIAS_PULL_UP, 1},
> +       { "sleep-bias-pull-down", PIN_CONFIG_SLEEP_BIAS_PULL_DOWN 1},
>         ......
> };
>
> If you agree that, I can help to add these configuration.

Actually, yes indeed, that is a nice thing. Very nice. I think my Nomadik
driver could use this too.

Just need to hear what the DT maintainers have to say about it.

Yours,
Linus Walleij
