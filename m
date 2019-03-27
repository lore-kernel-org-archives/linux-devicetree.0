From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v3 2/2] dt-bindings: net: bluetooth: Add device tree
 bindings for QTI chip wcn3998
Date: Wed, 27 Mar 2019 10:22:10 -0700
Message-ID: <20190327172210.GD112750@google.com>
References: <1552393379-26330-1-git-send-email-c-hbandi@codeaurora.org>
 <1552393379-26330-3-git-send-email-c-hbandi@codeaurora.org>
 <20190312165928.GD200579@google.com>
 <88a923e02073461abb5f3a7674150615@codeaurora.org>
 <20190314185637.GB112750@google.com>
 <8432d8b9743e2b4b6a7195329c808af3@codeaurora.org>
 <20190326235458.GA112750@google.com>
 <6a57b6cfd92f982c5e00fc1db30e778e@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6a57b6cfd92f982c5e00fc1db30e778e@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Harish Bandi <c-hbandi@codeaurora.org>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org, anubhavg@codeaurora.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-bluetooth-owner@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 27, 2019 at 03:53:58PM +0530, Harish Bandi wrote:
> Hi Matthias,
> 
> > > > > > You mentioned in an earlier version of the series that there are
> > > > > > multiple WCN3998 variants with different requirements for
> > > > > > voltage/current. This seems to suggests that multiple compatible
> > > > > > strings are needed to distinguish between them.
> > > > > >
> > > > > [Harish] -- for now we want to add WCN3998 support only, What i mean
> > > > > to say
> > > > > in my earlier
> > > > > explanation that. WCN3990 is base variant and on top of that we have
> > > > > variants like WCN3990,
> > > > > WCN3998 and WCN3998-0,WCN3998-1 like that..
> > > > > So I think wcn399x would make sense for this series.
> > > >
> > > > If the variants have relevant differences between them (like different
> > > > regulator requirements) I think you want unique names, rather than
> > > > 'wcn399x' (I was referring to comments/documentation with this
> > > > string).
> > > >
> > > > If there are variants wouldn't your first 'wcn3998' already be a
> > > > 'wcn3998-n'? If 'wcn3998' without suffix is used I think it needs to
> > > > be valid for all 'wcn3998-n' variants (it might be less
> > > > power-efficient though than using the variant specific compatible
> > > > string), otherwise things get confusing (a 'wcn3998-2' isn't a
> > > > 'wcn3998'?)
> > > >
> > > 
> > > 
> > >  [Harish] -- for now WCN3990 and WCN3998 only, also wcn3998-2 and
> > > wcn3998
> > > are same.
> > > So for now we are going to have only WCN3990 and WCN3998 for DT.
> > 
> > Since you brought up the different power requirements initially:
> > 
> > are your reasonably sure that future wcn3998-3, wcn3998-4, ... can
> > operate with the generic wcn3998 power settings?
> 
> [Harish] - yes with power settings of wcn3998, wcn3998-3 and wcn3998-4 ...
> also will work.

Thanks for the confirmation, in that case just using 'wcn3998' for now
sounds good to me.
