From: Andres Salomon <dilinger@queued.net>
Subject: Re: [PATCH 2/4] sparc: break out some prom device-tree building
 code out into drivers/of
Date: Tue, 6 Jul 2010 03:25:08 +0000 (UTC)
Message-ID: <20100707051548.2c44f30c__22846.2220672101$1278386708$gmane$org@debxo>
References: <20100629193618.5a840b8e@dev.queued.net>
	<AANLkTilme2uAoXjorUEzam9j_xosR8kl70W8PS71d-Th@mail.gmail.com>
	<20100707040734.05d625af@debxo>
	<20100705.192221.241453945.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <sparclinux-owner@vger.kernel.org>
Date: Wed, 7 Jul 2010 05:15:48 +0000
In-Reply-To: <20100705.192221.241453945.davem@davemloft.net>
Sender: sparclinux-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: grant.likely@secretlab.ca, devicetree-discuss@lists.ozlabs.org, sparclinux@vger.kernel.org, x86@kernel.org, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, cjb@laptop.org, wmb@laptop.org, pgf@laptop.org, linux-kernel@vger.kernel.org, benh@kernel.crashing.org
List-Id: devicetree@vger.kernel.org

On Mon, 05 Jul 2010 19:22:21 -0700 (PDT)
David Miller <davem@davemloft.net> wrote:

> From: Andres Salomon <dilinger@queued.net>
> Date: Wed, 7 Jul 2010 04:07:34 +0000
> 
> >  - For the pdt, calling into the prom once for each property/node to
> >    create a fdt, and then unflattening it.  This is better than the
> >    previous option, but I don't think the prom->fdt code will be
> > very nice.
> 
> I'll need this on sparc64 at some point to support kexec() anyways.
> 
> So at least for sparc you can assume that a something-->fdt translator
> is going to exist at some point in the future regardless of what
> happens here.
> 


Sounds like we have a winner.  I'll concentrate on that, thanks for
the heads up.
