From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 4/6] edac: Document Krait L1/L2 EDAC driver binding
Date: Mon, 28 Oct 2013 22:06:45 -0700
Message-ID: <20131029050645.GC21983@codeaurora.org>
References: <1383006690-6754-1-git-send-email-sboyd@codeaurora.org>
 <1383006690-6754-5-git-send-email-sboyd@codeaurora.org>
 <20131029013454.GJ4763@kartoffel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20131029013454.GJ4763@kartoffel>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 10/28, Mark Rutland wrote:
> On Tue, Oct 29, 2013 at 12:31:28AM +0000, Stephen Boyd wrote:
> > +
> > +Optional properties:
> > +- interrupt-names: Should contain the interrupt names "l1_irq" and
> > +  "l2_irq"
> 
> As with my comment on the parsing code, I'd prefer that if interrupt-names was
> present it defined the order of interrupts. Otherwise it's redundant and of no
> value.
> 
> Otherwise, the binding looks fine to me:
> 
> Acked-by: Mark Rutland <mark.rutland@arm.com>

How about I just drop the interrupt-names property? It isn't
adding much and is a holdover from the vendor kernel.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
