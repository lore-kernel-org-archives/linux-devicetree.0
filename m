From: Joe Perches <joe@perches.com>
Subject: Re: [RFC 1/4] ARM: topology: Add arch_scale_freq_power function
Date: Wed, 13 Jun 2012 12:30:57 -0700
Message-ID: <1339615857.28729.6.camel@joe2Laptop>
References: <1339502524-10265-1-git-send-email-vincent.guittot@linaro.org>
	 <1339502524-10265-2-git-send-email-vincent.guittot@linaro.org>
	 <1339591969.8980.30.camel@twins> <20120613192740.GZ5878@dm>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120613192740.GZ5878@dm>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Whitcroft <apw@canonical.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Vincent Guittot <vincent.guittot@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linaro-dev@lists.linaro.org, devicetree-discuss@lists.ozlabs.org, linux@arm.linux.org.uk, grant.likely@secretlab.ca, rob.herring@calxeda.com
List-Id: devicetree@vger.kernel.org

On Wed, 2012-06-13 at 20:27 +0100, Andy Whitcroft wrote:
> On Wed, Jun 13, 2012 at 02:52:49PM +0200, Peter Zijlstra wrote:
> > On Tue, 2012-06-12 at 14:02 +0200, Vincent Guittot wrote:
> > >         }
> > >         smp_wmb();
> > >  } 
> > 
> > You know what.. we should make checkpatch report an error for memory
> > barriers that don't have a comment. 
> > 
> > I know this isn't added by this patch, but every time I see something
> > like it I cry a little.
> 
> Actually if it was a new line, it would have been reported, at least in
> theory:
> 
>     # check for memory barriers without a comment.
> 		    if ($line =~
>     /\b(mb|rmb|wmb|read_barrier_depends|smp_mb|smp_rmb|smp_wmb|smp_read_barrier_depends)\(/)
>     {
> 	if (!ctx_has_comment($first_line, $linenr)) {
> 	    CHK("MEMORY_BARRIER",
> 		"memory barrier without comment\n" . $herecurr);
> 	}
>     }

Maybe promote that CHK to a WARN.
