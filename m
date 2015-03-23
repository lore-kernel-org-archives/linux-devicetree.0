From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v5 08/12] mfd: axp20x: Add AXP22x regulator
 information to DT bindings
Date: Mon, 23 Mar 2015 10:43:04 -0700
Message-ID: <CAGb2v673WWV4q5eEGQF-nhX=Zq=ciD=yXgei-eZjKMWPDxKv4A@mail.gmail.com>
References: <1425988764-23618-1-git-send-email-wens@csie.org>
 <1425988764-23618-9-git-send-email-wens@csie.org> <20150323115425.GC24422@x1>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCMILY6JWQBBBQNBYGUAKGQEQE7RFGQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20150323115425.GC24422@x1>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 23, 2015 at 4:54 AM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Tue, 10 Mar 2015, Chen-Yu Tsai wrote:
>
>> Add the list of regulators for AXP22x to the DT bindings.
>> This includes the names and supply names.
>>
>> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/mfd/axp20x.txt | 27 +++++++++++++++++=
+++++++
>>  1 file changed, 27 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/axp20x.txt b/Document=
ation/devicetree/bindings/mfd/axp20x.txt
>> index 3914a3f91ff6..0fc2f1f35cef 100644
>> --- a/Documentation/devicetree/bindings/mfd/axp20x.txt
>> +++ b/Documentation/devicetree/bindings/mfd/axp20x.txt
>> @@ -49,6 +49,33 @@ LDO3               : LDO           : ldo3in-supply
>>  LDO4         : LDO           : ldo24in-supply        : shared supply
>>  LDO5         : LDO           : ldo5in-supply
>>
>> +
>
> Nit: I'm not keen on double line spacing.
>
>> +AXP221 regulators, type, and corresponding input supply names:
>> +
>> +Regulator      Type            Supply Name             Notes
>> +---------      ----            -----------             -----
>> +DCDC1                : DC-DC buck    : vin1-supply
>> +DCDC2                : DC-DC buck    : vin2-supply
>> +DCDC3                : DC-DC buck    : vin3-supply
>> +DCDC4                : DC-DC buck    : vin4-supply
>> +DCDC5                : DC-DC buck    : vin5-supply
>> +DC1SW                : On/Off Switch : dcdc1-supply          : DCDC1 se=
condary output
>> +DC5LDO               : LDO           : dcdc5-supply          : input fr=
om DCDC5
>> +ALDO1                : LDO           : aldoin-supply         : shared s=
upply
>> +ALDO2                : LDO           : aldoin-supply         : shared s=
upply
>> +ALDO3                : LDO           : aldoin-supply         : shared s=
upply
>> +DLDO1                : LDO           : dldoin-supply         : shared s=
upply
>> +DLDO2                : LDO           : dldoin-supply         : shared s=
upply
>> +DLDO3                : LDO           : dldoin-supply         : shared s=
upply
>> +DLDO4                : LDO           : dldoin-supply         : shared s=
upply
>> +ELDO1                : LDO           : eldoin-supply         : shared s=
upply
>> +ELDO2                : LDO           : eldoin-supply         : shared s=
upply
>> +ELDO3                : LDO           : eldoin-supply         : shared s=
upply
>> +LDO_IO0              : LDO           : ips-supply            : GPIO 0
>> +LDO_IO1              : LDO           : ips-supply            : GPIO 1
>> +RTC_LDO              : LDO           : ips-supply            : always o=
n
>> +
>> +
>
> Nit: I'm not keen on double line spacing.

Ok. I can get rid of them. IMHO it makes different sections clearer though.
I assume you don't want them in the original axp20x patches either?

ChenYu

>>  Example:
>>
>>  axp209: pmic@34 {
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
