From: Jon Loeliger <jdl-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: dtc: Return code of fdt_get_path()
Date: Tue, 12 Aug 2008 10:57:17 -0500
Message-ID: <1218556637.26153.0.camel@ld0161-tx32>
References: <4898C236.5030305@freescale.com>
	<20080806053310.GF6690@yookeroo.seuss>
	<20080807060820.GA12571@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20080807060820.GA12571-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: David Gibson <dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
Cc: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2008-08-07 at 16:08 +1000, David Gibson wrote:

> Ugh, yes, confirmed that it is buggy.  Not sure of the best way to fix
> this, I can see three ways to go here.
> 
> 	1. Minimally fix the error code bug, make sure NOSPACE is
> returned when the buffer is too small, length of path otherwise,
> update documentation to match.
> 	2. Make the code match the documentation: return 0 on success,
> NOSPACE if the buffer is too small.
> 	3. Update both code and documentation to match the semantics I
> think I must have intended at some point: always return the path
> length, even if it exceeds the buffer length; caller is responsible
> for checking if the path in the buffer is truncated.
> 
> (3) has the possibly useful property that you can use the call with a
> small buffer and if it fails the caller now knows how big a buffer it
> must allocate.  With (1) and (2) the caller's only way to deal with
> NOSPACE is to keep allocating bigger buffers until the call succeeds.
> However it makes it more complex for the caller to check the return
> value - not just that it's non-negative put also that it's less than
> the buffer size.  Plus its arguably stylistically inconsistent with
> the read-write functions which return NOSPACE when the buffer is
> exceeded with no indication of how much space is needed.
> 
> Any views, Jon?

Just rolling back into town and catching up some....

Has this issue been resolved yet?

jdl
