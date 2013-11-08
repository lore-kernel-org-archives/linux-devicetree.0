From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: common location for devicetree files
Date: Fri, 8 Nov 2013 11:52:55 -0500
Message-ID: <20131108165255.GA32668@titan.lakedaemon.net>
References: <1438803E-C904-428B-B042-891978BC15DF@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1438803E-C904-428B-B042-891978BC15DF@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>
Cc: devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org list" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 07, 2013 at 05:21:58PM -0600, Kumar Gala wrote:
> As we start having more sharing of device trees between architectures
> (arm & arm64, arm & powerpc, guessing maybe mips & arm) we need dts to
> live in location that 
> 
> I was wondering what people felt about doing:
> 
> 	arch/dts/<VENDOR>/
> 
> as a common location that could be shared.  I'm up for other
> suggestions.

What do we really need to do before the move?  Should all arch dts files
be able to #include from any arch?  What's the minimum churn needed to
accomplish that?  Maybe just move the needed bits to arch/dts/include/ ?

I'm not real keen on separating by vendor.  For example, us mvebu folks
would probably miss useful/duplicated effort in another vendor's
subdirectory.  Which was the whole reason for moving driver code out of
machine directories to begin with.

thx,

Jason.
