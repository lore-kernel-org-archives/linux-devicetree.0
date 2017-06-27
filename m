From: Ziping Chen <techping.chan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: input: Add R_LRADC
 support for A83T
Date: Tue, 27 Jun 2017 23:18:17 +0800
Message-ID: <CAAST=9x+fS41tznuJ9hQ-cQxecKN751=61YkhEt31DvpeqeEcA@mail.gmail.com>
References: <20170624024515.4669-1-techping.chan@gmail.com>
 <20170624024515.4669-3-techping.chan@gmail.com> <20170626171524.cqfyasetpsfr6xfg@flea.lan>
Reply-To: techping.chan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCJ6PAPY4MPBBOXOZHFAKGQEWYC6JCA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170626171524.cqfyasetpsfr6xfg-ZC1Zs529Oq4@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

2017-06-27 1:15 GMT+08:00 Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:
> Hi,
>
> On Sat, Jun 24, 2017 at 10:45:14AM +0800, Ziping Chen wrote:
>> From: Ziping Chen <techping.chan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>
>> Allwinner A83T SoC has a low res adc like the one
>> in Allwinner A10 SoC.
>>
>> Add binding for it.
>>
>> Signed-off-by: Ziping Chen <techping.chan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt b/Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt
>> index 4357e498ef04..525d85e3043f 100644
>> --- a/Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt
>> +++ b/Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt
>> @@ -2,12 +2,14 @@ Allwinner sun4i low res adc attached tablet keys
>>  ------------------------------------------------
>>
>>  Required properties:
>> - - compatible: "allwinner,sun4i-a10-lradc-keys"
>> + - compatible: should be one of the following string:
>> +             "allwinner,sun4i-a10-lradc-keys"
>> +             "allwinner,sun8i-a83t-r-lradc-keys"
>
> This doesn't really have anything related to keys, and can be used
> purely as an ADC.
>
> I know this is the compatible that was used for the A10, but I'd
> rather drop the keys for the the new compatible.
>

Hi,
LRADC is named KEYADC in some other SoCs' User Manual(such as R40 User
Manual V1.0), thus LRADC is related to keys.

Without keys there is another driver named sun4i-gpadc-iio which is
located at driver/iio/adc/sun4i-gpadc-iio.c

Is my understanding right?

> Thanks!
> Maxime
>
> --
> Maxime Ripard, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
