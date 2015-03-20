From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: Re: [PATCH v7 1/2] DT: hwspinlock: Add binding documentation for
 Qualcomm hwmutex
Date: Fri, 20 Mar 2015 13:49:12 -0700
Message-ID: <20150320204912.GC31953@sonymobile.com>
References: <1426816091-29171-1-git-send-email-bjorn.andersson@sonymobile.com>
 <20150320202909.GA8189@qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150320202909.GA8189@qualcomm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Ohad Ben-Cohen <ohad@wizery.com>, Kumar Gala <galak@codeaurora.org>, Suman Anna <s-anna@ti.com>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, Jeffrey Hugo <jhugo@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri 20 Mar 13:29 PDT 2015, Andy Gross wrote:

> On Thu, Mar 19, 2015 at 06:48:10PM -0700, Bjorn Andersson wrote:
> 
> <snip>
> 
> > +Example:
> > +
> > +	tcsr: syscon@1a400000 {
> 
> typo here, syscon@fd484000.  And this syscon is specifically for the tcsr mutex
> reg area.
> 

You're right, I didn't read the documentation good enough; let's name it
tcsr-mutex and as this is not the main tcsr region we should fall back
to just having syscon as compatible.

But there's still a bunch of other registers in the tcsr-mutex range -
that probably will be consumed by various drivers, so it still makes
sense to have a syscon there.

Sorry about the address, will update that as well.

> > +		compatible = "qcom,tcsr-msm8974", "syscon";
> > +		reg = <0xfd484000 0x2000>;
> 

Regards,
Bjorn
