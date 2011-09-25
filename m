From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 3/3] dtc: Add support for variable sized cells
Date: Sun, 25 Sep 2011 21:04:54 +1000
Message-ID: <20110925110454.GP12286@yookeroo.fritz.box>
References: <1316800974-30129-1-git-send-email-robotboy@chromium.org>
	<1316800974-30129-4-git-send-email-robotboy@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1316800974-30129-4-git-send-email-robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 23, 2011 at 11:02:54AM -0700, Anton Staaf wrote:
> Cells of size 8, 16, 32, and 64 bits are supported.  The new
> /bits/ syntax was selected so as to not pollute the reserved
> keyword space with uint8/uint16/... type names.
> 
> With this patch the following property assignment:
> 
>     property = /bits/ 16 <0x1234 0x5678 0x0 0xffff>;
> 
> is equivalent to:
> 
>     property = <0x12345678 0x0000ffff>;
> 
> It is now also possible to directly specify a 64 bit literal in a
> cell list using:
> 
>     property = /bits/ 64 <0xdeadbeef00000000>;
> 
> It is an error to attempt to store a literal into a cell that is too
> small to hold the literal, and the compiler will generate an error
> when it detects this.  For instance:
> 
>     property = /bits/ 8 <256>;
> 
> Will fail to compile.  It is also an error to attempt to place a
> reference in a non 32-bit cell.

So, there's one small but serious error left in the patch, see below.

Other than that, only two things concern me:

	1) Exactly what to call the keyword.  /bits/ is better than
/size/, but I'd still like to stew a bit on it to see if we can come
up with anything better.

	2) In the documentation and internal naming, we're using
the term "cell" ambiguously.  In the discussion of this extension
we've been using "cell" to mean one array element, which is fair
enough since it's more-or-less standard CS terminology.  However, in
previous FDT and OF terminology "cell" refers to an exactly 32-bit
quantity [well, to be exact OF old-timers say this isn't strictly
right in old OF-ese, but it's close enough to meaning that for most
purposes].
	So, I think we need to find a different name for array cells
to clarify the terminology.  "elements" maybe?

[snip]
> +	| celllistprefix DT_REF
>  		{
> -			$$ = eval_literal($1, 0, 32);
> +			uint64_t val = ~0ULL >> (64 - $1.bits);
> +
> +			if ($1.bits != 32)
> +				print_error("References only allowed in 32-bit"
> +					    " cell lists");
> +
> +			$$.data = data_add_marker($1.data, REF_PHANDLE, $2);
> +			$$.data = data_append_integer($$.data, val, $1.bits);

Uh, so, this is actually worse than what you had before.  Remember
print_error() just prints an error, without aborting the parse.  So
now, if bits != 32 it will print the error, then add a phandle marker
*and* a bits-sized -1.  So later, when we go through and fix up the
REF_PHANDLE markers, we'll assume we're replacing 32-bits of data,
which could overrun the end of the data if the element size is less
than 32.

So, basically the data_add_marker() needs to be in an else clause.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
