From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH v2 10/19] ARM: dts: aspeed: Add LPC Snoop device
Date: Wed, 20 Dec 2017 13:51:34 +1030
Message-ID: <CACPK8Xd2e=wDD7udyH9-mMuxXsRjCj8LDsosp=5b3e0iTJwA5A@mail.gmail.com>
References: <20171215062443.23059-1-joel@jms.id.au> <20171215062443.23059-11-joel@jms.id.au>
 <c5ef27de-34c1-f5e9-e4ae-e2709b004677@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c5ef27de-34c1-f5e9-e4ae-e2709b004677-Bxea+6Xhats@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg-Bxea+6Xhats@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, Patrick Venture <venture-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Xo Wang <xow-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Lei YU <mine260309-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-aspeed-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 18, 2017 at 7:46 PM, C=C3=A9dric Le Goater <clg-Bxea+6Xhats@public.gmane.org> wrote=
:
> On 12/15/2017 07:24 AM, Joel Stanley wrote:
>> LPC snoop hardware on the ASPEED BMC, used for monitoring
>> host I/O port activity.
>>
>> Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/aspeed-g4.dtsi | 7 +++++++
>>  arch/arm/boot/dts/aspeed-g5.dtsi | 6 ++++++
>>  2 files changed, 13 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed=
-g4.dtsi
>> index f6fee40c04c0..b3580f37f507 100644
>> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
>> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
>> @@ -236,6 +236,13 @@
>>                                               status =3D "disabled";
>>                                       };
>>
>> +                                     lpc_snoop: lpc-snoop@0 {
>> +                                             compatible =3D "aspeed,ast=
2500-lpc-snoop";
>
> it should be :
>
>         aspeed,ast2400-lpc-snoop
>
> a part from that :
>
> Reviewed-by: C=C3=A9dric Le Goater <clg-Bxea+6Xhats@public.gmane.org>

Fixed in v3.

Cheers,

Joel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
