From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 5/8] arch/x86: Add support for device tree code.
Date: Fri, 16 Jul 2010 14:28:52 -0600
Message-ID: <AANLkTilK7ePpHqUWGRHm2nVuIvqkVMUafzpQfWNvMi7V@mail.gmail.com>
References: <1279304021-22216-1-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279304021-22216-2-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279304021-22216-3-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279304021-22216-4-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279304021-22216-5-git-send-email-stephen.neuendorffer@xilinx.com>
	<961e55b7-170c-45ac-a491-628797a0aa5e@VA3EHSMHS006.ehs.local>
	<AANLkTinPIY4N9Gv_J7Ief7Scd57c0KEY6WtHsvQTBrzb@mail.gmail.com>
	<a33ca228-cb2c-4044-bf63-c653642415a0@SG2EHSMHS005.ehs.local>
	<AANLkTinVIf2A_OVAXlqjHY5J3jvaraPlJySnyEKbhlqA@mail.gmail.com>
	<a52173ec-5c74-47ce-9121-f2e90958b05d@SG2EHSMHS010.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <a52173ec-5c74-47ce-9121-f2e90958b05d-RaUQJvECHiuJ1bAq5m18RLjjLBE8jN/0@public.gmane.org>
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

On Fri, Jul 16, 2010 at 2:11 PM, Stephen Neuendorffer
<stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
>
>> >> > diff --git a/arch/x86/include/asm/irq.h b/arch/x86/include/asm/irq.h
>> >> > index 5458380..6c61992 100644
>> >> > --- a/arch/x86/include/asm/irq.h
>> >> > +++ b/arch/x86/include/asm/irq.h
>> >> > @@ -10,6 +10,10 @@
>> >> > =A0#include <asm/apicdef.h>
>> >> > =A0#include <asm/irq_vectors.h>
>> >> >
>> >> > +#define NO_IRQ (-1)
>> >> > +
>> >>
>> >> no. =A0irq 0 means no irq, and all patches adding #define NO_IRQ to x=
86
>> >> have been nacked. =A0(Basically, all architectures using -1 to mean no
>> >> irq are considered broken. =A0ARM is one of the few (albeit large)
>> >> holdouts. =A0I've got a patch kicking around to change microblaze to =
use
>> >> 0 for no_irq too.
>> >
>> > OK, bogon there.. =A0The question is: how to get rid of it, since the =
generic of/irq.c
>> > code references it?
>>
>> Fix microblaze, then NO_IRQ references can be removed from of/irq.c
>>
>> g.
>
> OK... Michal: I see you were against this patch...
> What is your current thinking?

John Williams reluctantly agreed that going to NO_IRQ =3D=3D 0 was the
right thing to do.  Last we left it I was going to respin my patch,
but I haven't had a chance to do so yet.

g.
