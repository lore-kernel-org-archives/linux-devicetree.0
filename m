From: Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: BCM5301X: Add support for TP-LINK Archer C5 V2
Date: Mon, 13 Mar 2017 15:27:37 -0400
Message-ID: <CAC3K-4oVhvZbeUFnBWRjc8rLHyipS1KDHX+r_2-AkkY0qZETvA@mail.gmail.com>
References: <20170311121453.18534-1-zajec5@gmail.com> <20170312171032.GK15842@lunn.ch>
 <437d898d-b0f4-a4b5-cb51-8ea88ba7a35a@milecki.pl> <20170313191416.GB10397@lunn.ch>
 <89081716-c0e3-236f-4291-e700dbedbd34@milecki.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <89081716-c0e3-236f-4291-e700dbedbd34-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Rafa?? Mi??ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 13, 2017 at 3:15 PM, Rafa=C5=82 Mi=C5=82ecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>=
 wrote:
> On 03/13/2017 08:14 PM, Andrew Lunn wrote:
>>
>> On Mon, Mar 13, 2017 at 07:48:26PM +0100, Rafa?? Mi??ecki wrote:
>>>
>>> On 03/12/2017 06:10 PM, Andrew Lunn wrote:
>>>>>
>>>>> +       chosen {
>>>>> +               bootargs =3D "console=3DttyS0,115200 earlycon";
>>>>
>>>>
>>>> Using bootargs to pass the serial settings has been deprecated for a
>>>> while. Please use stdout-path instead.
>>>
>>>
>>> I tried following patch with my SR400ac (I put Archer C5 aside for now)=
.
>>
>>
>> Hi Rafael
>>
>> Take a look at for example the bcm911360k.dts
>>
>>         aliases {
>>                 serial0 =3D &uart3;
>>         };
>>
>>         chosen {
>>                 stdout-path =3D "serial0:115200n8";
>>         };
>>
>> You need an alias to the serial device you want to us, and you should
>> list the speed, parity, bits etc.
>
>
> That was actually my first try (just with s/uart3/uart0) and I got the sa=
me
> problem.

I have a similar line in the bcm953012k.dts, and the serial there works for=
 me.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
