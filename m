From: Philippe Reynes <tremyfr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] rtc: mxc: add a second clock
Date: Mon, 18 May 2015 23:57:19 +0200
Message-ID: <555A603F.7000005@gmail.com>
References: <1431729330-7625-1-git-send-email-tremyfr@gmail.com> <1431729330-7625-2-git-send-email-tremyfr@gmail.com> <5559CC85.5040703@melag.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5559CC85.5040703-d/C+FbuhHiA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Enrico Weigelt, metux IT consult" <weigelt-d/C+FbuhHiA@public.gmane.org>
Cc: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Enrico,

On 18/05/15 13:27, Enrico Weigelt, metux IT consult wrote:
> Am 16.05.2015 um 00:35 schrieb Philippe Reynes:
>> The mxc RTC needs two clocks, one for the input
>> reference, and one for the IP. But this driver
>> was only using one clock (for the reference).
>> This patch add the second clock (for the IP).
>
>
> Does this also apply to MX53, or just MX21 ?

I don't found this rtc on mx53 manual. The mx53 seems to use rtc-imxdi.=
c.
So, I think it's just for mx21.

Regards,
Philippe
 =20
> greetings,
> --
> Enrico Weigelt, metux IT consult
> +49-151-27565287
> MELAG Medizintechnik oHG Sitz Berlin Registergericht AG Charlottenbur=
g HRA 21333 B
>
> Wichtiger Hinweis: Diese Nachricht kann vertrauliche oder nur f=C3=BC=
r einen begrenzten Personenkreis bestimmte Informationen enthalten. Sie=
 ist ausschlie=C3=9Flich f=C3=BCr denjenigen bestimmt, an den sie geric=
htet worden ist. Wenn Sie nicht der Adressat dieser E-Mail sind, d=C3=BC=
rfen Sie diese nicht kopieren, weiterleiten, weitergeben oder sie ganz =
oder teilweise in irgendeiner Weise nutzen. Sollten Sie diese E-Mail ir=
rt=C3=BCmlich erhalten haben, so benachrichtigen Sie bitte den Absender=
, indem Sie auf diese Nachricht antworten. Bitte l=C3=B6schen Sie in di=
esem Fall diese Nachricht und alle Anh=C3=A4nge, ohne eine Kopie zu beh=
alten.
> Important Notice: This message may contain confidential or privileged=
 information. It is intended only for the person it was addressed to. I=
f you are not the intended recipient of this email you may not copy, fo=
rward, disclose or otherwise use it or any part of it in any form whats=
oever. If you received this email in error please notify the sender by =
replying and delete this message and any attachments without retaining =
a copy.

  s
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
