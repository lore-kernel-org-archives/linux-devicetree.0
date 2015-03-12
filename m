From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: Re: [PATCH v6 1/2] DT: hwspinlock: Add binding documentation for
 Qualcomm hwmutex
Date: Thu, 12 Mar 2015 04:14:31 -0700
Message-ID: <20150312111430.GU26334@sonymobile.com>
References: <1425076217-10415-1-git-send-email-bjorn.andersson@sonymobile.com>
 <20150312095136.GA30145@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150312095136.GA30145@leverpostej>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Ohad Ben-Cohen <ohad@wizery.com>, Kumar Gala <galak@codeaurora.org>, Suman Anna <s-anna@ti.com>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, Jeffrey Hugo <jhugo@codeaurora.org>, Andy Gross <agross@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu 12 Mar 02:51 PDT 2015, Mark Rutland wrote:

> On Fri, Feb 27, 2015 at 10:30:16PM +0000, Bjorn Andersson wrote:
> > Add binding documentation for the Qualcomm Hardware Mutex.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> > ---
> > 
> > I think the conclusion on the dt binding discussion for hwspinlocks was that
> > we're down to having the #hwlock-cells intact. So this version includes that,
> > but non of the other previously discussed properties.
> > 
> > Changes since v5:
> > - Extracted the dt binding documentation into a separate patch
> > - Moved the driver to consume a syscon
> 
> I'm a little confused here. Why are we now using a syscon? I thought the
> set of registers for the block was well-defined.
> 

The sfpb-mutex registers make up a block (according to my
documentation), but after discussing tcsr with Andy Gross we concluded
that although the tcsr-mutex registers are layed out consecutively in
the tcsr, they are not alone in the block.

Further more Andy introduced the tcsr-syscon binding in his work to
support DMA on GSBI (uart/i2c/spi), so that's why I had to make this
change.

Preferrably this would have showed up before v6...

> If there's a link to some previous discussion on that point, it would be
> helpful.
> 

Unfortunately there isn't, as we discussed this mainly face to face a
few weeks back.

Regards,
Bjorn
