From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Thu, 28 May 2009 08:31:41 -0600
Message-ID: <fa686aa40905280731t51b0b16cscf4b047c301c92db@mail.gmail.com>
References: <fa686aa40905270727m31250984tf12249fc87179ce9@mail.gmail.com>
	<20090527150527.GK6805@pengutronix.de>
	<87vdnm8sec.fsf@macbook.be.48ers.dk>
	<4A1D6901.2090508@freescale.com>
	<20090527175609.GB31861@flint.arm.linux.org.uk>
	<4A1D8FBA.6040802@freescale.com>
	<20090527192909.GA32398@flint.arm.linux.org.uk>
	<20090527205218.GA5591@sirena.org.uk>
	<fa686aa40905271405pc2f1738gc8dd139f61a0e27@mail.gmail.com>
	<20090528124307.GN22742@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20090528124307.GN22742-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Russell King <rmk+lkml-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-discuss <devicetree-discuss@ozlabs.>
List-Id: devicetree@vger.kernel.org

On Thu, May 28, 2009 at 6:43 AM, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> On Wed, May 27, 2009 at 03:05:58PM -0600, Grant Likely wrote:
> > There is the advantage of easy multiplatform support.  I regularly
> > build a single kernel image which boots on all my MPC5200 boards, and
> > on my MPC83xx boards.
>
> That is not necessarily an advantage of a device tree. On ARM you can
> also build a kernel which runs on 20+ PXA platforms at the same time.
> (And I'm sure it can be done to even support say i.MX and PXA at the
> same time, but this is another story)

With hard coded device tables the kernel needs to be explicitly taught
about each new board, and each enabled board increases the size of the
kernel image with separate copies of the device table.  With an
external data structure, a previously unknown board can be booted
without recompiling the kernel (assuming of course that the SoC is
supported).

g.

-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
