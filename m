From: =?UTF-8?Q?Pablo_Sebasti=c3=a1n_Greco?= <pgreco-/kQrlZ55X3WoClj4AeEUq9i2O/JbrIOy@public.gmane.org>
Subject: Re: Re: [PATCH v5 2/7] ARM: dts: sun8i: v40:
 bananapi-m2-berry: Add GPIO pin-bank regulator supplies
Date: Thu, 2 May 2019 07:24:29 -0300
Message-ID: <c1bc4831-ba63-fd51-9e0c-7c988096b1f4@centosproject.org>
References: <1556040365-10913-1-git-send-email-pgreco@centosproject.org>
 <1556040365-10913-3-git-send-email-pgreco@centosproject.org>
 <20190502073815.56ktbpiieviqr4ss@flea>
Reply-To: pgreco-/kQrlZ55X3WoClj4AeEUq9i2O/JbrIOy@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBC53DWXR44JBBZEKVPTAKGQEE55VNMQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190502073815.56ktbpiieviqr4ss@flea>
Content-Language: en-US
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


El 2/5/19 a las 04:38, Maxime Ripard escribi=C3=B3:
> On Tue, Apr 23, 2019 at 02:25:59PM -0300, Pablo Greco wrote:
>> The bananapi-m2-berry has the PMIC providing voltage to all the pin-bank
>> supply rails from its various regulator outputs, tie them to the pio
>> node.
>>
>> Signed-off-by: Pablo Greco <pgreco-/kQrlZ55X3WoClj4AeEUq9i2O/JbrIOy@public.gmane.org>
>> ---
>>   arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts b/arch/ar=
m/boot/dts/sun8i-v40-bananapi-m2-berry.dts
>> index f05cabd..2cb2ce0 100644
>> --- a/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts
>> +++ b/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts
>> @@ -123,6 +123,16 @@
>>   	status =3D "okay";
>>   };
>>
>> +&pio {
>> +	pinctrl-names =3D "default";
> A pinctrl-names property without any other one?
>
> Looks good otherwise, thanks
> Maxime
Right, I'll move this to the patch that adds pinctrl-0
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
Pablo

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
