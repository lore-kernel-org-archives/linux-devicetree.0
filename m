From: "M. Warner Losh" <imp-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 8/9 V3] Add documentation for the new DTS language.
Date: Thu, 02 Oct 2008 19:17:05 -0600 (MDT)
Message-ID: <20081002.191705.-108805802.imp@bsdimp.com>
References: <20081002152242.GB22258@ld0162-tx32.am.freescale.net>
	<20081002.135004.1723231860.imp@bsdimp.com>
	<20081003002337.GB3002@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20081003002337.GB3002-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org
Cc: scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

In message: <20081003002337.GB3002-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org>
            David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> writes:
: On Thu, Oct 02, 2008 at 01:50:04PM -0600, M. Warner Losh wrote:
: > In message: <20081002152242.GB22258-VKaLA/mbEU932VTgPCOETVjVikpgYyvb5NbjCUgZEJk@public.gmane.org>
: >             Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org> writes:
: > : On Thu, Oct 02, 2008 at 11:18:00AM +1000, David Gibson wrote:
: > : > > I vote against anything similar to the C preprocessor.
: > : > 
: > : > Why?
: > : 
: > : It's not nearly as powerful as the semantic approach, and it is
: > : syntactically clumsy (I do *not* want to have to put a backslash at the
: > : end of every line within a macro, for example).
: > 
: > And there are no looping constructs at all in CPP.  You flat out can't
: > do a generalized for loop with the macro language, for example.  Its
: 
: But we can put looping constructs into the expression support which
: macros can then use.
: 
: > symbols also do not map 1-1/onto symbols used by the dts files.  It
: > can only grok macros you define for it, so it has no way of knowing
: > many useful things that dts just knows.
: 
: Uh.. I'm not sure what you mean by this.

I mean that identifiers have # in them in the dts language.  cpp deals
with identifiers that are similar to, but not the same thing as dts.

Warner
