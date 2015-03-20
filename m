From: Andy Gross <agross@codeaurora.org>
Subject: Re: [PATCH v7 1/2] DT: hwspinlock: Add binding documentation for
 Qualcomm hwmutex
Date: Fri, 20 Mar 2015 16:42:06 -0500
Message-ID: <20150320214206.GB8189@qualcomm.com>
References: <1426816091-29171-1-git-send-email-bjorn.andersson@sonymobile.com>
 <20150320202909.GA8189@qualcomm.com>
 <20150320204912.GC31953@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150320204912.GC31953@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Ohad Ben-Cohen <ohad@wizery.com>, Kumar Gala <galak@codeaurora.org>, Suman Anna <s-anna@ti.com>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, Jeffrey Hugo <jhugo@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 20, 2015 at 01:49:12PM -0700, Bjorn Andersson wrote:
> On Fri 20 Mar 13:29 PDT 2015, Andy Gross wrote:
> 
> > On Thu, Mar 19, 2015 at 06:48:10PM -0700, Bjorn Andersson wrote:
> > 
> > <snip>
> > 
> > > +Example:
> > > +
> > > +	tcsr: syscon@1a400000 {
> > 
> > typo here, syscon@fd484000.  And this syscon is specifically for the tcsr mutex
> > reg area.
> > 
> 
> You're right, I didn't read the documentation good enough; let's name it
> tcsr-mutex and as this is not the main tcsr region we should fall back
> to just having syscon as compatible.

Agreed.  A generic syscon will work until we need to support the other registers
in that block.

> But there's still a bunch of other registers in the tcsr-mutex range -
> that probably will be consumed by various drivers, so it still makes
> sense to have a syscon there.

Agreed.

-- 
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
