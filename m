Return-Path: <SRS0=wJwZ=XJ=gmail.com=arndbergmann@kernel.org>
MIME-Version: 1.0
References: <20190905192412.23116-1-lee.jones@linaro.org> <5d71ef95.1c69fb81.6d090.085d@mx.google.com>
 <20190906061448.GJ26880@dell> <20190906065018.GA1019@kunai>
 <20190906075600.GL26880@dell> <20190906102355.GA3146@kunai>
 <20190906105445.GO26880@dell> <20190906183139.GB19123@kunai>
 <CAF6AEGsHOaR1dRf8xGH5sRa38=S+Y3NvNiAJ9DpMkddWoLBw8g@mail.gmail.com>
 <20190913142821.GD1022@kunai> <20190913161345.GB8466@tuxbook-pro>
In-Reply-To: <20190913161345.GB8466@tuxbook-pro>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 14 Sep 2019 21:13:28 +0200
Message-ID: <CAK8P3a2+Foj4gxxetFQ5y1jUjc+HZDT1B3Utj9y2fJQMq83NrQ@mail.gmail.com>
Subject: Re: [RESEND v3 1/1] i2c: qcom-geni: Disable DMA processing on the
 Lenovo Yoga C630
Content-Type: text/plain; charset="UTF-8"
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Wolfram Sang <wsa@the-dreams.de>, Rob Clark <robdclark@gmail.com>, Lee Jones <lee.jones@linaro.org>, Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>, alokc@codeaurora.org, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, Linux I2C <linux-i2c@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Fri, Sep 13, 2019 at 6:13 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Fri 13 Sep 07:28 PDT 2019, Wolfram Sang wrote:
>
> > On Sat, Sep 07, 2019 at 10:56:34AM -0700, Rob Clark wrote:
> > > On Sat, Sep 7, 2019 at 9:17 AM Wolfram Sang <wsa@the-dreams.de> wrote:
> > > >
> > > >
> > > > > Does this mean you plan to have this merged for v5.4?
> > > >
> > > > Only if the machine DTS is expected to land in 5.4. But Stephen said it
> > > > is not in liunx-next yet?
> > > >
> > >
> > > It appears to be in arm-soc for-next:
> > >
> > > https://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc.git/log/?h=for-next
> >
> > Still not in linux-next. Please ping me or resend this patch once it
> > hits linux-next.
> >
>
> It seems linux-next is now pulling from the soc.git, rather than
> arm-soc.git, but Arnd is still pushing patches to arm-soc.git.

I'm still pushing identical contents to both, but plan to remove the old
tree after the merge window.

      Arnd
