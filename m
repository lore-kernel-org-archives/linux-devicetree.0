From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] video: simplefb: add mode parsing function
Date: Thu, 23 May 2013 13:21:27 -0600
Message-ID: <519E6C37.2010706@wwwdotorg.org>
References: <1369296231-26597-1-git-send-email-acourbot@nvidia.com>
 <519E438A.9030408@wwwdotorg.org>
 <CAMuHMdVs4hy7dWAGxN51XP3YuWBY6rk22Z6tCU+-HujZH4jL2Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAMuHMdVs4hy7dWAGxN51XP3YuWBY6rk22Z6tCU+-HujZH4jL2Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Linux Fbdev development list <linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 05/23/2013 10:57 AM, Geert Uytterhoeven wrote:
> On Thu, May 23, 2013 at 6:27 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>>> +
>>> +             cpt += field->length;
>>> +     }
>>> +
>>> +     format->bits_per_pixel = ((cpt + 7) / 8) * 8;
>>
>> Should this error-check that isn't > 32?
> 
> So pixels can't be larger than 32 bits?
> IIRC, some SGI and Sun graphics cards had e.g. 80 bit pixels (incl. Z buffer).

That's a good point.

Out of curiosity, how does the FB core treat these format definitions?
Are they expected to fit into a 16-/32-/64-/128- bit power-of-two
bit-size, or are they treated as a string of bytes that get serialized
into memory LSB first (or perhaps MSB first on BE systems?)

The difference would be that from a CPU perspective only, if you pack
the RGB components into a u32, then write that to RAM as a u32, then the
in-memory byte-by-byte order is different on different endian systems,
whereas if the FB core treats it as a series of bytes only, then
presumably the in-memory byte-by-byte order is identical irrespective of
host CPU endianness.
