From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 2/3] mpc52xx/wdt: merge WDT code into the GPT
Date: Wed, 11 Nov 2009 13:11:15 -0700
Message-ID: <fa686aa40911111211m41197cddl451165bebed6edd8@mail.gmail.com>
References: <1980629.1257928058732.JavaMail.ngmail@webmail19.ha2.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1980629.1257928058732.JavaMail.ngmail-hrWuGRo80rRiK3oW1guXusM6rOWSkUom@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: =?ISO-8859-1?Q?Albrecht_Dre=DF?= <albrecht.dress-KvP5wT2u2U0@public.gmane.org>
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 11, 2009 at 1:27 AM, Albrecht Dre=DF <albrecht.dress-KvP5wT2u2U0@public.gmane.org> =
wrote:
> Hi Grant:
>
> Thanks a lot for your comments!
>
>> On Tue, Nov 10, 2009 at 12:41 PM, Albrecht Dre=DF <albrecht.dress@arcor.=
de>
>> > +#if defined(HAVE_MPC5200_WDT)
>> > + =A0 =A0 =A0 /* check if this device could be a watchdog */
>> > + =A0 =A0 =A0 if (of_get_property(ofdev->node, "fsl,has-wdt", NULL) ||
>> > + =A0 =A0 =A0 =A0 =A0 of_get_property(ofdev->node, "has-wdt", NULL)) {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 const u32 *on_boot_wdt;
>> > +
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpt->wdt_mode =3D MPC52xx_GPT_CAN_WDT;
>> > +
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* check if the device shall be used as =
on-boot watchdog
>> */
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 on_boot_wdt =3D of_get_property(ofdev->n=
ode, "wdt,on-boot",
>> NULL);
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (on_boot_wdt) {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpt->wdt_mode |=3D MPC52=
xx_GPT_IS_WDT;
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (*on_boot_wdt > 0 &&
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mpc52xx_gpt_wdt_=
start(gpt, *on_boot_wdt) =3D=3D
>> 0)
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_info=
(gpt->dev,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0"running as wdt, timeout %us\n",
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0*on_boot_wdt);
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_info=
(gpt->dev, "reserved as wdt\n");
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_info(gpt->dev, "can =
function as wdt\n");
>> > + =A0 =A0 =A0 }
>> > +#endif
>>
>> Ditto on the #if/endif
>
> I don't think it can be removed here. =A0Think about the following:
> - user has a dtb with fsl,has-wdt and fsl,wdt-on-boot properties and
> - disables 5200 WDT in the kernel config.
>
> Now the system refuses to use GPT0 as GPT, although the WDT functionality=
 has been disabled. =A0Of course, the dts doesn't fit the kernel config now=
, but I think we should catch this case.

I think the behaviour should be consistent regardless of what support
is compiled into the kernel.  If the wdt-on-boot property is set, the
it does make sense for the kernel to never use it as a GPT.  Otherwise
the kernel behaviour becomes subtly different in ways non-obvious to
the user.

> Actually I tried to implement your requirements from <http://lists.ozlabs=
.org/pipermail/linuxppc-dev/2009-August/074595.html>:
> - fsl,has-wdt indicates that the GPT can serve as WDT;
> - any access through the wdt api to a wdt-capable gpt actually reserves i=
t as wdt;
> - the new of property forces reserving the wdt before any gpt api functio=
n has chance to grab it as gpt.
>
> Or did I get something wrong here?

No, you got it right...  Well, I can't even remember what I said
yesterday, but this list of requirements looks sane.  :-)

Cheers,
g.

-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
