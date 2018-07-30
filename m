From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH v3.1 08/10] dt-bindings: sun4i-drm: add HDMI
 VCC supply property for sun8i-dw-hdmi
Date: Tue, 31 Jul 2018 07:51:17 +0800
Message-ID: <F275EA55-B791-4EDC-8796-DB79E95D7008@aosc.io>
References: <20180726171257.6688-1-icenowy@aosc.io> <20180726171257.6688-9-icenowy@aosc.io> <20180730231244.GA3966@rob-hp-laptop>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBKGJ73NAKGQEZGHWOAQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180730231244.GA3966@rob-hp-laptop>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2018=E5=B9=B47=E6=9C=8831=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=887:=
12:44, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> =E5=86=99=E5=88=B0:
>On Fri, Jul 27, 2018 at 01:12:55AM +0800, Icenowy Zheng wrote:
>> Allwiner SoCs with DesignWare HDMI controller all come with a "HVCC"
>> pin, which is the VCC of HDMI part.
>>=20
>> Add a supply property to specify HVCC's regulator in the device tree.
>>=20
>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> ---
>> Changes in v3.1:
>> - New patch.
>>=20
>>  Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt | 3
>+++
>>  1 file changed, 3 insertions(+)
>>=20
>> diff --git
>a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
>b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
>> index fdb8fb29033f..cb4769913e89 100644
>> --- a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
>> +++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
>> @@ -97,6 +97,9 @@ Required properties:
>>      first port should be the input endpoint. The second should be
>the
>>      output, usually to an HDMI connector.
>> =20
>> +Optional properties:
>> +  - hdmi-supply: the VCC power supply of the controller
>
>"hdmi" doesn't sound like the name of the supply. "hvcc" or just "vcc"=20
>would be more appropriate.

Okay. In original versions it used to be "hvcc-supply", and
I will pick the name again.

>
>Rob
>
>_______________________________________________
>linux-arm-kernel mailing list
>linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
