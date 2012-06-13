From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [RFC 3/4] ARM: topology: Update cpu_power according to DT
 information
Date: Wed, 13 Jun 2012 14:47:46 +0200
Message-ID: <1339591666.8980.26.camel@twins>
References: <1339502524-10265-1-git-send-email-vincent.guittot@linaro.org>
	 <1339502524-10265-4-git-send-email-vincent.guittot@linaro.org>
	 <CAORVsuWqWt0pJfewymh_ydAH61-uPsO0M7m7Gs4N3zJY=Vo9ZA@mail.gmail.com>
	 <CAKfTPtBc-KuDg_1qe04TfYS4+66qQoiHCJQbCF9gnhga5ociow@mail.gmail.com>
	 <CAP245DXEOGLe1jq2Wj0rNW5qea63UyJu2jOvwV65Y4B9LLoQtg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAP245DXEOGLe1jq2Wj0rNW5qea63UyJu2jOvwV65Y4B9LLoQtg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Amit Kucheria <amit.kucheria@linaro.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Jean Pihet <jean.pihet@newoldbits.com>, linux@arm.linux.org.uk, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, rob.herring@calxeda.com, linaro-dev@lists.linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, 2012-06-13 at 18:14 +0530, Amit Kucheria wrote:
> Various discussions around power-aware scheduling have amplified the
> need for the scheduler to have some knowledge of DVFS. This would then
> require the scheduler to track 'cpu_power' ( = max power) and perhaps
> a new variable 'current_power' that is changed by the DVFS framework.

Note that capacity is in fact a better term -- not to be confused with
the capacity as currently in use within the load-balancer. Luckily
there's no way to read that an not be confused.. uhmm :-)
> 
> The first goal, though, is to make sure that the scheduler can handle
> different cpu_power values due to asymmetric cores. 

I would think the very first goal was to do a simple packing balancer
before doing silly things with asymmetric setups.. but what do I know.
