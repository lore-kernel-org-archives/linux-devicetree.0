From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] uio/pdrv_genirq: Add OF support
Date: Thu, 31 Mar 2011 15:25:52 +0200
Message-ID: <201103311525.52396.arnd@arndb.de>
References: <1301574600-4861-1-git-send-email-monstr@monstr.eu>
	<20110331124925.GA2202@pengutronix.de>
	<AANLkTinJrG=s3Xuvf_=bNtYF-z8u+YXvd217UKKz24ik@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <AANLkTinJrG=s3Xuvf_=bNtYF-z8u+YXvd217UKKz24ik-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
Cc: gregkh-l3A5Bk7waGM@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, hjk-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 31 March 2011, John Williams wrote:
> On Thu, Mar 31, 2011 at 10:49 PM, Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> >
> > On Thu, Mar 31, 2011 at 02:30:00PM +0200, Michal Simek wrote:
> > > Support OF support. "generic-uio" compatible property is used.
> >
> > And exactly this was the issue last time (when I tried). This is a
> > generic property, which is linux-specific and not describing HW. The
> > agreement back then was to we probably need to add compatible-entries at
> > runtime (something like new_id for USB). So the uio-of-driver could be
> > matched against any device. Otherwise, we would collect a lot of
> > potential entries like "vendor,special-card1". Although I wonder
> > meanwhile if it is really going to be that bad; we don't have so much
> > UIO-driver in tree as well. Maybe worth a try?
> 
> 
> Maybe I misunderstand you, in my view it is the responsibility of
> <vendor> to create their DTS files to indicate they want
> <special-card1> to bind to generic-uio.
> 
> So, no great list of compat strings should grow in the driver, but
> rather the user of the driver must make it happen.
> 
> Am I missing something?

We try to make the device tree on describe the present hardware,
but not relate to how it is used.

There are certainly cases where a specific piece of hardware can
be used either by a kernel-only driver or the UIO driver with a
user backend. I would argue that you should be able to use an
identical device tree for both cases, because the hardware is
the same. Chosing which driver to use can be either in the realm
of the kernel, or even user policy.

	Arnd
