From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: address translation for PCIe-to-localbus bridge
Date: Tue, 12 Nov 2013 09:16:08 +0100
Message-ID: <20131112091608.161f1347@skate>
References: <527A1983.6020603@keymile.com>
	<20131106173649.GA25515@obsidianresearch.com>
	<20131106190308.01f7a4a9@skate>
	<20131106182457.GA25879@obsidianresearch.com>
	<20131111155050.96290C41ABB@trevor.secretlab.ca>
	<20131112080512.3992b2e4@skate>
	<5281E2B5.3080701@keymile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5281E2B5.3080701-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gerlando Falauto <gerlando.falauto-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory Cl??ment <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dear Gerlando Falauto,

On Tue, 12 Nov 2013 09:11:33 +0100, Gerlando Falauto wrote:

> > Hum, right, but unless I'm wrong the of_busses[] array of struct of_bus
> > is fixed in drivers/of/address.c, and as it is, there is no way for a
> > specific bus driver to provide its own struct of_bus.
> 
> That was exactly my understanding as well, and that's where I was 
> expecting some trickery to happen.
> 
> > So that would need to be extended, right?
> 
> The other approach I was foreseeing was to implement a way of 
> dynamically updating the DT when the PCI subsystem enumerates the 
> devices and assigns memory areas (namely, I would expect the ranges 
> property to reflect that). But this would imply a standard way of 
> defining the ranges property (I would expect something like <bar# 
> start_addr length>, with an arguable number of cells). And I could
> not find any such definition in the PCI bus binding document, so I'm 
> probably completely off-track here. Aren't I?
> 
> After all, we should expect a driver to behave (and expect) the same of 
> the DT, regardless of whether enumeration was performed by firmware or
> by the OS itself. Or am I wrong on this too?

Well, in the context of the mvebu platforms (including Kirkwood), the
problem is not so much the ranges in the pcie-controller node, but the
ranges in the main soc { ... } node which encloses the description of
the MBus. It is those ranges that need to be updated when a new window
is created, or a window is removed. So the problem is not PCI related,
but MBus related in this case, no?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
