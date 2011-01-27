From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH] ARM: map ATAGs when not in first 1MB of RAM
Date: Thu, 27 Jan 2011 16:31:49 +0000
Message-ID: <20110127163149.GF25968@n2100.arm.linux.org.uk>
References: <1296143443-9442-1-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1296143443-9442-1-git-send-email-robherring2@gmail.com>
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
Cc: devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 27, 2011 at 09:50:43AM -0600, Rob Herring wrote:
> +	/*
> +	 * Otherwise map the 1MB region r2 points to (atags or dtb)
> +	 */
> +1:	mov	r0, r2, lsr #20
> +	mov	r0, r0, lsl #20
> +	sub	r3, r0, #(PHYS_OFFSET & 0xff000000)
> +	.if	(PHYS_OFFSET & 0x00f00000)
> +	sub	r3, r3, #(PHYS_OFFSET & 0x00f00000)

This introduces new PHYS_OFFSET uses which we're trying hard to get
rid of.  This will need to be reworked.
