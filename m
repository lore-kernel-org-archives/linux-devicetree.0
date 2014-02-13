From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v3 7/7] devicetree: bindings: Document PM8921/8058 PMICs
Date: Wed, 12 Feb 2014 21:38:14 -0800
Message-ID: <20140213053813.GB14769@codeaurora.org>
References: <1389206270-3728-1-git-send-email-sboyd@codeaurora.org>
 <1389206270-3728-8-git-send-email-sboyd@codeaurora.org>
 <20140211092937.GG32042@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140211092937.GG32042@lee--X1>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 02/11, Lee Jones wrote:
> 
> > +- interrupts:
> > +	Usage: required
> > +	Value type: <prop-encoded-array>
> 
> Either provide an example or a comment to see the description of
> #interrupt-cells 

It is part of the example. We also state that the format is
defined by the interrupt parent binding.

> 
> > +	Definition: specifies the interrupt that indicates a subdevice
> > +		    has generated an interrupt (summary interrupt). The
> > +		    format of the specifier is defined by the binding document
> > +		    describing the node's interrupt parent.
> > +
> > +- #interrupt-cells:
> > +	Usage: required
> > +	Value type : <u32>
> > +	Definition: must be 2. Specifies the number of cells needed to encode
> > +		    an interrupt source. The 1st cell contains the interrupt
> > +		    number. The 2nd cell is the trigger type and level flags
> > +		    encoded as follows:
> > +
> > +			1 = low-to-high edge triggered
> > +			2 = high-to-low edge triggered
> > +			4 = active high level-sensitive
> > +			8 = active low level-sensitive
> 
> Actually I'd prefer if you used the definitions in:
>   dt-bindings/interrupt-controller/irq.h

These match the #defines in that file. I'd like to be explicit
about the numbers to prevent people from thinking they have to
use #defines and to match what other irq controllers have done
(gic, atmel-aic, etc.)

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
