From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH 0/3] GIC OF bindings
Date: Tue, 20 Sep 2011 22:49:10 -0400 (EDT)
Message-ID: <20110920.224910.1996429830782124690.davem@davemloft.net>
References: <1316550244-3655-1-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1316550244-3655-1-git-send-email-robherring2@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robherring2@gmail.com
Cc: dave.martin@linaro.org, linux@arm.linux.org.uk, b-cousson@ti.com, marc.zyngier@arm.com, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, rob.herring@calxeda.com, grant.likely@secretlab.ca, thomas.abraham@linaro.org, jamie@jamieiles.com, shawn.guo@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Rob Herring <robherring2@gmail.com>
Date: Tue, 20 Sep 2011 15:24:01 -0500

> Hopefully, this is the final or near final version of GIC binding support.
> 
> Changes from the previous version:
> - SPIs and PPIs are numbered starting at 0. Now the gic has it's own irq
>   domain translate function instead of the simple domain one.
> - interrupt cell format has changed based on Grant's proposal.
> - Dropped "ARM: gic: allow irq_start to be 0". Instead, the first 16 irqs
>   are skipped and the domain irq_base adjusted accordingly.
> - Added a fix to of_irq_find_parent when the parent == child.
> - Renamed intc_desc.parent to intc_desc.interrupt_parent.
> - Implemented Grant's algorithm for walking the list of interrupt
>   controllers. Added a return value to interrupt init functions, so they
>   don't get added to the parent list on a init failure.
> 
> The changes are significant enough that I did not include previous
> acked/reviewed/tested-by's.

Just out of curiosity where does this "interrupt-parent" property
come from?

On platforms I am familiar with, the parent path is walked to the root
and we stop at device nodes that have "interrupt-map" and
"interrupt-map-mask" properties.

The map and mask are applied to the "reg" property of the device in
question to see which map entry matches, if a match is found the map
entry contains the translated interrupt.

And this process continues over and over all the way to the root to get
the system interrupt that processor actually deals with.

The mechanism shown here seems overly simplistic and not able to handle
the cases handled by existing OF property schemes in use for several
years on real systems.
