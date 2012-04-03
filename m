From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH V2] dtc: Basic integer expressions
Date: Wed, 4 Apr 2012 09:12:21 +1000
Message-ID: <20120403231221.GI7481@truffala.fritz.box>
References: <1332901483-3751-1-git-send-email-swarren@wwwdotorg.org>
 <E1SDzDw-0003C1-Ag@jdl.com> <4F79D0DB.9010500@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F79D0DB.9010500-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 02, 2012 at 10:16:27AM -0600, Stephen Warren wrote:
> On 03/31/2012 08:24 AM, Jon Loeliger wrote:
> >> Written by David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>. Additions by me:
> >> * Ported to ToT dtc.
> >> * Renamed cell to integer throughout.
> >> * Implemented value range checks.
> >> * Allow L/UL/LL/ULL suffix on literals.
> >> * Enabled the commented test.
> >>
> >> Signed-off-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> >> ---
> >> v2:
> >> * s/cell/integer/ throughout.
> >> * Allow signed-extended values to pass the overall cell range check.
> >> * Allow L/UL/LL/ULL suffix on literals. This is purely for compatibility
> >>   with C, and has no effect on dtc's processing.
> >> * Enabled the 3 disabled tests.
> >>
> >> I'm not sure if the literal suffix handling is hacky or not...
> > 
> > I get this too:
> > 
> >  CC tests/integer-expressions.o
> > cc1: warnings being treated as errors
> > tests/integer-expressions.c: In function 'main'
> > tests/integer-expressions.c:105: error: format  tests/integer-expressions.o
> > cc1: warnings being treated as errors
> > tests/integer-expressions.c:105: error: format '%ld' expects type 'long int', but argument 3 has type 'unsigned int'
> > make: *** [tests/integer-expressions.o] Error 1
> > 
> > $ gcc --version
> > gcc (Debian 4.4.5-8) 4.4.5
> 
> I assume this is a 32-bit system? I guess I can use <inttypes.h> to
> solve this if needed.

The expression in question is based on sizeof() so has type size_t.
So %zd should do the trick.


-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
