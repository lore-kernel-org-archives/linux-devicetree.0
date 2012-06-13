From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [RFC 1/4] ARM: topology: Add arch_scale_freq_power function
Date: Wed, 13 Jun 2012 14:52:49 +0200
Message-ID: <1339591969.8980.30.camel@twins>
References: <1339502524-10265-1-git-send-email-vincent.guittot@linaro.org>
	 <1339502524-10265-2-git-send-email-vincent.guittot@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1339502524-10265-2-git-send-email-vincent.guittot@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linaro-dev@lists.linaro.org, devicetree-discuss@lists.ozlabs.org, linux@arm.linux.org.uk, grant.likely@secretlab.ca, rob.herring@calxeda.com, Andy Whitcroft <apw@canonical.com>
List-Id: devicetree@vger.kernel.org

On Tue, 2012-06-12 at 14:02 +0200, Vincent Guittot wrote:
>         }
>         smp_wmb();
>  } 

You know what.. we should make checkpatch report an error for memory
barriers that don't have a comment. 

I know this isn't added by this patch, but every time I see something
like it I cry a little.
