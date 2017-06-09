From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: Re: [PATCH v2] arm64: allwinner: a64: Add initial
 NanoPi A64 support
Date: Fri, 9 Jun 2017 19:36:56 +0200
Message-ID: <f6763317-b970-529e-79af-947ba2dae9a2@suse.de>
References: <1497012052-14027-1-git-send-email-jteki@openedev.com>
 <1497012052-14027-2-git-send-email-jteki@openedev.com>
 <20170609145141.aknbsis25vmy3rj6@flea.home>
 <3049841d-36f0-a761-fbed-57971462697c@openedev.com>
 <3b4dda48-c403-88c4-5c89-63753f508d76@arm.com>
Reply-To: afaerber-l3A5Bk7waGM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCHMD3URUQDBBO5Z5PEQKGQESH4X7FQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <3b4dda48-c403-88c4-5c89-63753f508d76-5wv7dgnIgG8@public.gmane.org>
Content-Language: en-US
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org, Jagan Teki <jagannadh.teki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

Am 09.06.2017 um 17:36 schrieb Andre Przywara:
> On 09/06/17 16:26, Jagan Teki wrote:
>> On Friday 09 June 2017 08:21 PM, Maxime Ripard wrote:
>>> On Fri, Jun 09, 2017 at 12:40:52PM +0000, Jagan Teki wrote:
>>>> +&uart1 {
>>>> +    pinctrl-names =3D "default";
>>>> +    pinctrl-0 =3D <&uart1_pins>, <&uart1_rts_cts_pins>;
>>>> +    status =3D "okay";
>>>> +};
>>>
>>> And [what is connected] on that UART?
>>
>> uart1 for SDIO (Wifi connector, with RTS/CTS), this along with mmc1
>=20
> To be precise, UART1 (with h/w handshake) is connected to the Bluetooth
> part of the WiFi/BT chip, which is soldered on that board. Regardless of
> the actual *WiFi* support state BT should work already - at least it did
> when I tried this a few months ago on the Pine64 (although this involved
> some userland heavy lifting).
> Not sure what the approach here is in regard to the power supply and
> wake-up GPIOs, shall they be described in this node as well or is that
> up for userspace to control?

You should use a serdev based Bluetooth driver by adding a sub-node, and
it should take care of any reset GPIOs etc. for you. Question is which
driver is needed here and what state it is in.

Regards,
Andreas

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Norton
HRB 21284 (AG N=C3=BCrnberg)

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
