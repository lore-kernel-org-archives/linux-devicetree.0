From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [RFC 3/4] ARM: topology: Update cpu_power according to DT
 information
Date: Wed, 13 Jun 2012 10:42:06 -0400 (EDT)
Message-ID: <alpine.LFD.2.02.1206131038060.23555@xanadu.home>
References: <1339502524-10265-1-git-send-email-vincent.guittot@linaro.org> <1339502524-10265-4-git-send-email-vincent.guittot@linaro.org> <1339592984.8980.34.camel@twins>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1339592984.8980.34.camel@twins>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Zijlstra <peterz@infradead.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linaro-dev@lists.linaro.org, devicetree-discuss@lists.ozlabs.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, Grant Likely <grant.likely@secretlab.ca>, rob.herring@calxeda.com
List-Id: devicetree@vger.kernel.org

On Wed, 13 Jun 2012, Peter Zijlstra wrote:

> On Tue, 2012-06-12 at 14:02 +0200, Vincent Guittot wrote:
> > +#ifdef CONFIG_OF
> 
> That must really be the worst CONFIG_ name ever..

Indeed!  We must corner Grant to do a s/CONFIG_OF/CONFIG_DEVICE_TREE/
on the whole tree and send the patch to Linus.  He just managed to 
chicken away from doing it so far.


Nicolas
