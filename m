From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 1/4] dt: bindings: add bindings for
 Broadcom bcm43xx sdio devices
Date: Fri, 20 Jun 2014 16:27:24 +0200
Message-ID: <53A444CC.2080203@redhat.com>
References: <1402941407-8210-1-git-send-email-hdegoede@redhat.com> <1402941407-8210-2-git-send-email-hdegoede@redhat.com> <CAGVrzcZBzDTfnd6o0ib1FBvBK2VPNitS=rpb4jDkjF=T7Fy=DQ@mail.gmail.com> <539FE0EC.5090003@redhat.com> <539FF2FA.8050304@broadcom.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDRZXY4CYYORBWMJSGOQKGQEMMTJHRY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <539FF2FA.8050304-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:ATHEROS ATH5K WIR..." <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 06/17/2014 09:49 AM, Arend van Spriel wrote:
> On 17-06-14 08:32, Hans de Goede wrote:
>> Hi,
>>
>> On 06/16/2014 10:53 PM, Florian Fainelli wrote:
>>> 2014-06-16 10:56 GMT-07:00 Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>:
>>>> From: Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>>>>
>>>> The Broadcom bcm43xx sdio devices are fullmac devices that may be
>>>> integrated in ARM platforms. Currently, the brcmfmac driver for
>>>> these devices support use of platform data. This patch specifies
>>>> the bindings that allow this platform data to be expressed in the
>>>> devicetree.
>>>>
>>>> Reviewed-by: Hante Meuleman <meuleman-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>>>> Reviewed-by: Franky (Zhenhui) Lin <frankyl-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>>>> Reviewed-by: Daniel (Deognyoun) Kim <dekim-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>>>> Reviewed-by: Pieter-Paul Giesberts <pieterpg-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>>>> Signed-off-by: Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>>>> [hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org: drop clk / reg_on gpio handling, as there is no =
consensus
>>>>   on how to handle this yet]
>>>> [hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org: move from bindings/staging to bindings]
>>>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>>>> ---
>>>>   .../bindings/net/wireless/brcm,bcm43xx-fmac.txt    | 29 ++++++++++++=
++++++++++
>>>>   1 file changed, 29 insertions(+)
>>>>   create mode 100644 Documentation/devicetree/bindings/net/wireless/br=
cm,bcm43xx-fmac.txt
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/net/wireless/brcm,bcm43=
xx-fmac.txt b/Documentation/devicetree/bindings/net/wireless/brcm,bcm43xx-f=
mac.txt
>>>> new file mode 100644
>>>> index 0000000..6a0aaf2
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/net/wireless/brcm,bcm43xx-fmac=
.txt
>>>> @@ -0,0 +1,29 @@
>>>> +Broadcom BCM43xx Fullmac wireless SDIO devices
>>>> +
>>>> +This node provides properties for controlling the Broadcom wireless d=
evice. The
>>>> +node is expected to be specified as a child node to the SDIO controll=
er that
>>>> +connects the device to the system.
>>>> +
>>>> +Required properties:
>>>> +
>>>> + - compatible : Should be "brcm,bcm43xx-fmac".
>>>
>>> In general, the use of a wildcard compatible string is discouraged
>>> over the use of a more descriptive compatible string. So you should
>>> find out what is the first chip that is compatible, and use that
>>> compatible string as long as that compatibility remains.
>>
>> Right, Arend, what should we use then ?
>=20
> In earlier discussions, we ended up with this compatible string. The prop=
erties are generic enough to be covered by this 'wildcard' string. However,=
 I am not religious about it so if you feel strongly for an explicit string=
 it could be brcm,bcm4329-fmac, but it does not have my preference.

It is not something I really feel strong about, but as Florian
rightfully points out using wildcard strings is something which
is more or less not done in devicetree land, the idea being that
just using the lowest model, makes it easier to later add different
bindings for later models if that turns out to be necessary.

So I've changed the compatibility string to brcm,bcm4329-fmac for v3
of this patch-set.

Regards,

Hans

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
