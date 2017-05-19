From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [RFC PATCH 01/11] dt-bindings: update the binding
 for Allwinner H3 TVE support
Date: Sat, 20 May 2017 02:06:57 +0800
Message-ID: <ED64A56C-4FD3-4878-B67E-1501F20C7B8D@aosc.io>
References: <20170517164354.16399-1-icenowy@aosc.io> <20170517164354.16399-2-icenowy@aosc.io> <20170519180215.7lc7duueu74pt4kz@flea.home>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBSHI7TEAKGQEHUCG53I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170519180215.7lc7duueu74pt4kz-YififvaboMKzQB+pC5nmwQ@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2017=E5=B9=B45=E6=9C=8820=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=882:=
02:15, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> =E5=86=99=E5=88=B0:
>On Thu, May 18, 2017 at 12:43:44AM +0800, Icenowy Zheng wrote:
>> -On SoCs other than the A33 and V3s, there is one more clock
>required:
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
>> +   * allwinner,sun8i-h3-tcon0
>> +there is one more clock required:
>>     - 'tcon-ch1': The clock driving the TCON channel 1
>
>Putting ID's in the compatible name is usually a bad idea. What is the
>difference between the two? Only that the second one doesn't have a
>clock?

Yes.

>
>That seems highly unlikely. How does it generate the pixel clock
>frequency?

Yes it seems impossible, but it's also the fact.

There's only one CLK_TCON in H3/5, which is for TCON0.

It's possible that lcd-ch1 clk is CLK_TVE, but it's still a weird situation=
 --
Although we have a lcd-ch1 clock, we cannot touch it, otherwise
the TVE will refuse to work (the TVE can only work under 216MHz).

>
>Maxime

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
