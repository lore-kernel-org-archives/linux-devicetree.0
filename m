From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 4/6] edac: Document Krait L1/L2 EDAC driver binding
Date: Tue, 29 Oct 2013 17:34:36 -0700
Message-ID: <20131030003436.GB3268@kartoffel>
References: <1383006690-6754-1-git-send-email-sboyd@codeaurora.org>
 <1383006690-6754-5-git-send-email-sboyd@codeaurora.org>
 <20131029013454.GJ4763@kartoffel>
 <20131029050645.GC21983@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20131029050645.GC21983@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 29, 2013 at 05:06:45AM +0000, Stephen Boyd wrote:
> On 10/28, Mark Rutland wrote:
> > On Tue, Oct 29, 2013 at 12:31:28AM +0000, Stephen Boyd wrote:
> > > +
> > > +Optional properties:
> > > +- interrupt-names: Should contain the interrupt names "l1_irq" and
> > > +  "l2_irq"
> > 
> > As with my comment on the parsing code, I'd prefer that if interrupt-names was
> > present it defined the order of interrupts. Otherwise it's redundant and of no
> > value.
> > 
> > Otherwise, the binding looks fine to me:
> > 
> > Acked-by: Mark Rutland <mark.rutland@arm.com>
> 
> How about I just drop the interrupt-names property? It isn't
> adding much and is a holdover from the vendor kernel.

That's also fine given that this is a very specific binding.

Mark.
