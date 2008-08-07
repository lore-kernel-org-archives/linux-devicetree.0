From: David Gibson <dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
Subject: Re: dtc: Return code of fdt_get_path()
Date: Thu, 7 Aug 2008 16:08:20 +1000
Message-ID: <20080807060820.GA12571@yookeroo.seuss>
References: <4898C236.5030305@freescale.com>
	<20080806053310.GF6690@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20080806053310.GF6690-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Jon Loeliger <jdl-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 06, 2008 at 03:33:10PM +1000, David Gibson wrote:
> On Tue, Aug 05, 2008 at 04:12:22PM -0500, Scott Wood wrote:
> > The documentation for fdt_get_path() says it returns zero on success,  
> > but it actually returns the length of the string.  Is there any  
> > preference on which one to fix?
> 
> The documentation I think.  There may be existing users, and the
> length of the path is potentially useful.
> 
> Although.. I think the confusion came because at one stage I planned
> to have it return the full length of the path, even if the buffer was
> smaller.  That would let the caller allocate a buffer of exactly the
> right size on a second call.  Which is potentially useful, but not
> compatible with returning NOSPACE as we do now.
> 
> Plus.. looking over that code again, I think there may be more
> problems there - I think there may be cases where it runs out of space
> but returns BADOFFSET or some error code instead of NOSPACE.

Ugh, yes, confirmed that it is buggy.  Not sure of the best way to fix
this, I can see three ways to go here.

	1. Minimally fix the error code bug, make sure NOSPACE is
returned when the buffer is too small, length of path otherwise,
update documentation to match.
	2. Make the code match the documentation: return 0 on success,
NOSPACE if the buffer is too small.
	3. Update both code and documentation to match the semantics I
think I must have intended at some point: always return the path
length, even if it exceeds the buffer length; caller is responsible
for checking if the path in the buffer is truncated.

(3) has the possibly useful property that you can use the call with a
small buffer and if it fails the caller now knows how big a buffer it
must allocate.  With (1) and (2) the caller's only way to deal with
NOSPACE is to keep allocating bigger buffers until the call succeeds.
However it makes it more complex for the caller to check the return
value - not just that it's non-negative put also that it's less than
the buffer size.  Plus its arguably stylistically inconsistent with
the read-write functions which return NOSPACE when the buffer is
exceeded with no indication of how much space is needed.

Any views, Jon?

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
