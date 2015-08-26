From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v10 3/5] mtd: nand: vf610_nfc: add device tree bindings
Date: Wed, 26 Aug 2015 17:39:03 +0200
Message-ID: <20150826173903.25479201@bbrezillon>
References: <1438594050-4595-1-git-send-email-stefan@agner.ch>
	<1438594050-4595-4-git-send-email-stefan@agner.ch>
	<20150825202546.GL81844@google.com>
	<BLU436-SMTP1971442F63D96D55AC8E905B8600@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <BLU436-SMTP1971442F63D96D55AC8E905B8600-MsuGFMq8XAE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bill Pringlemeir <bpringle-rieW9WUcm8FFJ04o6PK0Fg@public.gmane.org>
Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, sebastian-E0PNVn5OA6ohrxcnuTQ+TQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, marb-Z4QKGCRq86k@public.gmane.org, aaron-yuhzfaV+M/Wz3Dx2OeFgIA@public.gmane.org, bpringlemeir-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, albert.aribaud-iEu9NFBzPZE@public.gmane.org, klimov.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Bill Pringlemeir <bpringlemeir-ygJ1pmMJ17cAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Bill,

On Wed, 26 Aug 2015 11:26:36 -0400
Bill Pringlemeir <bpringle-rieW9WUcm8FFJ04o6PK0Fg@public.gmane.org> wrote:

> On 25 Aug 2015, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> 
> > Sorry, I realized a potential issue here.
> 
> > On Mon, Aug 03, 2015 at 11:27:28AM +0200, Stefan Agner wrote:
> >> Signed-off-by: Bill Pringlemeir <bpringlemeir-ygJ1pmMJ17cAvxtiuMwx3w@public.gmane.org>
> >> Acked-by: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >> Reviewed-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> >> ---
> >> .../devicetree/bindings/mtd/vf610-nfc.txt | 45 ++++++++++++++++++++++
> >> 1 file changed, 45 insertions(+) create mode 100644
> >> Documentation/devicetree/bindings/mtd/vf610-nfc.txt
> 
> >> diff --git a/Documentation/devicetree/bindings/mtd/vf610-nfc.txt
> >> b/Documentation/devicetree/bindings/mtd/vf610-nfc.txt
> >> new file mode 100644
> >> index 0000000..cae5f25
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/mtd/vf610-nfc.txt
> >>>> -0,0 +1,45 @@
> >> +- nand-bus-width: see nand.txt
> >> +- nand-ecc-mode: see nand.txt
> >> +- nand-on-flash-bbt: see nand.txt
> 
> > Stumbling across the "multi-CS" questions on the driver reminds me: it
> > typically makes sense to define new NAND bindings using separate NAND
> > *controller* and *flash* device nodes. The above 3 properties, at
> > least, would apply on a per-flash basis, not per-controller
> > typically. See sunxi-nand, for instance:
> 
> > http://lxr.free-electrons.com/source/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
> 
> > brcmnand had a similar pattern:
> 
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
> 
> > (Perhaps it's time we standardized this a little more formally...)
> 
> These would apply per chip, but the controller has to be configured to
> support each and every one.  Every time an operation was performed, we
> would have to check the chip type and reconfigure the controller.
> Currently, the driver does not support this and it would add a lot of
> overhead in some cases unless a register cache was used.
> 
> Is the flexibility of using a system with combined 8/16bit devices
> really worth all the overhead?  Isn't it sort of brain dead hardware not
> to make all of the chips similar?  Why would everyone have to pay for
> such a crazy setup?
> 
> To separate it would at least be a lie versus the code in the current
> form.  As well, there are only a few SOC which support multiple chip
> selects.  The 'multi-CS' register bits of this controller varies between
> PowerPC, 68K/Coldfire and ARM platforms.
> 
> I looked briefly at the brcmnand.c  and it seems that it is not
> supporting different ECC per chip even though the nodes are broken out
> this way.  In fact, if some raw functions are called, I think it will
> put it in ECC mode even if it wasn't before?  Well, I agree that this
> would be good generically, I think it puts a lot of effort in the
> drivers for not so much payoff?

Hm, the sunxi driver supports it, and it does not add such a big
overhead...
The only thing you have to do is cache a bunch of register values
per-chip and restore/apply them when the chip is selected
(in your ->select_chip() implementation).

Anyway, even if the suggested DT representation is a lie in regards to
your implementation, it's actually pretty accurate from an hardware
POV, and this is exactly what DT is supposed to represent.

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
