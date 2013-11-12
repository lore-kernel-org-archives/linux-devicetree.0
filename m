From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: address translation for PCIe-to-localbus bridge
Date: Tue, 12 Nov 2013 17:51:17 +0900
Message-ID: <20131112085118.8603DC421BB@trevor.secretlab.ca>
References: <527A1983.6020603@keymile.com> <20131106173649.GA25515@obsidianresearch.com> <20131106190308.01f7a4a9@skate> <20131106182457.GA25879@obsidianresearch.com> <20131111155050.96290C41ABB@trevor.secretlab.ca> <20131112080512.3992b2e4@skate>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131112080512.3992b2e4@skate>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gerlando Falauto <gerlando.falauto-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory Cl??ment <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 12 Nov 2013 08:05:12 +0100, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> Dear Grant Likely,
> 
> On Mon, 11 Nov 2013 15:50:50 +0000, Grant Likely wrote:
> 
> > > So the mbus would register an address xlate for its node that is
> > > called instead of ranges parsing. For the example in my last message
> > > the FPGA driver would register an xlate that made addresses relative
> > > to its own BAR0 address.
> > 
> > There are already bus-specific transations available. Take a look at
> > struct of_bus in drivers/of/address.c
> 
> Hum, right, but unless I'm wrong the of_busses[] array of struct of_bus
> is fixed in drivers/of/address.c, and as it is, there is no way for a
> specific bus driver to provide its own struct of_bus. So that would
> need to be extended, right?

Yes... or embed what you need in drivers/of/address.c for the time
being.

g.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
