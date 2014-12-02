From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 05/11] memory: add Atmel EBI (External Bus Interface) driver
Date: Tue, 02 Dec 2014 10:41:57 +0100
Message-ID: <3316464.yrAZ5QMKbg@wuerfel>
References: <1417429647-3419-1-git-send-email-boris.brezillon@free-electrons.com> <2417519.MDE3mu6n7n@wuerfel> <1724175.Jqk8gQW3pz@ws-stein>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1724175.Jqk8gQW3pz@ws-stein>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Stein <alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org>
Cc: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jean-Jacques Hiblot <jjhiblot-dLKeG7h1OhBDOHtkgc7UlQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 02 December 2014 10:18:45 Alexander Stein wrote:
> On Monday 01 December 2014 17:17:30, Arnd Bergmann wrote:
> > On Monday 01 December 2014 11:50:06 Boris Brezillon wrote:
> > > 
> > > I don't have a strong opinion regarding where this driver should
> > > live (I even considered putting it in drivers/bus) :-).
> > > But note that there are other "external memory interface" drivers
> > > in drivers/memory too: TI AEMIF and Marvell DEVBUS  ;-).
> > > 
> > > Does anyone else think this driver should go in drivers/bus ?
> > > 
> > 
> > I think drivers/memory is better.
> 
> I don't mind if it's drivers/bus or drivers/memory. But I'm 
> wondering: When is a driver a bus driver when it is a memory
> driver? See imx-weim and atmel-ebi. Apparently both add support
> for devices attached on a bus which can be accessed through memory
> addresses.

I think drivers/memory should be used for external buses with an
SRAM or DRAM interface that need to configure the timings.

drivers/bus is more a collection for random other buses, usually
internal to a chip, but it's less well-defined.

	Arnd

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
