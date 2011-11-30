From: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 4/5] ARM: vexpress: Initial RS1 memory map support
Date: Wed, 30 Nov 2011 16:38:26 -0500 (EST)
Message-ID: <alpine.LFD.2.02.1111301604230.2357@xanadu.home>
References: <1322579473-8804-1-git-send-email-pawel.moll@arm.com>
 <1322579473-8804-5-git-send-email-pawel.moll@arm.com>
 <20111130153749.GE2045@localhost.localdomain>
 <1322673302.3180.25.camel@hornet.cambridge.arm.com>
 <20111130175410.GJ2045@localhost.localdomain>
 <alpine.LFD.2.02.1111301522340.2357@xanadu.home>
 <20111130204805.GA5698@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20111130204805.GA5698-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Tixy <tixy-V7l+QrSAdiO1Qrn1Bg8BZw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 30 Nov 2011, Mark Brown wrote:

> On Wed, Nov 30, 2011 at 03:43:50PM -0500, Nicolas Pitre wrote:
> 
> > annoying.  If nothing moves I might just go ahead with those changes and 
> > simply rip the uImage make target out of the kernel as well.  Maybe the 
> > inconvenience will be a sufficient incentive for people to lobby proper 
> > u-Boot support.  And it is not like if the u-Boot patches didn't exist 
> 
> Oh, dear.  Any pointers to the discussions on the u-boot side?

Certainly.  Many different threads actually.  Here's a few:

http://news.gmane.org/group/gmane.comp.boot-loaders.u-boot/thread=114981

http://news.gmane.org/group/gmane.comp.boot-loaders.u-boot/thread=115774

And this is not the first time this issue has come up:

http://news.gmane.org/group/gmane.comp.boot-loaders.u-boot/thread=83824

http://news.gmane.org/group/gmane.linux.ports.arm.kernel/thread=81546/force_load=t/focus=84138

Yet more u-Boot woes:

http://news.gmane.org/group/gmane.linux.ports.arm.kernel/thread=53973

I'm sure there are others, but that's what I've quickly dug out.


Nicolas
