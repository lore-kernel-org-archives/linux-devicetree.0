From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 4/9] of: mtd: add documentation for the
 ONFI NAND timing mode property
Date: Wed, 9 Jul 2014 10:46:03 -0700
Message-ID: <20140709174603.GJ7537@ld-irv-0074>
References: <1394647664-8258-1-git-send-email-b.brezillon.dev@gmail.com>
 <1394647664-8258-5-git-send-email-b.brezillon.dev@gmail.com>
 <20140520182542.GS28907@ld-irv-0074>
 <537BAD59.3060902@free-electrons.com>
 <20140520195240.GW28907@ld-irv-0074>
 <537BC9D4.6070200@free-electrons.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBCZ6PSPVXMNBBY776WOQKGQEHLGLNXY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <537BC9D4.6070200-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
To: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Boris,

Looking back at this thread, there's at least one or two things I forgot
to answer. Sorry.

On Tue, May 20, 2014 at 11:32:04PM +0200, Boris BREZILLON wrote:
> On 20/05/2014 21:52, Brian Norris wrote:
[...]
> If the ECC bindings don't encode the "minimum required ECC strength" but
> rather the "ECC config on a specific board" then I guess "minimum
> required ECC strength" for non-ONFI chips should be defined somewhere
> else (stored in the device ID table ?).

They are. See nand_flash_dev::ecc, which holds fields for
ecc_strength_ds and step_ds. If we have to, we can add a "timing mode"
field to this struct.

> > So you're saying that even though the chip actually specifies a single
> > set of timings, you would describe this as a bitmask of several
> > supported ONFI timing modes, up to the "max performance"?
> >
> > Is there ever a case where (for instance) a non-ONFI flash supports the
> > equivalent of timing mode 3, but it does not support mode 2 or 1?
> 
> I don't think so.

OK, then I don't think the mask approach is necessary, if we do ever
settle on using a DT binding here. (I hope we can avoid this.)

> >> But I can modify the bindings to just encode the maximum supported
> >> timing mode.
> > AIUI, the non-ONFI datasheets really only specify a single timing mode,
> > so I think we should only specify the "max." And as a bonus, this
> > actually makes the binding easier to use. A driver does not care about
> > how many different modes are supported; it only needs to know what the
> > max is.
> 
> Agreed, actually my first binding was defining it this way.

Was there a good reason for changing it?

Thanks,
Brian
