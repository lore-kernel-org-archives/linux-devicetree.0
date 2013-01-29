From: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/5] dmaengine: dw_dmac: move to generic DMA binding
Date: Tue, 29 Jan 2013 20:47:13 +0530
Message-ID: <CAKohpoms+WC_XJnH2b6uoycRKkF-yxZUg2J+8NrYJP8fnDNLtg@mail.gmail.com>
References: <1359395857-1235-1-git-send-email-arnd@arndb.de>
 <201301291035.30265.arnd@arndb.de>
 <CAKohpo=rD9=dEaPkKYcj55K4_ebdnU7qjv2TZBUwqHAB+Kk+aw@mail.gmail.com>
 <201301291331.48427.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201301291331.48427.arnd-r2nGTMty4D4@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Vinod Koul <vinod.koul-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, spear-devel <spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org>, Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 29 January 2013 19:01, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> Ah, good. So I guess the "dma-requests" property should actually
> be "16" then.

yes, even i was checking on that separately :)

> Does this mean that an implicit zero request line means memory?

No. 0 is also request line for a peripheral and numbers are from 0 to 15.
memcpy are identified by setting type of transfer as memcpy.

> Could we have device-to-device DMAs with this controller, and if
> we can, should we have both 'src' and 'dst' fields? Are the
> two number ranges sharing the same address space, i.e. is
> request '7' as the destination guaranteed to be the same device
> as request '7' in the source?

Request lines are per master... So, for a master single request line
is independent of direction. Many DMA controllers have capability of
doing dev-to-dev transfers but DMAENGINE doesn't have any support
for it, even we don't have a usecase too :)

> If we need two lines, we could interleave them with the bus
> master numbers:

not required.

> In theory, we could use bit-stuffing to put them all into
> a single 32 bit word I guess, but generally people don't
> seem to like that for new bindings.

:)

--
viresh
