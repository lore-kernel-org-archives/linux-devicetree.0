Return-Path: <SRS0=/oPt=XC=gmail.com=robdclark@kernel.org>
MIME-Version: 1.0
References: <20190905192412.23116-1-lee.jones@linaro.org> <5d71ef95.1c69fb81.6d090.085d@mx.google.com>
 <20190906061448.GJ26880@dell> <20190906065018.GA1019@kunai>
 <20190906075600.GL26880@dell> <20190906102355.GA3146@kunai>
 <20190906105445.GO26880@dell> <20190906183139.GB19123@kunai>
In-Reply-To: <20190906183139.GB19123@kunai>
From: Rob Clark <robdclark@gmail.com>
Date: Sat, 7 Sep 2019 10:56:34 -0700
Message-ID: <CAF6AEGsHOaR1dRf8xGH5sRa38=S+Y3NvNiAJ9DpMkddWoLBw8g@mail.gmail.com>
Subject: Re: [RESEND v3 1/1] i2c: qcom-geni: Disable DMA processing on the
 Lenovo Yoga C630
Content-Type: text/plain; charset="UTF-8"
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Lee Jones <lee.jones@linaro.org>, Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>, alokc@codeaurora.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, vkoul@kernel.org, linux-i2c@vger.kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Sat, Sep 7, 2019 at 9:17 AM Wolfram Sang <wsa@the-dreams.de> wrote:
>
>
> > Does this mean you plan to have this merged for v5.4?
>
> Only if the machine DTS is expected to land in 5.4. But Stephen said it
> is not in liunx-next yet?
>

It appears to be in arm-soc for-next:

https://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc.git/log/?h=for-next

BR,
-R
