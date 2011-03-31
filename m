From: John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
Subject: Re: [PATCH] uio/pdrv_genirq: Add OF support
Date: Thu, 31 Mar 2011 23:11:56 +1000
Message-ID: <AANLkTinJrG=s3Xuvf_=bNtYF-z8u+YXvd217UKKz24ik@mail.gmail.com>
References: <1301574600-4861-1-git-send-email-monstr@monstr.eu>
	<1301574600-4861-2-git-send-email-monstr@monstr.eu>
	<20110331124925.GA2202@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110331124925.GA2202-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: hjk-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, gregkh-l3A5Bk7waGM@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Wolfram,

Sorry for the resend, my gmail session was in rich formatting mode and
the reply was rejected from the list servers.

On Thu, Mar 31, 2011 at 10:49 PM, Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrot=
e:
>
> On Thu, Mar 31, 2011 at 02:30:00PM +0200, Michal Simek wrote:
> > Support OF support. "generic-uio" compatible property is used.
>
> And exactly this was the issue last time (when I tried). This is a
> generic property, which is linux-specific and not describing HW. The
> agreement back then was to we probably need to add compatible-entries at
> runtime (something like new_id for USB). So the uio-of-driver could be
> matched against any device. Otherwise, we would collect a lot of
> potential entries like "vendor,special-card1". Although I wonder
> meanwhile if it is really going to be that bad; we don't have so much
> UIO-driver in tree as well. Maybe worth a try?


Maybe I misunderstand you, in my view it is the responsibility of
<vendor> to create their DTS files to indicate they want
<special-card1> to bind to generic-uio.

So, no great list of compat strings should grow in the driver, but
rather the user of the driver must make it happen.

Am I missing something?

Our use-case is pretty clear, in FPGA-based systems it is common to
create arbitrary devices that developers just want to control from
userspace, with simple IRQ and IO capabilities (DMA can come later :).
 They don't need to bind to other kernel APIs or subsystems, and don't
want to invest in one-off kernel drivers that simply will never go
upstream.

UIO is perfect, and simply tagging the device as generic-uio in the
DTS is so simple, clean, and elegant.  Traditional embedded developers
really light up when you tell them you can write simple IRQ handlers
in Linux userspace.  They love it even more if they don't have to
write a line of kernel code, which generic-uio enables.

John
--
John Williams, PhD, B. Eng, B. IT
PetaLogix - Linux Solutions for a Reconfigurable World
w: www.petalogix.com=A0=A0p: +61-7-30090663=A0 f: +61-7-30090663
