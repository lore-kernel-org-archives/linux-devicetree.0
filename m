From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 5/8] arch/x86: Add support for device tree code.
Date: Fri, 16 Jul 2010 12:59:14 -0600
Message-ID: <AANLkTinVIf2A_OVAXlqjHY5J3jvaraPlJySnyEKbhlqA@mail.gmail.com>
References: <1279304021-22216-1-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279304021-22216-2-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279304021-22216-3-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279304021-22216-4-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279304021-22216-5-git-send-email-stephen.neuendorffer@xilinx.com>
	<961e55b7-170c-45ac-a491-628797a0aa5e@VA3EHSMHS006.ehs.local>
	<AANLkTinPIY4N9Gv_J7Ief7Scd57c0KEY6WtHsvQTBrzb@mail.gmail.com>
	<a33ca228-cb2c-4044-bf63-c653642415a0@SG2EHSMHS005.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <a33ca228-cb2c-4044-bf63-c653642415a0-RaUQJvECHitEus+KprP3J7jjLBE8jN/0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 16, 2010 at 12:42 PM, Stephen Neuendorffer
<stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
>
>
>> -----Original Message-----
>> From: glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org [mailto:glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org] On Behalf Of Gr=
ant Likely
>> Sent: Friday, July 16, 2010 11:40 AM
>> To: Stephen Neuendorffer
>> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
>> Subject: Re: [PATCH 5/8] arch/x86: Add support for device tree code.
>>
>> On Fri, Jul 16, 2010 at 12:13 PM, Stephen Neuendorffer
>> <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
>> > A few support device-tree related support functions that x86 didn't
>> > have before.
>> >
>> > Signed-off-by: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>> >
>> > ----
>> >
>> > =A0I have no idea if continuing to add these functions to every arch is
>> > a good thing or whether they should (for instance) be weak symbols
>> > with a generic definition.
>> > ---
>> > =A0arch/x86/include/asm/device.h | =A0 =A06 ++++
>> > =A0arch/x86/include/asm/irq.h =A0 =A0| =A0 =A04 ++
>> > =A0arch/x86/kernel/Makefile =A0 =A0 =A0| =A0 =A01 +
>> > =A0arch/x86/kernel/device_tree.c | =A0 63 ++++++++++++++++++++++++++++=
+++++++++++++
>> > =A0drivers/of/platform.c =A0 =A0 =A0 =A0 | =A0 =A02 +
>> > =A0include/linux/of_irq.h =A0 =A0 =A0 =A0| =A0 =A01 +
>> > =A06 files changed, 77 insertions(+), 0 deletions(-)
>> > =A0create mode 100644 arch/x86/kernel/device_tree.c
>> >
>> > diff --git a/arch/x86/include/asm/device.h b/arch/x86/include/asm/devi=
ce.h
>> > index 029f230..01414f2 100644
>> > --- a/arch/x86/include/asm/device.h
>> > +++ b/arch/x86/include/asm/device.h
>> > @@ -14,6 +14,12 @@ struct dma_map_ops *dma_ops;
>> > =A0};
>> >
>> > =A0struct pdev_archdata {
>> > +#ifdef CONFIG_OF
>> > + =A0 =A0 =A0 u64 dma_mask;
>> > +#endif
>>
>> This hunk (probably) isn't necessary anymore
>
> Doesn't compile without it because the code in fdt.c initializes it.

Fixed in current next-devicetree.

>> > diff --git a/arch/x86/include/asm/irq.h b/arch/x86/include/asm/irq.h
>> > index 5458380..6c61992 100644
>> > --- a/arch/x86/include/asm/irq.h
>> > +++ b/arch/x86/include/asm/irq.h
>> > @@ -10,6 +10,10 @@
>> > =A0#include <asm/apicdef.h>
>> > =A0#include <asm/irq_vectors.h>
>> >
>> > +#define NO_IRQ (-1)
>> > +
>>
>> no. =A0irq 0 means no irq, and all patches adding #define NO_IRQ to x86
>> have been nacked. =A0(Basically, all architectures using -1 to mean no
>> irq are considered broken. =A0ARM is one of the few (albeit large)
>> holdouts. =A0I've got a patch kicking around to change microblaze to use
>> 0 for no_irq too.
>
> OK, bogon there.. =A0The question is: how to get rid of it, since the gen=
eric of/irq.c
> code references it?

Fix microblaze, then NO_IRQ references can be removed from of/irq.c

g.
