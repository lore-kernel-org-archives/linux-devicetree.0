From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: dtc symbolic constants - not in the preprocessor?
Date: Thu, 19 Apr 2012 22:15:43 +1000
Message-ID: <20120419121543.GG5387@truffala.fritz.box>
References: <4F8E2A87.6000805@wwwdotorg.org>
 <CAPnjgZ08QajSzLWwGTFci7-5JiQSGs0_rXGJaz5PCbSqbv1_0Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPnjgZ08QajSzLWwGTFci7-5JiQSGs0_rXGJaz5PCbSqbv1_0Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 17, 2012 at 09:39:55PM -0700, Simon Glass wrote:
[snip]
> Perhaps, although maybe using /define/ for both is a bad idea.
> 
> Actually I was just thinking of dumping the data in. I like your
> suggestion in that thread about /defprop/ or /defdata/ instead
> actually - so these would just be blobs of data with no value and not
> suitable to use in expressions. In other words this feature would be
> separate from first class variables / symbols mentioned above which
> can be operated on. Perhaps a bit like strings in other languages -
> just a sequence of cells / bytes.

Blech.  Different kinds of define with not just different data types,
but different capabilities?  I hate it.  If we have language level
defines, they should just be an expression with any of the types that
an expression can have.  That should include at least integers,
strings and bytestrings, and might include node bodies as well (the
later types would need suitable operators and builtin functions to be
useful).

> The patch is available here, although the title is a misnomer now. It
> is just a modification of Stephen's patch mentioned above:
> 
> https://gerrit.chromium.org/gerrit/#change,19855
> 
> In any case I strongly support efforts to define support for symbolic
> constants, one way or another. Looking forward to the outcome!
> 
> Regards,
> Simon
> 

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
