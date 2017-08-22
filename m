From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH V2] spmi: pmic-arb: Enforce the ownership check optionally
Date: Tue, 22 Aug 2017 17:01:40 +0800
Message-ID: <20170822090139.GC3685@dragon>
References: <1503070110-15018-1-git-send-email-kgunda@codeaurora.org>
 <e0af96c3-208b-abfc-8b2a-4ea1cc810ec7@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <e0af96c3-208b-abfc-8b2a-4ea1cc810ec7@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Kiran Gunda <kgunda@codeaurora.org>, gregkh@linuxfoundation.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Abhijeet Dharmapurikar <adharmap@codeaurora.org>, David Collins <collinsd@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 21, 2017 at 04:18:58PM -0700, Stephen Boyd wrote:
> On 08/18/2017 08:28 AM, Kiran Gunda wrote:
> > The peripheral ownership check is not necessary on single master
> > platforms. Hence, enforce the peripheral ownership check optionally.
> >
> > Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> > Tested-by: Shawn Guo <shawnguo@kernel.org>
> > ---
> 
> This sounds like a band-aid. Isn't the gpio driver going to keep probing
> all the pins that are not supposed to be accessed due to security
> constraints? What exactly is failing in the gpio case?
> 
> Also, I thought we were getting rid of the ownership checks? Or at
> least, putting them behind some debug kernel feature check or something?

I'm wondering that too.  Since we have the following patch to remove the
check on read/write access anyway, why are we adding the check in .xlate
hook?

spmi: pmic-arb: remove the read/write access checks

Shawn
