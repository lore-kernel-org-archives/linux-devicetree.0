Return-Path: <SRS0=LbBh=XI=linaro.org=bjorn.andersson@kernel.org>
Date: Fri, 13 Sep 2019 09:13:45 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [RESEND v3 1/1] i2c: qcom-geni: Disable DMA processing on the
 Lenovo Yoga C630
Message-ID: <20190913161345.GB8466@tuxbook-pro>
References: <20190905192412.23116-1-lee.jones@linaro.org>
 <5d71ef95.1c69fb81.6d090.085d@mx.google.com>
 <20190906061448.GJ26880@dell>
 <20190906065018.GA1019@kunai>
 <20190906075600.GL26880@dell>
 <20190906102355.GA3146@kunai>
 <20190906105445.GO26880@dell>
 <20190906183139.GB19123@kunai>
 <CAF6AEGsHOaR1dRf8xGH5sRa38=S+Y3NvNiAJ9DpMkddWoLBw8g@mail.gmail.com>
 <20190913142821.GD1022@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190913142821.GD1022@kunai>
To: Wolfram Sang <wsa@the-dreams.de>, Arnd Bergmann <arnd@arndb.de>
Cc: Rob Clark <robdclark@gmail.com>, Lee Jones <lee.jones@linaro.org>, Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>, alokc@codeaurora.org, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, vkoul@kernel.org, linux-i2c@vger.kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Fri 13 Sep 07:28 PDT 2019, Wolfram Sang wrote:

> On Sat, Sep 07, 2019 at 10:56:34AM -0700, Rob Clark wrote:
> > On Sat, Sep 7, 2019 at 9:17 AM Wolfram Sang <wsa@the-dreams.de> wrote:
> > >
> > >
> > > > Does this mean you plan to have this merged for v5.4?
> > >
> > > Only if the machine DTS is expected to land in 5.4. But Stephen said it
> > > is not in liunx-next yet?
> > >
> > 
> > It appears to be in arm-soc for-next:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc.git/log/?h=for-next
> 
> Still not in linux-next. Please ping me or resend this patch once it
> hits linux-next.
> 

It seems linux-next is now pulling from the soc.git, rather than
arm-soc.git, but Arnd is still pushing patches to arm-soc.git.

Arnd says that the patch will be in v5.4 and I merged Arnd's tree and
gave it a spin here and this patch makes it boot. So please merge this
patch for v5.4 as well.

Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Thanks,
Bjorn
