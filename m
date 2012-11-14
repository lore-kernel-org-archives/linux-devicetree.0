From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH V2 4/5] arm: mm: Added support for PJ4B cpu and init
 routines
Date: Wed, 14 Nov 2012 00:14:38 +0000
Message-ID: <20121114001438.GF3290@n2100.arm.linux.org.uk>
References: <1351545108-18954-1-git-send-email-gregory.clement@free-electrons.com>
 <1351545108-18954-5-git-send-email-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1351545108-18954-5-git-send-email-gregory.clement@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Ike Pan <ike.pan@canonical.com>, Will Deacon <will.deacon@arm.com>, Nadav Haklai <nadavh@marvell.com>, Ian Molton <ian.molton@codethink.co.uk>, David Marlin <dmarlin@redhat.com>, Yehuda Yitschak <yehuday@marvell.com>, Jani Monoses <jani.monoses@canonical.com>, Mike Turquette <mturquette@linaro.org>, Tawfik Bayouk <tawfik@marvell.com>, Dan Frazier <dann.frazier@canonical.com>, Eran Ben-Avi <benavi@marvell.com>, Leif Lindholm <leif.lindholm@arm.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, Jon Masters <jcm@redhat.com>, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Chris
List-Id: devicetree@vger.kernel.org

On Mon, Oct 29, 2012 at 10:11:47PM +0100, Gregory CLEMENT wrote:
> +	/* Auxiliary Debug Modes Control 2 Register */
> +	mrc	p15, 1,	r0, c15, c1, 2
> +	bic	r0, r0, #(1 << 23)   @ Enable fast LDR.
> +	orr	r0, r0, #(1 << 25)   @ Dont interleave write and snoop data.
> +	orr	r0, r0, #(1 << 27)   @ Disable Critical Word First feature.
> +	orr	r0, r0, #(1 << 29)   @ Disable outstanding non cacheable request
> +	orr	r0, r0, #(1 << 30)   @ L1 replacement - Strict round robin

This just looks silly to me - setting five bits with five instructions
when they can all be done in one instruction.  Yes, I know you want
to comment it, but there's other ways to achieve that.

> +__v7_pj4b_proc_info:
> +	.long	0x562f5842
> +	.long	0xffffffff

Same comment here as Will :)
