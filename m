From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: dtc
Date: Fri, 29 Aug 2008 23:12:28 +1000
Message-ID: <20080829131228.GB972@yookeroo.seuss>
References: <319b0ac50808080546w7bda0293ub9fb4a4160cfd17f@mail.gmail.com>
	<20080808125430.GA4243@pengutronix.de>
	<489C45AC.9080504@grandegger.com>
	<200808290226.24367.rob@landley.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <200808290226.24367.rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 29, 2008 at 02:26:23AM -0500, Rob Landley wrote:
> On Friday 08 August 2008 08:10:04 Wolfgang Grandegger wrote:
> > If you want to make my-board.dtb, just type:
> >
> > $ make my-board.dtb
> >
> > You may need to specific DTS_FLAGS though, e.g.:
> >
> > $ export DTS_FLAGS="-p 0x1000"
> > $ make my-board.dtb
> 
> What do those flags do, by the way?  (Is there documentation I
> should read on this?)

dtc --help will give you a brief summary

The -p 0x1000 option causes dtc to add 0x1000 bytes of padding to the
emitted tree structure.  That means the bootloader can add a few
nodes/properties to the blob without having to reallocate it.

> I've skimmed Documentation/powerpc/booting-without-of.txt a bit, but I don't 
> recall it mentioning much about flags?  (A quick grep showed gpio flags and 
> address allocation flags, but not what any of them actually _were_...)
> 
> > Wolfgang.
> 
> Rob

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
