From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] Axi-usb: Add support for 64-bit addressing.
Date: Tue, 19 Apr 2016 16:07:06 +0200
Message-ID: <11193586.PGqlzvJDML@wuerfel>
References: <1460360506-14692-1-git-send-email-navam@xilinx.com> <4449845.qT8BZnpD4R@wuerfel> <C89496FEAE474D468F30D558A9468D9F26CD3753@XAP-PVEXMBX01.xlnx.xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <C89496FEAE474D468F30D558A9468D9F26CD3753-4lKfpRxZ5enZMOc0yg5rMog+Gb3gawCHQz34XiSyOiE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nava kishore Manne <nava.manne-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hyun Kwon <hyunk-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Radhey Shyam Pandey <radheys-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Michal Simek <michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Soren Brinkmann <sorenb-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 19 April 2016 09:15:01 Nava kishore Manne wrote:
> > -----Original Message-----
> > From: Arnd Bergmann [mailto:arnd-r2nGTMty4D4@public.gmane.org]
> > Sent: Monday, April 18, 2016 8:05 PM
> > To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; Nava kishore Manne
> > <navam-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>; mark.rutland-5wv7dgnIgG8@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> > Nava kishore Manne <navam-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>; Hyun Kwon
> > <hyunk-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>; pawel.moll-5wv7dgnIgG8@public.gmane.org; ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org;
> > gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org; Radhey Shyam Pandey <radheys-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>;
> > Michal Simek <michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>; balbi-l0cyMroinI0@public.gmane.org; linux-
> > kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org; Soren Brinkmann
> > <sorenb-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> > Subject: Re: [PATCH] Axi-usb: Add support for 64-bit addressing.
> >
> > On Monday 18 April 2016 09:29:09 Rob Herring wrote:
> > >
> > > Right, you don't need to know the exact bus width for determining the
> > > register/descriptor set is 32 or 64 bit addesses. I'm fine with a
> > > property for that, but if limiting the actual connected address bits
> > > is needed, then dma-ranges should be used.
> >
> > The other way round: dma-ranges is needed to allow 64-bit addressing, the
> > default is to only allow 32-bit addressing (and arm64 has a known bug here, it
> > just allows it anyway when it shouldn't).
> 
> AXI-USB IP configurable for 32-bit or 64-bit addressing.
> 
> In any of the configuration I mean if it is a 32-bit or 64-bit addressing there is a flexibility for the dma to choose the
> Memory range supported by the AXI-USB...
> 
> For example if AXI-USB (dma ) is configured for 40-bit addressing.

You seem to contradict yourself here, saying that it can be either
32-bit or 64-bit, but then you say it is configured for 40-bit mode.

Can you be more specific of which configurations are possible in the
AXI-USB hardware block? Does it have three modes (32, 40, 64) or just
two modes where it always truncates the 64-bit register values
to 40 bits before sending a transaction out on the AXI master port?


> Theoretically it can access memory up to 1TB if it is true we can get the
> Address width using log2 of the dma-ranges size as you mentioned above.
> 
> But in real use case user won't map the entire memory
> He will map only the memory of his own choice...
> 
> For example user mapped 2GB then dma-ranges property will be like below.
> 
> dma-ranges = <0x00000000 0x00000000  0x80000000>;

Again, that is not how dma-ranges works. The dma-ranges should list how
the bus address space translates into the CPU address space, and that
is completely independent of how much memory is installed. Unfortunately
this was designed back when we had hierarchical buses, whereas nowadays
we use point-to-point connections. We can normally work around that
by translating each AXI link in the SoC design into a single line
in the dma-ranges property, except when two devices on the same logical
bus (which doesn't exist on AXI) have AXI master ports connecting to
different places using the same address.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
