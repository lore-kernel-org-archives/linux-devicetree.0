From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC PATCH 12/14] ARM: vexpress: add board support for DT probing
Date: Wed, 18 Aug 2010 16:30:35 -0600
Message-ID: <AANLkTimvTX2MbWR+89rwwA2NEsC_1NcNb4X7D2quy5ck@mail.gmail.com>
References: <1282158000-23081-1-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-2-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-3-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-4-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-5-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-6-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-7-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-8-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-9-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-10-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-11-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-12-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-13-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1282158000-23081-13-git-send-email-lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, philippe.robin-5wv7dgnIgG8@public.gmane.org, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 18, 2010 at 12:59 PM, Lorenzo Pieralisi
<lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org> wrote:
> Discussion is under way to decide if a set of machine ids is allocated
> to ARM platforms based on device tree initialization.
> Init code for a given platform should be split in a static init version
> and a device tree init version. The Versatile Express ARM board requires
> the initialization of motherboard and daughterboard in separate steps,
> so the split between static init and DT init is doubled in terms of
> files. Common code should be factored out in common C files to avoid code
> duplication.
>
> This patch refactors the Versatile Express init code in order
> to split it in DT and non-DT versions, compiled in accordingly depending
> on kernel configuration options. Clock look-up for the DT version is
> still work in progress waiting for a definitive clock binding spec so
> device names are not really DT compliant at the moment in the dts.
>
> Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>

Hi Lorenzo,

This ends up looking like quite an imposing patch for something that
should be relatively simple.  At the very least, moving the common
functions should be performed in a separate patch so that the -dt
changes can be reviewed independently of the code reorganization.
I'll need to dig into the detail of this one a bit later when I've got
some time.

Cheers,
g.

> ---
> =A0arch/arm/mach-vexpress/core.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 15 ++-
> =A0arch/arm/mach-vexpress/ct-ca9x4-base.c =A0 =A0 =A0 =A0 | =A0108 ++++++=
+++++++
> =A0arch/arm/mach-vexpress/ct-ca9x4-of.c =A0 =A0 =A0 =A0 =A0 | =A0192 ++++=
+++++++++++++++++++
> =A0arch/arm/mach-vexpress/ct-ca9x4.c =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 93 =
-----------
> =A0arch/arm/mach-vexpress/include/mach/ct-ca9x4.h | =A0 =A02 +
> =A0arch/arm/mach-vexpress/v2m-base.c =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0197 =
++++++++++++++++++++++++
> =A0arch/arm/mach-vexpress/v2m-of.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 9=
4 +++++++++++
> =A0arch/arm/mach-vexpress/v2m.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
178 +---------------------
> =A08 files changed, 610 insertions(+), 269 deletions(-)
> =A0create mode 100644 arch/arm/mach-vexpress/ct-ca9x4-base.c
> =A0create mode 100644 arch/arm/mach-vexpress/ct-ca9x4-of.c
> =A0create mode 100644 arch/arm/mach-vexpress/v2m-base.c
> =A0create mode 100644 arch/arm/mach-vexpress/v2m-of.c
>
