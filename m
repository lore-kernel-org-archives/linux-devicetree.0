From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [PATCH 1/4] OF: Add helper for matching against
 linux,stdout-path
Date: Thu, 22 Nov 2012 20:35:21 +0100
Message-ID: <20121122193521.GA4398@game.jcrosoft.org>
References: <20121121155312.GX4398@game.jcrosoft.org>
 <1353513428-25697-1-git-send-email-plagnioj@jcrosoft.com>
 <CACxGe6tyPpjx4OtjHmhB9Cvnb7OwAjPEE4=K+wgWKYHcAV-ESQ@mail.gmail.com>
 <20121122054138.GY4398@game.jcrosoft.org>
 <20121122153152.2B9CB3E129E@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-serial-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20121122153152.2B9CB3E129E@localhost>
Sender: linux-serial-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, Sascha Hauer <s.hauer@pengutronix.de>, "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sascha Hauer <kernel@pengutronix.de>, Alan Cox <alan@linux.intel.com>, Nicolas Ferre <nicolas.ferre@atmel.com>
List-Id: devicetree@vger.kernel.org

On 15:31 Thu 22 Nov     , Grant Likely wrote:
> On Thu, 22 Nov 2012 06:41:38 +0100, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com> wrote:
> > On 18:03 Wed 21 Nov     , Grant Likely wrote:
> > > On Wed, Nov 21, 2012 at 3:57 PM, Jean-Christophe PLAGNIOL-VILLARD
> > > <plagnioj@jcrosoft.com> wrote:
> > > > From: Sascha Hauer <s.hauer@pengutronix.de>
> > > >
> > > > devicetrees may have a linux,stdout-path or stdout-path property
> > > > in the chosen node describing the console device. This adds a helper
> > > > function to match a device against this property and retrieve the options
> > > > so a driver can call add_preferred_console for a matching device.
> > > 
> > > NIce. Looks like the right behaviour, but is a little inefficient.
> > > Since the stdout property doesn't change this code could be called
> > > once right after the tree is unflattened and then cache the pointer to
> > > the node anarguments. Can you add the code to of_alias_scan()?
> > do we assume that we can have only one stdout-path?
> > 
> > I think we could have more serial, framebuffer console
> 
> Nope. stdout-path as currently defined is only one device. Someone would
> need to propose an extension for multiple stdout's before I'd bother
> trying to support that.
ok for this version I do not put it but I need it

I want to have 2 console uart and framebuffer

Personnaly I'd just allow multiple instance of stdout-path

what do you prefer

Best Regards,
J.
