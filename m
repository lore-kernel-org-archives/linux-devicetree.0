From: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFCv2 2/3] dts: zynq: Add devicetree entry for Xilinx Zynq reset
 controller.
Date: Tue, 28 Jul 2015 09:44:38 +0200
Message-ID: <55B732E6.7080901@xilinx.com>
References: <1437783682-13632-1-git-send-email-moritz.fischer@ettus.com>
 <1437783682-13632-3-git-send-email-moritz.fischer@ettus.com>
 <55B5D62D.4010407@monstr.eu>
 <CAAtXAHepDRbiiznHnT3dLLLWS_VH2a9BhnNgZzDECx__QceEeg@mail.gmail.com>
 <55B72857.3020108@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55B72857.3020108-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Cc: p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, =?UTF-8?Q?S=c3=b6ren_Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 07/28/2015 08:59 AM, Nicolas Ferre wrote:
> Le 28/07/2015 07:03, Moritz Fischer a =C3=A9crit :
>> Hi Michal,
>>
>> I agree we need to be careful with changing the bindings.
>>
>> On Sun, Jul 26, 2015 at 11:56 PM, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org> wr=
ote:
>>> Hi Moritz,
>>>
>>> On 07/25/2015 02:21 AM, Moritz Fischer wrote:
>>>> Signed-off-by: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
>>>> ---
>>>>  arch/arm/boot/dts/zynq-7000.dtsi            | 43 ++++++++++++-
>>>
>>> This patch is nice in general but every change in binding should be
>>> discussed separately. There is also necessary to wire them up in th=
e
>>> driver to do action. That's why I think that will be the best just =
to
>>> add the code to slcr and keep others untouched.
>>
>> Ok, just to clarify: You'd suggest to just add the rstc as child nod=
e
>> to the slcr,
>> and leave the other nodes untouched?
>>
>>>
>>> For example MACB/GEM is one example. Adding names to this node and
>>> extending driver to work properly with reset means that all others =
MACB
>>> users will be affected. Definitely this patch should be ACKed by Ni=
colas.
>=20
> Actually, I don't know why a reset property should be added to the ma=
cb
> driver...

I expect resetting IP core can solve something. But as I said it is
questionable if IP should be reset when driver is probed. Definitely on
Zynq there is a support for it. I am not aware about any problem which
requires IP to be reset.

Thanks,
Michal

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
