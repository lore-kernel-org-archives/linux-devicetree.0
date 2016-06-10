From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 3/4] mtd: nand: Add support for Evatronix NANDFLASH-CTRL
Date: Fri, 10 Jun 2016 17:34:26 +0200
Message-ID: <20160610173426.48960ad1@bbrezillon>
References: <alpine.DEB.2.02.1606020948070.19416@lnxricardw1.se.axis.com>
	<20160603165909.09f27ee0@bbrezillon>
	<alpine.DEB.2.02.1606071702220.19416@lnxricardw1.se.axis.com>
	<20160609110814.78823ef3@bbrezillon>
	<alpine.DEB.2.02.1606091313490.6751@lnxricardw1.se.axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.02.1606091313490.6751-0r+fHKsYbBpkgkEezDIDgepEb+yt5a1K@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ricard Wanderlof <ricard.wanderlof-VrBV9hrLPhE@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>, Linux mtd <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Benoit Cousson <bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 10 Jun 2016 16:40:39 +0200
Ricard Wanderlof <ricard.wanderlof-VrBV9hrLPhE@public.gmane.org> wrote:
> 
> > > > > +/* Information common to all chips, including the NANDFLASH-CTRL IP */
> > > > > +struct nfc_info {    
> > > > 
> > > > Should inherit from nand_hw_ctrl (see the sunxi_nand driver)...
> > > >     
> > > > > +	void __iomem *regbase;
> > > > > +	struct device *dev;
> > > > > +	struct nand_hw_control *controller;    
> > > > 
> > > > ... and not point to it.    
> > > 
> > > Ok. I'm a bit unsure what you mean by 'inherit' though; in the sunxi 
> > > driver the struct nand_hw_controller is contained within the struct 
> > > sunxi_nfc, in my case there's a pointer to a single instance of a 
> > > nand_hw_control. I agree that my approach is wasteful on a dynamic 
> > > allocation and I have no problems changing it, but conceptually there's 
> > > not much of a difference.  
> > 
> > There's a huge different. By embedding the nand_hw_control struct into
> > your nfc_info object you allow things like:
> > 
> > static int get_nfc(struct nand_chip *chip)
> > {
> > 	return container_of(chip->controller, struct nfc_info,
> > 			    controller);
> > }
> > 
> > This way you can retrieve the nfc_info object attached to the nand_chip.  
> 
> Yes, of course ... or rather,
> 
> static int get_nfc(struct nand_hw_control *controller)

Actually I meant

static inline struct nfc_info *get_nfc(struct nand_chip *chip) ...

> 
> I see new what you mean by inherit. It all comes down to if struct 
> nfc_info is a specialized type of struct nand_hw_control, or if it just 
> refers to it. I had assumed it was the latter that was the paradigm.
> 
> In the driver in question it makes no practical difference as there is no 
> need to go from a nand_hw_control to an nfc_info (in fact, the 
> nand_hw_control is nevery really used explicitly, it tags along, only used 
> by the framework).
> 
> Still, I'm not trying to make an argument here, just trying to understand 
> what the underlying paradigm is. I'll move it inside as it clearly is 
> better in several respects.

The goal here is to retrieve the controller attached to a given chip in
order to avoid the global nfc_info variable (and abusing
nand_get/set_controller_data() to store a pointer to the controller is
not a good idea either: it's supposed to be used to store per-chip
private data).

> 
> > > > > +
> > > > > +/* This is a global pointer, as we only support one single instance of the NFC.
> > > > > + * For multiple instances, we would need to add nfc_info as a parameter to
> > > > > + * several functions, as well as adding it as a member of the chip_info struct.
> > > > > + * Since most likely a system would only have one NFC instance, we don't
> > > > > + * go all the way implementing that feature now.
> > > > > + */
> > > > > +static struct nfc_info *nfc_info;    
> > > > 
> > > > Come on! Don't be so lazy, do the right thing.    
> > > 
> > > It's not a question of laziness, it was a conscious decision: why add 
> > > unnecessary bloat and complexity for a case that probably will never 
> > > occur? I can certainly change it if you think it's worth while of course.  
> > 
> > It is. And you're okay bloating the code with dead-code, but not with
> > implementing this in order to avoid singletons when it clearly
> > shouldn't be?  
> 
> I'm ok with bloating the code with something which I consider may be 
> useful, but I have reservations bloating it with something which I don't 
> think will ever be used (and which could be added if the need arises 
> later) and furthermore is not possible to test and verify properly (as 
> there is in fact only one NAND controller on the platform on which I can 
> test this).
> 
> But I'm fine with adding it, I'm not really trying to knock it, just 
> explaining why it wasn't done in the first place. (I think I'm actually 
> reacting to the word 'lazy' here...).

Then, let's say I really care about this clear separation between NAND
controllers and NAND chips (even if the controller is only supporting a
single device), because it makes things clearer, and because it brings
some consistency in the NAND controller drivers.
That's something I've asked to other contributors, and I'm asking it to
you too.

You'll see that implementing this separation is not much more
complicated than having this global variable, and I must admit global
variable make me scream (especially when they can be avoided).

> 
> > > > > +
> > > > > +/* The timing setup is expected to come via DT. We keep some default timings
> > > > > + * here for reference, based on a 100 MHz reference clock.
> > > > > + */
> > > > > +
> > > > > +static const struct nfc_timings default_mode0_pll_enabled = {
> > > > > +	0x0d151533, 0x000b0515, 0x00000046,
> > > > > +	0x00150000, 0x00000000, 0x00000005, 0x00000015 };    
> > > > 
> > > > Can you explain those magic values?    
> > > 
> > > Not really, the problem is that the agreement we have with the IP vendor 
> > > is that we may not disclose any documentation, outside of what is 
> > > absolutely necessary to write working code.
> > > 
> > > A rationale is that anyone else wanting to use the driver will either be 
> > > designing their own SoC in which case they will have access to the 
> > > relevant documentation, or if they're using a SoC from someone else, the 
> > > SoC vendor will have to provide that information in order for the chip to 
> > > be useful anyway.  
> > 
> > Hm, so I'll have a new table like that for each new SoC using this IP?  
> 
> Yes, I would say that would be the case.
> 
> > I must say I don't like the idea, but let's address the other aspects
> > first.  
> 
> Ok.
> 
> > As said above, I'm planning to rework the NAND framework to
> > support things like:
> > 
> > struct nand_operation {
> > 	u8 cmds[2];
> > 	u8 addrs[5];
> > 	int ncmds;
> > 	int naddrs;
> > 	union {
> > 		void *out;
> > 		const void *in;
> > 	};
> > 	enum nand_op_direction dir;
> > }
> >   
> > ->exec_op(struct nand_operation *op);  
> > 
> > This way the NAND controller would have all the necessary information
> > to trigger the whole operation (omitted the ECC info on purpose, to
> > make it clearer).
> > 
> > But this is not there yet, and in the meantime, if possible, I'd prefer
> > seeing drivers implementing the ->cmd_ctrl() function instead of
> > overloading the default ->cmdfunc() implementation.  
> 
> I see, I suppose that's because during the course of this the ->cmdfunc() 
> logic will be significantly changed, requiring corresponding changes in 
> drivers that do overload that function? Fair enough, that's a pretty good 
> reason, probably more so than the alleged simplicity of the ->cmd_ctrl() 
> interface.

There's another reason actually. We have chip specific functions (like
->setup_read_retry()) which might want to use
non-standard/vendor-specific operations, and this implies patching all
->cmdfunc() implementations, or at least making sure they will work
fine with these new commands.
The ->cmd_ctrl() + generic nand_command_lp() for ->cmdfunc() is making
that a lot easier.

So yes, I'm clearly trying to avoid specific ->cmdfunc() (especially
when they are not generic enough to support new commands).

Again, ->cmd_ctrl() does not have to be used in your internal
ecc->read/write_page() implementations (all you'll have to do is avoid
using the ->cmdfunc() method and create your own NAND controller
specific commands instead), but it should at least be used for basic
operations that do not require high performances (i.e. NAND detection,
NAND RESET, read-retry, ...).

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
