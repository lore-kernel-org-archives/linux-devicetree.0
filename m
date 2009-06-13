From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] powerpc/mpc52xx/mtd: fix mtd-ram access for 16-bit Local
	Plus Bus
Date: Sat, 13 Jun 2009 11:09:24 -0600
Message-ID: <fa686aa40906131009t639112adn46e502631873f3a0@mail.gmail.com>
References: <fa686aa40906110927w60a5a74alaa3420b9bf3f3e44@mail.gmail.com>
	<1244911551.3423.0@antares>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <1244911551.3423.0@antares>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: =?ISO-8859-1?Q?Albrecht_Dre=DF?= <albrecht.dress-KvP5wT2u2U0@public.gmane.org>
Cc: Linux PPC Development <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Jun 13, 2009 at 10:45 AM, Albrecht Dre=DF<albrecht.dress-KvP5wT2u2U0@public.gmane.org> =
wrote:
> Am 11.06.09 18:27 schrieb(en) Grant Likely:
>>>
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 *(u16 *)buf =3D *((volatile u16 *)(vdest =
- 1));
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 buf[1] =3D *((u8 *)src);
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 *((volatile u16 *)(vdest - 1)) =3D *(u16 =
*)buf;
>>
>> what is the purpose of volatile here? =A0If you need io barriers, then u=
se
>> the in_/out_be16 macros.
>
> Yes, you're right - should be completely superfluous here. =A0A result of=
 copy
> & paste without thinking... :-(
>
>> Blech. =A0ugly #ifdef and not really multiplatform safe (yeah, I know it
>> shouldn't break non-5200 platforms, but it does have an undesirable impa=
ct).
>> =A0There's got to be a better way.
>
> Ouch, yes - I completely forgot the possibility of multi-platform builds.
>
> Am 11.06.09 19:28 schrieb(en) Grant Likely:
>>
>> So; the solution to me seems to be on an MPC5200 platform replace the
>> offending hooks with MPC5200 specific variants at runtime.
>
> Will re-work the patch that way! =A0BTW, a dumb question: what is the pro=
per
> way to determine which cpu the system is running on? =A0Check the CPU nod=
e of
> the of tree?

In this case I'd walk up the parent nodes in the tree looking for an
"fsl,mpc5200-lpb" compatible value.  That way you only apply the
workaround if the device is on the locaplus bus, and not for example
below the PCI bus.

g.

-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
