From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 0/8] Implement a new DTS Source Language
Date: Thu, 25 Sep 2008 14:31:11 +1000
Message-ID: <20080925043111.GK15169@yookeroo.seuss>
References: <1222196652-13811-1-git-send-email-jdl@jdl.com>
	<097BFF8D-317F-4E85-AC2A-4C0A8D6C608B@kernel.crashing.org>
	<1222275105.11692.9.camel@ld0161-tx32>
	<1222282135.12705.4.camel@ld0161-tx32>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1222282135.12705.4.camel@ld0161-tx32>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Jon Loeliger <jdl-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 24, 2008 at 01:48:55PM -0500, Jon Loeliger wrote:
> On Wed, 2008-09-24 at 11:51 -0500, Jon Loeliger wrote:
> > On Tue, 2008-09-23 at 21:34 -0500, Kumar Gala wrote:
> > 
> > > Any examples/tests of all the cool new features?
> > > 
> > > - k
> > 
> > Here is a QAD example based on the MPC8641 DTS file
> > as found in the arch/powerpc/boot/dts directory today.
> > It is maybe not the best example, but it shows the
> > flavor of what can be done.
> > 
> > Enjoy,
> > jdl
> 
> 
> Also, here is the same refactoring done on the
> mpc8572ds.dts file too.
> 
> And, perhaps more important than doing this work
> on this one file, it shows that the first section
> of both this 8572 DTS file and the 8641 DTS file
> are almost identical throughout the /define/ section.
> Minor refactoring needed in the 8641 variant.
> The only "real" difference is 8641 says "TSEC" and
> the 8572 says "eTSEC", and one weird interrupt thing
> in the serial node.  Dunno.

[snip]
> /define/ make_i2c(\id)
> {
> 	\addr := 0x3000 + \id * 0x100;

Hrm.  Again, not very C-like.  Plus it bothers me that there are 3
somewhat different definition constructs: /define/, /const/ and :=.
At least /define/ and /const/ should be mergeable, with /const/
becoming a zero-parameter /define/.  Maybe local defines need
something different, but the distinction seems dangerously ad-hoc to
me at the moment.

[snip]
> /define/ make_dma_channel(\part, \id, \intr_base)
> {
> 	"dma-channel@" % hexstr(\id * 0x80) {
> 		compatible = < ("fsl,mpc" % \part % "-dma-channel")
> 				("fsl,eloplus-dma-channel") >;

WTF!?  What is a < > construct doing containing strings rather than
cells.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
