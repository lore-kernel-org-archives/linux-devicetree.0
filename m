From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH V2] DTC: Remove support for the legacy DTS source file
	format.
Date: Sat, 16 Aug 2008 15:06:30 +1000
Message-ID: <20080816050630.GA12072@yookeroo.seuss>
References: <E1KTlq7-0005Gh-Co@jdl.com> <20080815002936.GA9877@yookeroo.seuss>
	<ed82fe3e0808150817k66d6c70fp17774fbd726ea2b2@mail.gmail.com>
	<E1KU1Td-0006ub-8O@jdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <E1KU1Td-0006ub-8O-CYoMK+44s/E@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 15, 2008 at 10:44:33AM -0500, Jon Loeliger wrote:
> > On Thu, Aug 14, 2008 at 7:29 PM, David Gibson
> > <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > > On Thu, Aug 14, 2008 at 06:02:43PM -0500, Jon Loeliger wrote:
> > >> Now that all in-kernel-tree DTS files are properly /dts-v1/,
> > >> remove direct support for the older, un-numbered DTS
> > >> source file format.
> > >
> > > Um.. why?  I just don't see a compelling reason to remove this
> > > backwards compatibility.  It costs us very little to keep it around
> > > indefinitely.
> 
> Because we are going to get rid of the cruft, simplify things,
> and move forward.  Really.  This was the plan from the onset.

Uh.. removing compatibility for the old format was never part of *my*
plan for the change.  Discourage any further use of the v0 format,
yes, remove support for, no.

I just don't see a benefit to this.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
