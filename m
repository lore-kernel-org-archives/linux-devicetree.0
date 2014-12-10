Return-Path: <varkabhadram@gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEUmHyZ+VqjzL4LkQozGJtnictPNXHYWM2qMKvD=LmfQdcT8iQ@mail.gmail.com>
References: <rjui@broadcom.com>
	<1418172891-19441-1-git-send-email-rjui@broadcom.com>
	<1418172891-19441-3-git-send-email-rjui@broadcom.com>
	<5487A2D6.8070901@gmail.com>
	<5487A4C9.2000604@broadcom.com>
	<CAEUmHyZ+VqjzL4LkQozGJtnictPNXHYWM2qMKvD=LmfQdcT8iQ@mail.gmail.com>
Date: Wed, 10 Dec 2014 08:58:26 +0530
Message-ID: <CAEUmHyZ86r=7KzJzfE9_upv45vN7geW9woqMkaGaBPwfp3xbMQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] i2c: iproc: Add Broadcom iProc I2C Driver
From: Varka Bhadram <varkabhadram@gmail.com>
Content-Type: multipart/alternative; boundary=001a11c33fccb063700509d440cb
To: Ray Jui <rjui@broadcom.com>
Cc: Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Christian Daudt <bcm@fixthebug.org>, Matt Porter <mporter@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@arm.linux.org.uk>, Scott Branden <sbranden@broadcom.com>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, bcm-kernel-feedback-list@broadcom.com, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--001a11c33fccb063700509d440cb
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 10, 2014 at 8:51 AM, Varka Bhadram <varkabhadram@gmail.com>
wrote:


> On Wed, Dec 10, 2014 at 7:11 AM, Ray Jui <rjui@broadcom.com> wrote:
>
>>
>>
>> On 12/9/2014 5:33 PM, Varka Bhadram wrote:
>>
>>>
>>> On Wednesday 10 December 2014 06:24 AM, Ray Jui wrote:
>>>
>>>> Add initial support to the Broadcom iProc I2C controller found in the
>>>> iProc family of SoCs.
>>>>
>>>> The iProc I2C controller has separate internal TX and RX FIFOs, each has
>>>> a size of 64 bytes. The iProc I2C controller supports two bus speeds
>>>> including standard mode (100kHz) and fast mode (400kHz)
>>>>
>>>> Signed-off-by: Ray Jui <rjui@broadcom.com>
>>>> Reviewed-by: Scott Branden <sbranden@broadcom.com>
>>>> ---
>>>>   drivers/i2c/busses/Kconfig         |    9 +
>>>>   drivers/i2c/busses/Makefile        |    1 +
>>>>   drivers/i2c/busses/i2c-bcm-iproc.c |  503
>>>> ++++++++++++++++++++++++++++++++++++
>>>>   3 files changed, 513 insertions(+)
>>>>   create mode 100644 drivers/i2c/busses/i2c-bcm-iproc.c
>>>>
>>>> (...)
>
> +static int bcm_iproc_i2c_probe(struct platform_device *pdev)
>>>> +{
>>>> +    int irq, ret = 0;
>>>> +    struct bcm_iproc_i2c_dev *dev;
>>>> +    struct i2c_adapter *adap;
>>>> +    struct resource *res;
>>>> +
>>>> +    dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
>>>> +    if (!dev)
>>>> +        return -ENOMEM;
>>>> +
>>>> +    platform_set_drvdata(pdev, dev);
>>>> +    dev->device = &pdev->dev;
>>>> +    init_completion(&dev->done);
>>>> +
>>>> +    res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>>> +    if (!res)
>>>> +        return -ENODEV;
>>>>
>>>
>>> We can remove this resource check. This checking will happen with
>>> devm_ioremap_resource()
>>>
>>>  Don't you need to obtain a valid resource and pass it into
>> devm_ioremap_resource? Without 'res' being assigned a valid resource,
>> devm_ioremap_resource will reject with "invalid resource".
>>
>>   platform_get_resource() will return a resource, checking on this
> resource is happening at
> http://lxr.free-electrons.com/source/lib/devres.c#L115. So no need to
> check it explicitly.
>
> If you check here it will be duplication of check with resource. Two times
> we are checking on
> the resource. No point of doing like that.
>
> Thanks.
>

See this: http://lxr.free-electrons.com/source/lib/devres.c#L102

-- 
Thanks and Regards,
Varka Bhadram.

--001a11c33fccb063700509d440cb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Dec 10, 2014 at 8:51 AM, Varka Bhadram <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:varkabhadram@gmail.com" target=3D"_blank">varkabhadram@gmai=
l.com</a>&gt;</span> wrote:<br><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><div cla=
ss=3D"gmail_quote"><span class=3D"">On Wed, Dec 10, 2014 at 7:11 AM, Ray Ju=
i <span dir=3D"ltr">&lt;<a href=3D"mailto:rjui@broadcom.com" target=3D"_bla=
nk">rjui@broadcom.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><div><div><br>
<br>
On 12/9/2014 5:33 PM, Varka Bhadram wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
On Wednesday 10 December 2014 06:24 AM, Ray Jui wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
Add initial support to the Broadcom iProc I2C controller found in the<br>
iProc family of SoCs.<br>
<br>
The iProc I2C controller has separate internal TX and RX FIFOs, each has<br=
>
a size of 64 bytes. The iProc I2C controller supports two bus speeds<br>
including standard mode (100kHz) and fast mode (400kHz)<br>
<br>
Signed-off-by: Ray Jui &lt;<a href=3D"mailto:rjui@broadcom.com" target=3D"_=
blank">rjui@broadcom.com</a>&gt;<br>
Reviewed-by: Scott Branden &lt;<a href=3D"mailto:sbranden@broadcom.com" tar=
get=3D"_blank">sbranden@broadcom.com</a>&gt;<br>
---<br>
=C2=A0 drivers/i2c/busses/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A0 9 +<br>
=C2=A0 drivers/i2c/busses/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A0 1 +<br>
=C2=A0 drivers/i2c/busses/i2c-bcm-iproc.c |=C2=A0 503<br>
++++++++++++++++++++++++++++++++++++<br>
=C2=A0 3 files changed, 513 insertions(+)<br>
=C2=A0 create mode 100644 drivers/i2c/busses/i2c-bcm-iproc.c<br>
<br></blockquote></blockquote></div></div></blockquote></span><div><span st=
yle=3D"font-family:monospace">(...) </span><br></div><span class=3D""></spa=
n><br><div><div class=3D"h5"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><div><div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
+static int bcm_iproc_i2c_probe(struct platform_device *pdev)<br>
+{<br>
+=C2=A0 =C2=A0 int irq, ret =3D 0;<br>
+=C2=A0 =C2=A0 struct bcm_iproc_i2c_dev *dev;<br>
+=C2=A0 =C2=A0 struct i2c_adapter *adap;<br>
+=C2=A0 =C2=A0 struct resource *res;<br>
+<br>
+=C2=A0 =C2=A0 dev =3D devm_kzalloc(&amp;pdev-&gt;dev, sizeof(*dev), GFP_KE=
RNEL);<br>
+=C2=A0 =C2=A0 if (!dev)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOMEM;<br>
+<br>
+=C2=A0 =C2=A0 platform_set_drvdata(pdev, dev);<br>
+=C2=A0 =C2=A0 dev-&gt;device =3D &amp;pdev-&gt;dev;<br>
+=C2=A0 =C2=A0 init_completion(&amp;dev-&gt;done);<br>
+<br>
+=C2=A0 =C2=A0 res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);<br>
+=C2=A0 =C2=A0 if (!res)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENODEV;<br>
</blockquote>
<br>
We can remove this resource check. This checking will happen with<br>
devm_ioremap_resource()<br>
<br>
</blockquote></div></div>
Don&#39;t you need to obtain a valid resource and pass it into devm_ioremap=
_resource? Without &#39;res&#39; being assigned a valid resource, devm_iore=
map_resource will reject with &quot;invalid resource&quot;.<div><div><br></=
div></div></blockquote></div></div><div>=C2=A0<span style=3D"font-family:mo=
nospace"> platform_get_resource() will return a resource, checking on this =
resource is happening at<br><a href=3D"http://lxr.free-electrons.com/source=
/lib/devres.c#L115" target=3D"_blank">http://lxr.free-electrons.com/source/=
lib/devres.c#L115</a>. So no need to check it explicitly.<br><br></span></d=
iv><div><span style=3D"font-family:monospace">If you check here it will be =
duplication of check with resource. Two times we are checking on<br></span>=
</div><div><span style=3D"font-family:monospace">the resource. No point of =
doing like that.<br><br></span></div><div><span style=3D"font-family:monosp=
ace">Thanks. <br></span></div></div></div></div>
</blockquote></div><br></div><div class=3D"gmail_extra"><span style=3D"font=
-family:monospace">See this: <a href=3D"http://lxr.free-electrons.com/sourc=
e/lib/devres.c#L102">http://lxr.free-electrons.com/source/lib/devres.c#L102=
</a></span><br clear=3D"all"></div><div class=3D"gmail_extra"><br>-- <br><d=
iv class=3D"gmail_signature"><div dir=3D"ltr"><div>Thanks and Regards,<br><=
/div>Varka Bhadram.<br></div></div>
</div></div>

--001a11c33fccb063700509d440cb--
