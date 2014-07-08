From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] bug fix for devicetree memory parsing
Date: Tue, 8 Jul 2014 10:55:43 -0700
Message-ID: <CA+55aFwwZB=aZ12WikKETtV-mZKPvVRMvC0ie6-UbUq8bkgAUQ@mail.gmail.com>
References: <CACxGe6vFHADzsE7_69B+jjT3kwX_3kOdUBzjtSVEYETwR7HY3Q@mail.gmail.com>
	<CA+55aFwd7sKSKu0+pfSOUGUQrbVuCO_ZBAXds=uGYx5=yfV=VA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+55aFwd7sKSKu0+pfSOUGUQrbVuCO_ZBAXds=uGYx5=yfV=VA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>
Cc: Rob Herring <rob.herring@linaro.org>, Laura Abbott <lauraa@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jul 6, 2014 at 12:24 PM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Why does the code not just do something like
>
>   #define MAX_PHYS_ADDR ((phys_addr_t) ~0)
>
> and then do
>
>   if (base > MAX_PHYS_ADDR || base + size > MAX_PHYS_ADDR)

Actually, there's an even better model, which is to just check if a
value fits in a type.

You could do something like

  #define FITS(type, value) ((value) == (type)(value))

and then you can just use

    if (!FITS(phys_addr_t, base) || !FITS(phys_addr_t, base+size))

instead. The compiler will trivially turn the comparisons into no-ops
if the type is sufficient to hold the value.

We already do this in a few places, it might even be worth it making a
generic macro. People have been confused by the "x == x" kind of
comparisons before, see for example fs/buffer.c:grow_buffers(), which
does

        index = block >> sizebits;
        if (unlikely(index != block >> sizebits)) {

where "index" is a pgoff_t, but "block >> sizebits" is a sector_t, so
that comparison actually checks that "block >> sizebits" fits in the
type, even though it looks like it compares the same computed value
against itself.

           Linus
