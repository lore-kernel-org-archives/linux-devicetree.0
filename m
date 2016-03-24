From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 0/2] power: reset: support for Atmel alternative
 Shutdown Controller
Date: Thu, 24 Mar 2016 09:53:38 +0100
Message-ID: <56F3AB12.20701@atmel.com>
References: <1458134390-23847-1-git-send-email-nicolas.ferre@atmel.com>
 <56F27B96.5010406@atmel.com> <20160323211144.GA31473@earth>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160323211144.GA31473@earth>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org
List-Id: devicetree@vger.kernel.org

Le 23/03/2016 22:11, Sebastian Reichel a =E9crit :
> Hi Nicolas,
>=20
> On Wed, Mar 23, 2016 at 12:18:46PM +0100, Nicolas Ferre wrote:
>> Le 16/03/2016 14:19, Nicolas Ferre a =E9crit :
>>> This is a series to add driver for a new Atmel Shutdown Controller.=
 This new IP
>>> is extensible and some features will be added later (see the TODO s=
ection).
>>> Its extensible nature led to write a new binding so that wake-up so=
urces can be
>>> described easily.
>>
>> I have the feeling that this series is ready. What do you think?
>=20
> I have see obvious problems with this series and plan to queue this

I would be reassured if a "not" was actually missing in the sentence
above... ;-)

Bye,

> after the merge window has closed. I give patches one more review
> while applying them, so at that point something might turn up.
>=20
>> So, do you want me to collect everybody's tags and send another vers=
ion
>> or you can do it yourself?
>=20
> I can collect the tags myself.
>=20
>> BTW, I will certainly send the device tree updates for the sama5d2 S=
oC,
>> but it will go through the AT91 then arm-soc git trees. No need for
>> further synchronization here.
>=20
> I will ignore the *.dts patches.
>=20
> -- Sebastian
>=20


--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
