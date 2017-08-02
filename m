From: icenowy-h8G6r0blFSE@public.gmane.org
Subject: Re: [PATCH 01/13] dt-bindings: update the binding for
 Allwinner H3 DE2 support
Date: Wed, 02 Aug 2017 13:02:39 +0800
Message-ID: <d6c7c6de29be2674ad6b37b184d1df7f@aosc.io>
References: <20170801131304.7741-1-icenowy@aosc.io>
 <20170801131304.7741-2-icenowy@aosc.io> <79034825.lnfmIyYlWl@jernej-laptop>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRB5NZQXGAKGQEDXIULAY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <79034825.lnfmIyYlWl@jernej-laptop>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

=E5=9C=A8 2017-08-02 12:53=EF=BC=8CJernej =C5=A0krabec =E5=86=99=E9=81=93=
=EF=BC=9A
> Hi Icenowy,
>=20
> Dne torek, 01. avgust 2017 ob 15:12:52 CEST je Icenowy Zheng=20
> napisal(a):
>> Allwinner H3 features a "Display Engine 2.0".
>>=20
>> Add device tree bindings for the following parts:
>> - H3 TCONs
>> - H3 Mixers
>> - H3 Display engine
>>=20
>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> ---
>>  .../bindings/display/sunxi/sun4i-drm.txt           | 25
>> ++++++++++++++++++---- 1 file changed, 21 insertions(+), 4=20
>> deletions(-)
>>=20
>> diff --git=20
>> a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
>> b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt index
>> 2ee6ff0ef98e..92512953943e 100644
>> --- a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
>> +++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
>> @@ -87,18 +87,17 @@ Required properties:
>>     * allwinner,sun6i-a31-tcon
>>     * allwinner,sun6i-a31s-tcon
>>     * allwinner,sun8i-a33-tcon
>> +   * allwinner,sun8i-h3-tcon
>>     * allwinner,sun8i-v3s-tcon
>>   - reg: base address and size of memory-mapped region
>>   - interrupts: interrupt associated to this IP
>>   - clocks: phandles to the clocks feeding the TCON. Three are needed:
>>     - 'ahb': the interface clocks
>> -   - 'tcon-ch0': The clock driving the TCON channel 0
>>   - resets: phandles to the reset controllers driving the encoder
>>     - "lcd": the reset line for the TCON channel 0
>>=20
>>   - clock-names: the clock names mentioned above
>>   - reset-names: the reset names mentioned above
>> - - clock-output-names: Name of the pixel clock created
>>=20
>>  - ports: A ports node with endpoint definitions as defined in
>>    Documentation/devicetree/bindings/media/video-interfaces.txt. The
>> @@ -112,7 +111,23 @@ Required properties:
>>    channel the endpoint is associated to. If that property is not
>>    present, the endpoint number will be used as the channel number.
>>=20
>> -On SoCs other than the A33 and V3s, there is one more clock required:
>> +For the following compatibles:
>> +   * allwinner,sun5i-a13-tcon
>> +   * allwinner,sun6i-a31-tcon
>> +   * allwinner,sun6i-a31s-tcon
>> +   * allwinner,sun8i-a33-tcon
>> +   * allwinner,sun8i-v3s-tcon
>> +there is one more clock and one more property required:
>> + - clocks:
>> +   - 'tcon-ch0': The clock driving the TCON channel 0
>> + - clock-output-names: Name of the pixel clock created
>> +
>> +For the following compatibles:
>> +   * allwinner,sun5i-a13-tcon
>> +   * allwinner,sun6i-a31-tcon
>> +   * allwinner,sun6i-a31s-tcon
>> +   * allwinner,sun8i-h3-tcon
>> +there is one more clock required:
>>     - 'tcon-ch1': The clock driving the TCON channel 1
>>=20
>>  DRC
>> @@ -207,6 +222,8 @@ supported.
>>  Required properties:
>>    - compatible: value must be one of:
>>      * allwinner,sun8i-v3s-de2-mixer
>> +    * allwinner,sun8i-h3-de2-mixer0
>> +    * allwinner,sun8i-h3-de2-mixer1
>=20
> About that, I concur with Maxime here, plane number properties would be
> better. If we don't do this now, we will never have it.

But I still prefer different compatibles, as the capabilities are=20
already
proven to be different between mixer0 and mixer1, and furtherly we=20
cannot
promise Allwinner won't add more functions only available at mixer0.

Then we will be trapped into a situation that we describe more and more
functions via properties, but they should be encoded into the=20
compatible.

>=20
> Reference:
> http://lists.infradead.org/pipermail/linux-arm-kernel/2017-June/512902.ht=
ml
>=20
> Regards,
> Jernej

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
