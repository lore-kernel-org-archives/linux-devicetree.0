From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 1/8] arm/dt: Make __vet_atags also accept a dtb image
Date: Tue, 18 Jan 2011 14:42:52 -0700
Message-ID: <AANLkTinLRkqY1Ovf4xbBeYCRfs5fsEG7JKnbE1Z_dd29@mail.gmail.com>
References: <20110118195933.13011.56098.stgit@localhost6.localdomain6>
	<20110118202902.13011.68847.stgit@localhost6.localdomain6>
	<alpine.LFD.2.00.1101181621140.8580@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <alpine.LFD.2.00.1101181621140.8580-QuJgVwGFrdf/9pzu0YdTqQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lennert Buijtenhek <buytenh-OLH4Qvv75CYX/NnBR394Jw@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Nicolas,

On Tue, Jan 18, 2011 at 2:26 PM, Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> w=
rote:
> On Tue, 18 Jan 2011, Grant Likely wrote:
>
>> The dtb is passed to the kernel via register r2, which is the same
>> method that is used to pass an atags pointer. =A0This patch modifies
>> __vet_atags to not clear r2 when it encounters a dtb image.
>>
>> Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>> ---
>> =A0arch/arm/kernel/head-common.S | =A0 19 +++++++++++++------
>> =A0arch/arm/kernel/head.S =A0 =A0 =A0 =A0| =A0 =A08 ++++----
>> =A02 files changed, 17 insertions(+), 10 deletions(-)
>>
>> diff --git a/arch/arm/kernel/head-common.S b/arch/arm/kernel/head-common=
.S
>> index 8f57515..d9a9105 100644
>> --- a/arch/arm/kernel/head-common.S
>> +++ b/arch/arm/kernel/head-common.S
>> @@ -14,6 +14,7 @@
>> =A0#define ATAG_CORE 0x54410001
>> =A0#define ATAG_CORE_SIZE ((2*4 + 3*4) >> 2)
>> =A0#define ATAG_CORE_SIZE_EMPTY ((2*4) >> 2)
>> +#define OF_DT_MAGIC 0xedfe0dd0 /* 0xd00dfeed in big-endian */
>
> ARM can be big endian too. =A0Would be nice to make this endian
> independent, or at least list this limitation in the commit log.

How about:
#ifdef CONFIG_CPU_BIG_ENDIAN
#define OF_DT_MAGIC 0xd00dfeed
#else
#define OF_DT_MAGIC 0xedfe0dd0 /* 0xd00dfeed in big-endian */
#endif

Or is there a better way for loading and comparing big endian values in ARM?

>
>> =A0/*
>> =A0 * Exception handling. =A0Something went wrong and we can't proceed. =
=A0We
>> @@ -105,22 +106,28 @@ __lookup_machine_type_data:
>>
>> =A0/* Determine validity of the r2 atags pointer. =A0The heuristic requi=
res
>> =A0 * that the pointer be aligned, in the first 16k of physical RAM and
>> - * that the ATAG_CORE marker is first and present. =A0Future revisions
>> + * that the ATAG_CORE marker is first and present. =A0If CONFIG_OF_FLAT=
TREE
>> + * is selected, then it will also accept a dtb pointer. =A0Future revis=
ions
>> =A0 * of this function may be more lenient with the physical address and
>> =A0 * may also be able to move the ATAGS block if necessary.
>> =A0 *
>> =A0 * r8 =A0=3D machinfo
>> =A0 *
>> =A0 * Returns:
>> - * =A0r2 either valid atags pointer, or zero
>> + * =A0r2 either valid atags pointer, valid dtb pointer, or zero
>> =A0 * =A0r5, r6 corrupted
>> =A0 */
>> =A0__vet_atags:
>> =A0 =A0 =A0 tst =A0 =A0 r2, #0x3 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0@ aligned?
>> =A0 =A0 =A0 bne =A0 =A0 1f
>>
>> - =A0 =A0 ldr =A0 =A0 r5, [r2, #0] =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0@ is first tag ATAG_CORE?
>> - =A0 =A0 cmp =A0 =A0 r5, #ATAG_CORE_SIZE
>> +#ifdef CONFIG_OF_FLATTREE
>> + =A0 =A0 ldr =A0 =A0 r5, [r2, #0] =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0@ is it a DTB?
>> + =A0 =A0 ldr =A0 =A0 r6, =3DOF_DT_MAGIC
>> + =A0 =A0 cmp =A0 =A0 r5, r6
>> + =A0 =A0 beq =A0 =A0 2f
>> +#endif
>> + =A0 =A0 cmp =A0 =A0 r5, #ATAG_CORE_SIZE =A0 =A0 =A0 =A0 =A0 =A0 @ is f=
irst tag ATAG_CORE?
>
> The "ldr r5 ..." is now done only within #ifdef CONFIG_OF_FLATTREE. =A0So
> if CONFIG_OF_FLATTREE is undefined then r5 will contain garbage.

Oops, that was a silly oversight.  Fixed now.

g.

>
>
> Nicolas
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
