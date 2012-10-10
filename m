From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: dtc: import latest upstream dtc
Date: Thu, 11 Oct 2012 10:16:23 +1100
Message-ID: <20121010231623.GG28467@truffula.fritz.box>
References: <1349827466.26044.16@snotra>
 <ADE80D65-5170-4A8E-8D90-29161F8DB3BB@bsdimp.com>
 <20121010072401.GA28467@truffula.fritz.box>
 <50759152.9050407@wwwdotorg.org> <5075954B.8030008@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5075954B.8030008-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Michal Marek <mmarek-AlSwsSmVLrQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 10, 2012 at 10:33:31AM -0500, Rob Herring wrote:
> On 10/10/2012 10:16 AM, Stephen Warren wrote:
> > On 10/10/2012 01:24 AM, David Gibson wrote:
> >> On Tue, Oct 09, 2012 at 10:43:50PM -0600, Warner Losh wrote:
> >>> On Oct 9, 2012, at 6:04 PM, Scott Wood wrote:
[snip]
> > That's probably a reasonable idea, although I imagined that people would
> > actually split out the portions of any header file they wanted to use
> > with dtc, so that any headers included by *.dts would only include
> > #defines. Those headers could be used by both dtc and other .h files (or
> > .c files).
> 
> Used by what other files? kernel files? We ultimately want to split out
> dts files from the kernel, so whatever we add needs to be self
> contained. I don't see this as a huge issue though because the whole
> point of the DT data is to move that information out of the kernel. If
> it is needed in both places, then something is wrong.

People get very hung up on this idea of having the DT move device
information out of the kernel, but that was never really the
motivation behind it.  Or at least, not the only or foremost
motivation.

The DT provides a consistent, flexible way of describing device
information.  That allows the core runtime the kernel to operate the
same way, regardless of how the DT information was obtained.  The DT
could come from firmware, but it could also come from an intermediate
bootloader or from early kernel code.  All are perfectly acceptable
options depending on the constraints of the platform.

The idea of firmware supplying the DT is much touted, but while it's a
theoretically nice idea, I think it's frequently a bad idea for
practical reasons.  Those being, in essence that a) firmware usually
sucks, b) it's usually harder (or at least no easier) to replace
firmware with a fixed version than the kernel/bootwrapper and c)
firmware usually *really* sucks.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
