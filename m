From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: [PATCH v2 1/2] DT: pinctrl: Add binding documentation for
 Spreadtrum pin controller
Date: Wed, 21 Jun 2017 10:35:56 +0800
Message-ID: <CAMz4kuLCqNEpmf31FjHg+UzP1GrLLtHkgUh9+pwNU6kNEWuj6A@mail.gmail.com>
References: <359d62c1f2f7ef61c6160df9b60c1af4bfcea89a.1496664241.git.baolin.wang@spreadtrum.com>
 <CACRpkdbtuPKr=tWGoJC-sg2Oj47rYMpo6fs_Us=Nynew1Wkz=w@mail.gmail.com>
 <20170612060718.GA8566@spreadtrum.com> <CACRpkdZMdKPwMt0hQ+5k731pJEnsgyzqYULbD=S7iXbOyai7CQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZMdKPwMt0hQ+5k731pJEnsgyzqYULbD=S7iXbOyai7CQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>
List-Id: devicetree@vger.kernel.org

On 20 June 2017 at 17:10, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Mon, Jun 12, 2017 at 8:07 AM, Baolin Wang <baolin.wang@spreadtrum.com> wrote:
>
>> I agree we should add these into core code, something like:
>> static const struct pinconf_generic_params dt_params[] = {
> (...)
>>         { "slew-rate", PIN_CONFIG_SLEW_RATE, 0 },
>> +       { "sleep-bias-pull-up", PIN_CONFIG_SLEEP_BIAS_PULL_UP, 1},
>> +       { "sleep-bias-pull-down", PIN_CONFIG_SLEEP_BIAS_PULL_DOWN 1},
>>         ......
>> };
>>
>> If you agree that, I can help to add these configuration.
>
> Actually, yes indeed, that is a nice thing. Very nice. I think my Nomadik
> driver could use this too.
>
> Just need to hear what the DT maintainers have to say about it.

OK, I will submit one patch to review. Thanks.

-- 
Baolin.wang
Best Regards
