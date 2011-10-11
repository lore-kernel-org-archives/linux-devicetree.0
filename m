From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v4 3/3] dtc: Add support for variable sized elements
Date: Wed, 12 Oct 2011 01:44:13 +1100
Message-ID: <20111011144413.GJ4849@truffala.fritz.box>
References: <1317147098-11550-1-git-send-email-robotboy@chromium.org>
 <1317147098-11550-4-git-send-email-robotboy@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1317147098-11550-4-git-send-email-robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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

On Tue, Sep 27, 2011 at 11:11:38AM -0700, Anton Staaf wrote:
> Elements of size 8, 16, 32, and 64 bits are supported.  The new
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
> cell list, also known as an array using:
> 
>     property = /bits/ 64 <0xdeadbeef00000000>;
> 
> It is an error to attempt to store a literal into an element that is
> too small to hold the literal, and the compiler will generate an
> error when it detects this.  For instance:
> 
>     property = /bits/ 8 <256>;
> 
> Will fail to compile.  It is also an error to attempt to place a
> reference in a non 32-bit element.
> 
> The documentation has been changed to reflect that the cell list
> is now an array of elements that can be of sizes other than the
> default 32-bit cell size.
> 
> The sized_cells test tests the creation and access of 8, 16, 32,
> and 64-bit sized elements.  It also tests that the creation of two
> properties, one with 16 bit elements and one with 32 bit elements
> result in the same property contents.
> 
> Signed-off-by: Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

What the hell, I think I've convinced myself that /bits/ is good
enough.

Acked-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
