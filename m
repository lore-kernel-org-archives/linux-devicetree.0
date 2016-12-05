From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [RESEND/PATCH v6 3/3] clk: qcom: Add A53 clock driver
Date: Mon, 5 Dec 2016 13:26:44 -0800
Message-ID: <20161205212644.GB30492@tuxbot>
References: <20161019132816.31073-4-georgi.djakov@linaro.org>
 <20161028015438.GG16026@codeaurora.org>
 <20161102205910.GQ25787@tuxbot>
 <20161102225520.GW16026@codeaurora.org>
 <20161103182834.GR25787@tuxbot>
 <549f87fe-7be9-14b4-8e34-86f7f8dad94e@linaro.org>
 <20161114203426.GN5177@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161114203426.GN5177@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Georgi Djakov <georgi.djakov@linaro.org>, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon 14 Nov 14:21 PST 2016, Stephen Boyd wrote:

> On 11/11, Georgi Djakov wrote:
> > On 11/03/2016 08:28 PM, Bjorn Andersson wrote:
[..]
> > >I'm in favour of us inventing a kicker API and it's found outside out
> > >use cases as well (e.g. virtio/rpmsg).
> > >
> 
> I'd rather we did this kicker API as well. That way we don't need
> to make a syscon and a simple-mfd to get software to work
> properly. Don't other silicon vendors need a kicker API as well?
> How are they kicking remote processors in other places? GPIOs?
> 

In remoteproc I have two of these:
1) da8xx_remoteproc ioremaps a register and writes a bit in it (looks
   similar to the downstream Qualcomm way)

2) omap_remoteproc acquires a mbox channel, in which it writes a
   virtqueue id to kick the remote.

So one of the two cases could have used such mechanism.

We could write up a Qualcomm specific "kicker" and probe the mailing
list regarding the interest in making that generic (i.e. changing the
names in the API and DT binding).

The sucky part is that I believe we have most of our kickers in place
already so rpm, smd, smp2p, smsm etc would all need to support both
mechanisms.

Regards,
Bjorn
