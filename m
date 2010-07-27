From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] arm/dt: Fix booting non-dt versatile
Date: Tue, 27 Jul 2010 14:47:42 -0600
Message-ID: <AANLkTimv=FcKwHbXGsg4Je3MMuHHKuJAi8W+HusKszfr@mail.gmail.com>
References: <20100723201336.20683.88973.stgit@angua>
	<4725906257688056024@unknownmsgid>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4725906257688056024@unknownmsgid>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Lorenzo Pieralisi <Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 26, 2010 at 3:08 AM, Lorenzo Pieralisi
<Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org> wrote:
> Hi Grant, Jeremy,
>
>> -----Original Message-----
>> From: devicetree-discuss-
>> bounces+lorenzo.pieralisi=3Darm.com-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org [mailto:devicetree-
>> discuss-bounces+lorenzo.pieralisi=3Darm.com-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org] On Behalf
>> Of Grant Likely
>> Sent: 23 July 2010 21:14
>> To: jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org; devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
>> Subject: [PATCH] arm/dt: Fix booting non-dt versatile
>>
>> Without this patch, versatilepb will not boot in qemu
>>
>> Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>> ---
>>
>> Hi Jeremy,
>>
>> I'm not sure if this is the best fix or not, but without it I cannot
>> boot
>> versatilepb anymore in QEMU.
>>
>> g.
>>
>> =A0arch/arm/kernel/head.S | =A0 =A02 +-
>> =A01 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/arch/arm/kernel/head.S b/arch/arm/kernel/head.S
>> index 8683b3b..049d533 100644
>> --- a/arch/arm/kernel/head.S
>> +++ b/arch/arm/kernel/head.S
>> @@ -93,7 +93,7 @@ ENTRY(stext)
>> =A0 =A0 =A0 =A0* Also, we don't need to call __vet_atags.
>> =A0 =A0 =A0 =A0*/
>> =A0 =A0 =A0 add =A0 =A0 r3, r1, #1
>> - =A0 =A0 bcs =A0 =A0 1f
>> + =A0 =A0 beq =A0 =A0 1f
>>
>> =A0 =A0 =A0 bl =A0 =A0 =A0__lookup_machine_type =A0 =A0 =A0 =A0 =A0 @ r5=
=3Dmachinfo
>> =A0 =A0 =A0 movs =A0 =A0r8, r5 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0@ invalid machine (r5=3D0)?
>>
>
> I think the issue is the add instruction not the conditional jump here.
> It needs to be an "adds" to update the flags so the carry.
> With beq (or bcs) you are jumping on a condition set by the movs a few li=
nes
> before, beq does not jump because the movs before did not set the zero fl=
ag
> otherwise you wouldn't be executing that code, you would have branched to
> __error_p.
> Please let me know if it works I have not tested so I might be wrong.

adds works for me on both Versatile (qemu) and Tegra.

g.
