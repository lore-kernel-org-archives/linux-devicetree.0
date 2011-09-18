From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH 4/5] ARM: gic: allow irq_start to be 0
Date: Sun, 18 Sep 2011 13:03:12 +0100
Message-ID: <20110918120312.GL16381@n2100.arm.linux.org.uk>
References: <1316017900-19918-1-git-send-email-robherring2@gmail.com>
	<1316017900-19918-5-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1316017900-19918-5-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 14, 2011 at 11:31:39AM -0500, Rob Herring wrote:
> From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> 
> There's really no need to set irq_start per platform for the primary gic.
> The SGIs and PPIs are not handled as normal irqs, so how irqs 0-31 are
> setup doesn't really matter. So allow irq_start to be set to 0 to match
> the linux irq numbering.

That's not correct.  The hardware starts numbering SPI IRQs from 32 when
reading the INTACK register.  The number which gets passed through into
asm_do_IRQ() will therefore be from 32 and above.

There's several reasons for this:
1. To avoid IRQ0, which is commonly used to indicate 'no interrupt' to
   drivers.
2. To avoid the ISA IRQ range 1-15 which are hard-coded into various
   drivers (and we want those to fail.)
3. It's wasteful and pointless to manipulate the IRQ number given that we
   have sparse irq support.

Also, bear in mind that gic_irq(SPI0) needs to return 32 to hit the
right registers - so you'd have to set gic->irq_start to -32 to make
SPI0 = IRQ0 work.

Finally, the valid range for irq_start is 16 to 32 + the Linux IRQ base
for the first GIC (SGI) interrupt.  We should probably make gic_init()
BUG() if its passed values less than 16.
