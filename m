From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: ARM clock API to PowerPC
Date: Sat, 15 Aug 2009 23:09:27 -0600
Message-ID: <fa686aa40908152209h7e1c384yfaa72c4e825e1df0@mail.gmail.com>
References: <1250063825.15143.43.camel@pasglop>
	<20090812111954.GB31596@zod.rchland.ibm.com>
	<4A90486C-8BF5-428C-9FD8-830D822C0D40@kernel.crashing.org>
	<1250112599.3587.21.camel@pasglop>
	<3A45394FD742FA419B760BB8D398F9ED59DE33@zch01exm26.fsl.freescale.net>
	<1250242149.24143.36.camel@pasglop>
	<Pine.LNX.4.64.0908141255230.5980@axis700.grange>
	<1250251664.24143.39.camel@pasglop>
	<20090815124347.GB16112@flint.arm.linux.org.uk>
	<1250374683.24143.69.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1250374683.24143.69.camel@pasglop>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, John Jacques <john.jacques-M7mHMAq9Yzo@public.gmane.org>, linuxppc-dev list <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Torez Smith <torez-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>, Russell King <rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Aug 15, 2009 at 4:18 PM, Benjamin
Herrenschmidt<benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
> For ppc we really don't have much of a choice here anyway because we
> support multiple platforms compiled in the same kernel as long as they
> have a CPU core that's the same overall family, and that can be very
> wide. For example, 440-type cores can exist in all sort of IBM/AMCC
> cores, but also Xilinx FPGAs, and when you start saying FPGA the
> possibilities go wild :-)

Yes, exactly!  In fact, FPGAs are somewhat nicer in that only the
hardware actually needed is present on the running system (fewer data
instances), but the flip side is that the set of instances changes at
the whim of the FPGA engineer.  Static definition isn't an option
unless you want to change the platform source code for each new FPGA
bistream revision.

-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
