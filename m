From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [RFC 3/4] ARM: topology: Update cpu_power according to DT
 information
Date: Wed, 13 Jun 2012 15:07:36 +0200
Message-ID: <1339592856.8980.33.camel@twins>
References: <1339502524-10265-1-git-send-email-vincent.guittot@linaro.org>
	 <1339502524-10265-4-git-send-email-vincent.guittot@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1339502524-10265-4-git-send-email-vincent.guittot@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linaro-dev@lists.linaro.org, devicetree-discuss@lists.ozlabs.org, linux@arm.linux.org.uk, grant.likely@secretlab.ca, rob.herring@calxeda.com
List-Id: devicetree@vger.kernel.org

On Tue, 2012-06-12 at 14:02 +0200, Vincent Guittot wrote:
> +struct cpu_capacity cpu_capacity[NR_CPUS];

I know ARM isn't likely to suffer from the 4k cpu issue, but is there a
reason to use a NR_CPUS array over a per-cpu variable?
