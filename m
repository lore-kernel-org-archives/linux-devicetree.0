From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: add all hi6220 uart nodes
Date: Fri, 2 Oct 2015 19:00:58 +0100
Message-ID: <20151002180058.GA4220@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1443558552-5734-1-git-send-email-tyler.baker@linaro.org>
 <1459065.BtzC7pyUYF@wuerfel>
 <20150930173145.GG15635@sirena.org.uk>
 <CANMBJr7yY1PJChnFSRknqfOLORuWZSEONV+e=M=9heX3i-ADKA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CANMBJr7yY1PJChnFSRknqfOLORuWZSEONV+e=M=9heX3i-ADKA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Kevin's boot bot <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Tyler,

On Wed, 30 Sep 2015, Tyler Baker wrote:

> On 30 September 2015 at 10:31, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> > On Wed, Sep 30, 2015 at 10:24:56AM +0200, Arnd Bergmann wrote:
> >> On Tuesday 29 September 2015 13:29:12 Tyler Baker wrote:
> >
> >> >         aliases {
> >> >                 serial0 = &uart0;
> >> > +               serial1 = &uart1;
> >> > +               serial2 = &uart2;
> >> > +               serial3 = &uart3;
> >> > +               serial4 = &uart4;
> >> >         };
> >
> >> In the changelog you mention "both uarts", but here you have five of them.
> >> Are they all accessible on the connector? If not, only provide aliases
> >> for the ones that are, using numbering that makes most sense for given
> >> how one would use the board.
> 
> Thanks for the comment Arnd. Mark's comment below is correct, there
> are only two UARTs accessible on the LS connection in addition to the
> one on the board (solder pad).
> 
> Is the following definition any clearer?
> 
> serial0 = &uart0; // Onboard UART0
> serial1 = &uart2; // LS expansion UART0
> serial2 = &uart3; // LS expansion UART1
> 
> If so, I'll respin this patch.
> 
> > Unless I'm missing something there's only two UARTs brought out on the
> > low speed expansion connector (in addition to the one on the solder pads
> > which is currently supported).  We should also adjust the console
> > default to match whatever one of the low speed expansion connector UARTs
> > is being used by the bootloader.
> 
> Your not missing anything, I should not have added the additional
> aliases, it is confusing, will remove. The UART boards by default come
> configured to use UART1 on the LS connector.
> 
> + Peter as he has been submitting u-boot patches recently for the HiKey.

Thanks :)

> 
> Obviously, both UEFI and u-boot can be configured to use either UART,
> and at the moment u-boot defaults to using the on board UART. Whereas
> UEFI is using UART1 on the LS connector. I'm fine with switching the
> console default to use the UART1 on the LS connector as long as there
> is agreement to do so.

Eek... "serial2 = uart3 //UART1"

I sent the following patch
http://lists.denx.de/pipermail/u-boot/2015-September/227465.html

which has been accepted which switches from using UART0 (onboard) to
UART3 (LS connector). This matched up with the change made in ATF i.e. both ATF
and u-boot were then both outputting on the same UART.

So u-boot has already been migrated over.

regards,

Peter.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
