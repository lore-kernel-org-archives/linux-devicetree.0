From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Board level compatibility matching
Date: Thu, 31 Jul 2008 15:09:46 -0600
Message-ID: <20080731210946.GC29834@secretlab.ca>
References: <fa686aa40807311319k44d270b0t4fa9cb0e6523339@mail.gmail.com>
	<20080731205906.GB17718@ld0162-tx32.am.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20080731205906.GB17718-VKaLA/mbEU932VTgPCOETVjVikpgYyvb5NbjCUgZEJk@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, linuxppc-dev <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 31, 2008 at 03:59:06PM -0500, Scott Wood wrote:
> On Thu, Jul 31, 2008 at 02:19:57PM -0600, Grant Likely wrote:
> > - Add a property to the device tree that explicitly specifies the SoC
> > that the board is based on.  Something like 'soc-model =
> > "fsl,mpc5200b"' would be appropriate.
> 
> Shouldn't that go in the compatible property of the soc node?

Not all SoC's (in particular 4xx SoCs) use an soc node.  Some of them
instead just describe the internal busses on the SoC.

> > - Prioritize board ports in the arch/powerpc/platforms directory to
> > identify level-1 machines support from the level-2 ones.  Make sure
> > that level-1 stuff always gets probed before level-2 stuff within each
> > SoC family.  In all likelyhood, this would probably just involve
> > making sure that board specific machines get linked in before the
> > catchall machine.
> 
> I don't think we're too far away from being able to have a catch-all that
> isn't even soc-type-specific -- the main things that come to mind are
> instantiating PCI controllers (should be easily fixed) and finding the
> root IRQ controller (I suppose we could pick a random interrupt
> controller and follow the interrupt tree to its root, though it'd be more
> robust if it were explicitly identified in the device tree).

Perhaps a root-interrupt-controller property?

g.
