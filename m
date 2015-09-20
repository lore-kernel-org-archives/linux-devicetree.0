From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 1/3] mfd: axp20x: Rename supply names for
 AXP221 DC1SW and DC5LDO regulators
Date: Sun, 20 Sep 2015 18:17:34 +0800
Message-ID: <CAGb2v65pPzZsb0X5WQ6-X9tEqvNYYGPiLrKxR18+nZ0P4R-VCA@mail.gmail.com>
References: <1442372732-27434-1-git-send-email-wens@csie.org>
 <1442372732-27434-2-git-send-email-wens@csie.org> <20150920041722.GI3039@x1>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCMILY6JWQBBBV4P7KXQKGQE5QXIG3I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20150920041722.GI3039@x1>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Lee,

On Sun, Sep 20, 2015 at 12:17 PM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Wed, 16 Sep 2015, Chen-Yu Tsai wrote:
>
>> The DC1SW and DC5LDO regulators in the AXP221 are internally chained
>> to DCDC1 and DCDC5, hence the names. The original bindings used the
>> parent regulator names for the supply regulator property. This causes
>> some confusion when we actually use it in the dts:
>>
>>       axp221 {
>>               /* self supplying? */
>>               dcdc1-supply =3D <&dcdc1>;
>>               dcdc5-supply =3D <&dcdc5>;
>>
>>               dcdc1: dcdc1 {
>>                       ...
>>               };
>>
>>               dcdc5: dcdc5 {
>>                       ...
>>               };
>>       };
>>
>> Change them to the downstream regulator names, or "dc1sw" and "dc5ldo"
>> respectively.
>>
>> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/mfd/axp20x.txt | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> Applied, thanks.

Mark (in his reply) has a point. If these are internally connect, we
should just remove them from the bindings, and associate them in the
driver.

I'm looking into this. In the mean time, could you drop this one?

Thanks
ChenYu

>> diff --git a/Documentation/devicetree/bindings/mfd/axp20x.txt b/Document=
ation/devicetree/bindings/mfd/axp20x.txt
>> index 41811223e5be..8e79252b1e7c 100644
>> --- a/Documentation/devicetree/bindings/mfd/axp20x.txt
>> +++ b/Documentation/devicetree/bindings/mfd/axp20x.txt
>> @@ -60,8 +60,8 @@ DCDC2               : DC-DC buck    : vin2-supply
>>  DCDC3                : DC-DC buck    : vin3-supply
>>  DCDC4                : DC-DC buck    : vin4-supply
>>  DCDC5                : DC-DC buck    : vin5-supply
>> -DC1SW                : On/Off Switch : dcdc1-supply          : DCDC1 se=
condary output
>> -DC5LDO               : LDO           : dcdc5-supply          : input fr=
om DCDC5
>> +DC1SW                : On/Off Switch : dc1sw-supply          : DCDC1 se=
condary output
>> +DC5LDO               : LDO           : dc5ldo-supply         : input fr=
om DCDC5
>>  ALDO1                : LDO           : aldoin-supply         : shared s=
upply
>>  ALDO2                : LDO           : aldoin-supply         : shared s=
upply
>>  ALDO3                : LDO           : aldoin-supply         : shared s=
upply
>
> --
> Lee Jones
> Linaro STMicroelectronics Landing Team Lead
> Linaro.org =E2=94=82 Open source software for ARM SoCs
> Follow Linaro: Facebook | Twitter | Blog

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
