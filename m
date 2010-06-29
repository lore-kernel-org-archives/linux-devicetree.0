From: Andres Salomon <dilinger@queued.net>
Subject: Re: [PATCH 2/4] sparc: break out some prom device-tree building
 code  out into drivers/of
Date: Tue, 29 Jun 2010 19:36:18 -0400
Message-ID: <20100629193618.5a840b8e@dev.queued.net>
References: <20100628215407.2017bf2f@debian>
	<20100628220037.5744c207@debian>
	<AANLkTilN3_ntG7AWKi-8LM9X_dZJPPlWM6xRM_V_00xU@mail.gmail.com>
	<20100629110324.2756cc02@debian>
	<AANLkTinPsrqxj5oQirEDRvVOuOeWgWSdljsMRbw8wn8V@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <sparclinux-owner@vger.kernel.org>
In-Reply-To: <AANLkTinPsrqxj5oQirEDRvVOuOeWgWSdljsMRbw8wn8V@mail.gmail.com>
Sender: sparclinux-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: devicetree-discuss@lists.ozlabs.org, sparclinux@vger.kernel.org, x86@kernel.org, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, cjb@laptop.org, Mitch Bradley <wmb@laptop.org>, pgf@laptop.org, linux-kernel@vger.kernel.org, davem@davemloft.net, Benjamin Herrenschmidt <benh@kernel.crashing.org>
List-Id: devicetree@vger.kernel.org

On Tue, 29 Jun 2010 15:42:54 -0600
Grant Likely <grant.likely@secretlab.ca> wrote:

> On Tue, Jun 29, 2010 at 9:03 AM, Andres Salomon <dilinger@queued.net>
> wrote:
[...]
> 
> >  Sparc and OLPC have very similar
> > mechanisms for getting device tree info from OFW, so it makes sense
> > to share code between them.
> 
> Other than the flattened tree step; is the powerpc method dissimilar
> from the Sparc and OLPC method for talking to OFW?  (This is not a
> rhetorical question, I'm want to know if I'm missing some details).
> The main difference I know about is that OFW can still kept alive at
> runtime for sparc, which powerpc does not do.  However, keeping OFW
> callable is a separate issue from how to extract the device tree.
> 

After having a look at powerpc's flatten_device_tree, I don't see any
obvious reason why OLPC couldn't use this (though it still strikes me
as weird to go from prom->fdt->dt when the option of prom->dt is
available and less complex). Do you already have the patches that put
this into drivers/of/?
