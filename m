From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 1/3] fdt.c: Add non-boottime device tree functions
Date: Wed, 17 Nov 2010 22:35:36 -0700
Message-ID: <AANLkTi=my5p5oe+-8NSo_aPYNfWg3FX46wWLeLCgRsx5@mail.gmail.com>
References: <1290021345-4303-1-git-send-email-stephen.neuendorffer@xilinx.com>
	<17453aae-47e7-4b69-b7f4-b4577456c637@VA3EHSMHS001.ehs.local>
	<20101117194203.GA2352@angua.secretlab.ca>
	<eed86eda-ba28-4f12-b615-d293eb1a356e@VA3EHSMHS015.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <eed86eda-ba28-4f12-b615-d293eb1a356e-+Ck8Kgl/v091zOOwW4IIhbjjLBE8jN/0@public.gmane.org>
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

On Wed, Nov 17, 2010 at 3:53 PM, Stephen Neuendorffer
<stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
>
>
>> -----Original Message-----
>> From: Grant Likely [mailto:glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org] On Behalf Of Grant
> Likely
>> Sent: Wednesday, November 17, 2010 11:42 AM
>> To: Stephen Neuendorffer
>> Cc: dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org; devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
>> Subject: Re: [PATCH 1/3] fdt.c: Add non-boottime device tree functions
>>
>> On Wed, Nov 17, 2010 at 11:15:43AM -0800, Stephen Neuendorffer wrote:
>> > In preparation for providing run-time handling of device trees,
> factor
>> > out some of the basic functions so that they take an arbitrary blob,
>> > rather than relying on the single boot-time tree.
>> >
>> > Signed-off-by: Stephen Neuendorffer
> <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>> > ---
>> > =A0drivers/of/fdt.c =A0 =A0 =A0 | =A0129
> ++++++++++++++++++++++++++++++-----------------
>> > =A0include/linux/of_fdt.h | =A0 =A09 +++
>> > =A02 files changed, 91 insertions(+), 47 deletions(-)
>> >
>> > diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
>> > index c1360e0..6ae207a 100644
>> > --- a/drivers/of/fdt.c
>> > +++ b/drivers/of/fdt.c
>> > @@ -22,6 +22,86 @@
>> >
>> > =A0#include <asm/page.h>
>> >
>> > +char *fdt_get_string(u32 offset,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct boot_param_header *bl=
ob)
>>
>> nitpicking: Encouraged naming convention is of_flat_dt_* for this
>> file. =A0Also, I think it makes more sense for blob to be the first
>> argument in all of these functions.
>
> If I do the rename, then of_flat_dt_is_compatible has a conflict with
> the non-blob function, which is
> used all over the place in the powerpc platform code. =A0It seems like
> there's already alot of nonsense
> between drivers/of/fdt.c, CONFIG_FLATTREE, and of_flat_dt_* conventions.
> Perhaps a non conflicting
> convention? =A0of_fdt_* (to match the file) or flattree_* (to match the
> Kconfig option).

Just discussed this on IRC, and even got into the prospect of
replacing the 'of' abbreviation entirely with something like 'dt'
('cause everyone agrees 'of' sucks, and can't figure out why we agreed
to that prefix in the first place).  The flat tree functions are also
get renamed to fdt_*

However, looking at the scope of the change, I doubt that the of_ -->
dt_ rename will actually happen.  So, in order to remain at least
slightly consistent, go ahead and use the of_fdt_ prefix if this
patch.  Bonus points if you also post a patch to rename the old
function names to of_fdt_initial_* (or something) and fixup all the
users (should be trivial since it will just be a global search and
replace).

g.
