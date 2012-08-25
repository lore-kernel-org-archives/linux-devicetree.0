From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH V5] mtd: m25p80: Make fast read configurable via DT
Date: Sat, 25 Aug 2012 22:40:54 +0200
Message-ID: <201208252240.54932.marex@denx.de>
References: <1345923416-9293-1-git-send-email-marex@denx.de>
 <CAJiQ=7BAH_87jrDCG=Jbw7ezsezFWrBv+eUkoH5jGmeV9tQiYQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAJiQ=7BAH_87jrDCG=Jbw7ezsezFWrBv+eUkoH5jGmeV9tQiYQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Woodhouse <david.woodhouse-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Artem Bityutskiy <artem.bityutskiy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dear Kevin Cernekee,

> On Sat, Aug 25, 2012 at 12:36 PM, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org> wrote:
> > Add DT property "m25p,fast-read" that signalises the particular
> > chip supports "fast read" opcode.
> 
> This might be slightly clearer if it is rephrased as:
> 
> Add DT property "m25p,fast-read" that signifies whether the "fast
> read" opcode is supported.

What's the difference?

> > +Optional properties:
> > +- m25p,fast-read : Use the "fast read" opcode to read data from the chip
> > instead +                   of the usual "read" opcode. This opcode isn
> > not supported by +                   all chips and support for it can
> > not be detected at runtime.
> 
> "is not supported"

Thanks

> Are there any modern SPI flash parts that can't handle FAST_READ, or
> is this mostly for compatibility with legacy systems?

We have to support all possibilities, not only "modern systems" .

> > +       bool                    fast_read;
> > 
> > -       t[0].len = m25p_cmdsz(flash) + FAST_READ_DUMMY_BYTE;
> > +       t[0].len = m25p_cmdsz(flash) + (flash->fast_read ? 1 : 0);
> 
> Newer devices support a variable number of dummy cycles; increasing
> the number of dummy cycles can allow for higher interface speeds.  One
> example is the Macronix MX25L25635F:
> 
> http://bit.ly/P9s7UM

Good, but I don't see it supported in the driver, how is this different from 
MX25L256E?

Besides, I noticed the fast-read isn't even properly excersized, as it always 
reads blocks of 512 bytes, even if it can read any basically length. Why is 
that, MTD layer stuff or something?

> It might be worth thinking about how to capture this sort of
> information in the DT properties, even if current versions of m25p80
> only use a small subset of the device capabilities.

They can be added as additional DT props, that should be easy.

Best regards,
Marek Vasut
