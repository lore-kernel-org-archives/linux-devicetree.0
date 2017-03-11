From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: BCM5301X: Add support for TP-LINK Archer C5 V2
Date: Sat, 11 Mar 2017 18:27:00 +0100
Message-ID: <CACna6rzxaqnLShMQRovv4Cr5s6XKSG0NQ2RRrQ+TeePt59bG7A@mail.gmail.com>
References: <20170311121453.18534-1-zajec5@gmail.com> <20170311172309.GC15842@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170311172309.GC15842-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>, Rafa?? Mi??ecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Andrew,

On 11 March 2017 at 18:23, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org> wrote:
> On Sat, Mar 11, 2017 at 01:14:53PM +0100, Rafa?? Mi??ecki wrote:
>> From: Rafa?? Mi??ecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
>>
>> This is BCM47081A0 based home router with BCM43217 and BCM4352 wireless
>> chipsets.
>
> Have you made any progress with the Ethernet switch? Does anybody know
> if it is compatible with the SF2/B53 DSA driver?
>
> I have a DIR 860l v1 router, using the same chipset. I'm interested in
> the switch, given my DSA maintainer role.

I mostly work with LEDE. Just few days ago I managed get kernel 4.9
running stable (there was a memory corruption caused by iproc PCIe
controller driver). With kernel 4.9 I can finally start testing b53. I
should have some news withing new weeks.

--=20
Rafa=C5=82
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
