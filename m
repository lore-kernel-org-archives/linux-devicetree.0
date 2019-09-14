Return-Path: <SRS0=IIK2=XJ=linaro.org=lee.jones@kernel.org>
Date: Sat, 14 Sep 2019 09:57:03 +0100
From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [RESEND v3 1/1] i2c: qcom-geni: Disable DMA processing on the
 Lenovo Yoga C630
Message-ID: <20190914085703.GU26880@dell>
References: <20190906061448.GJ26880@dell>
 <20190906065018.GA1019@kunai>
 <20190906075600.GL26880@dell>
 <20190906102355.GA3146@kunai>
 <20190906105445.GO26880@dell>
 <20190906183139.GB19123@kunai>
 <CAF6AEGsHOaR1dRf8xGH5sRa38=S+Y3NvNiAJ9DpMkddWoLBw8g@mail.gmail.com>
 <20190913142821.GD1022@kunai>
 <20190913161345.GB8466@tuxbook-pro>
 <20190913161748.GF1022@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190913161748.GF1022@kunai>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Rob Clark <robdclark@gmail.com>, Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>, alokc@codeaurora.org, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, vkoul@kernel.org, linux-i2c@vger.kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Fri, 13 Sep 2019, Wolfram Sang wrote:

> 
> > It seems linux-next is now pulling from the soc.git, rather than
> > arm-soc.git, but Arnd is still pushing patches to arm-soc.git.
> 
> Can you ask them to fix this?

Linux next is on vacation for month.

The last tag was next-20190904.

> > Arnd says that the patch will be in v5.4 and I merged Arnd's tree and
> > gave it a spin here and this patch makes it boot. So please merge this
> > patch for v5.4 as well.
> 
> No worries, this is clearly a bugfix. So it will easily go in with the
> same release as the DTS file.

Thanks.  The DTS commit will go in for v5.4.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
