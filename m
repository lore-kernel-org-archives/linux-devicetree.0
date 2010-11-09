From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Alignment of mixed-data type items in properties
Date: Tue, 9 Nov 2010 12:28:45 +1100
Message-ID: <20101109012845.GC30378@yookeroo>
References: <20101109010709.GA10639@dvomlehn-lnx2.corp.sa.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20101109010709.GA10639-ZEW99E7oL/EiWxQNNj96ibh/4TqKg8J2XqFh9Ls21Oc@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Cc: Device Tree Mailing List <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 08, 2010 at 05:07:09PM -0800, David VomLehn wrote:
> I have a property that seems most simply expressed as:
> 
> 	prop = "abc",<0x12345678 0x87654321>;
> 
> It looks like the u32 values are not aligned on four-byte
> boundaries.

Well, actually, in this case it will be 4-byte aligned, because "abc"
is 4 bytes in length ('a', 'b', 'c', '\0').  But in general, that's
right, u32 values will not be aligned if they follow something of
unaligned length.

> Given the effort elsewhere in the device tree to make
> things aligned,

That's in the tree structure, not the contents.  The property values
are just bytestrings as far as the dtb format is concerned.

> this was a bit of a surprise. It's easy enough to
> handle; I'm just wondering whether this was the intent.

Yes, it's the intent.  Early on we did align u32 values, but we
realised that was a bad idea.  It doesn't really correspond to how OF
did encode property values, and it gets confusing in more complex
examples (including some possible future syntax).  Consider for
example
	&label, <0x1234>
We wouldn't know how much alignment to insert until the label is
expanded.  It gets much worse if we support expressions in future.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
