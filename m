From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH v2] ARM: map ATAGs when not in first 1MB of RAM
Date: Mon, 7 Feb 2011 08:23:03 -0800
Message-ID: <20110207162302.GJ20795@atomide.com>
References: <1296223246-2934-1-git-send-email-robherring2@gmail.com>
	<20110128141031.GB12976@n2100.arm.linux.org.uk>
	<4D42DC71.5080606@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <4D42DC71.5080606@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robherring2@gmail.com>
Cc: devicetree-discuss@lists.ozlabs.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

* Rob Herring <robherring2@gmail.com> [110128 07:10]:
> Russell,
> 
> On 01/28/2011 08:10 AM, Russell King - ARM Linux wrote:
> >On Fri, Jan 28, 2011 at 08:00:46AM -0600, Rob Herring wrote:
> >>@@ -206,11 +206,17 @@ __create_page_tables:
> >>  #endif
> >>
> >>  	/*
> >>-	 * Then map first 1MB of ram in case it contains our boot params.
> >>+	 * Then map boot params address in r2 or
> >>+	 * the first 1MB of ram if boot params address is not specified.
> >>  	 */
> >>-	add	r0, r4, #PAGE_OFFSET>>  18
> >>-	orr	r6, r7, r8
> >>-	str	r6, [r0]
> >>+	mov	r0, r2, lsr #20
> >>+	movs	r0, r0, lsl #20
> >>+	moveq	r0, r8
> >>+	sub	r3, r0, r8
> >>+	add	r3, r3, #PAGE_OFFSET
> >>+	add	r3, r4, r3, lsr #18
> >>+	orr	r6, r7, r0
> >>+	str	r6, [r3]
> >
> >Wouldn't:
> >	str	r6, [r4, r3, lsr #18]
> >work here?
> 
> Not on Thumb2:
> 
> arch/arm/kernel/head.S:218: Error: Thumb supports only LSL in
> shifted register indexing -- `str r6,[r4,r3,lsr#18]'

Acked-by: Tony Lindgren <tony@atomide.com>
