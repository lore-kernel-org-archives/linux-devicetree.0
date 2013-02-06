From: =?UTF-8?B?6rmA7Iq57Jqw?= <sw0312.kim@samsung.com>
Subject: Re: [PATCH v2 2/2] drm/exynos: Add device tree based discovery support
 for G2D
Date: Wed, 06 Feb 2013 20:21:38 +0900
Message-ID: <51123CC2.1020607@samsung.com>
References: <1360128584-23167-1-git-send-email-sachin.kamat@linaro.org>
 <1360128584-23167-2-git-send-email-sachin.kamat@linaro.org>
 <02a301ce043c$1b12d150$513873f0$%dae@samsung.com>
 <CAK9yfHyZrwdJV-Ct8Fby0uX1htHpAmJvCnX3VRYJSsey=L5HFA@mail.gmail.com>
 <02af01ce0447$37c26940$a7473bc0$%dae@samsung.com>
Reply-To: sw0312.kim@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <02af01ce0447$37c26940$a7473bc0$%dae@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: 'Sachin Kamat' <sachin.kamat@linaro.org>, kgene.kim@samsung.com, patches@linaro.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org, kyungmin.park@samsung.com, s.nawrocki@samsung.com, Linux Media Mailing List <linux-media@vger.kernel.org>, sw0312.kim@samsung.com, =?UTF-8?B?J+yLrOykgOyYgSc=?= <jy0922.shim@samsung.com>
List-Id: devicetree@vger.kernel.org



On 2013=EB=85=84 02=EC=9B=94 06=EC=9D=BC 17:51, Inki Dae wrote:
>=20
>=20
>> -----Original Message-----
>> From: Sachin Kamat [mailto:sachin.kamat@linaro.org]
>> Sent: Wednesday, February 06, 2013 5:03 PM
>> To: Inki Dae
>> Cc: linux-media@vger.kernel.org; dri-devel@lists.freedesktop.org;
>> devicetree-discuss@lists.ozlabs.org; k.debski@samsung.com;
>> s.nawrocki@samsung.com; kgene.kim@samsung.com; patches@linaro.org; A=
jay
>> Kumar
>> Subject: Re: [PATCH v2 2/2] drm/exynos: Add device tree based discov=
ery
>> support for G2D
>>
>> On 6 February 2013 13:02, Inki Dae <inki.dae@samsung.com> wrote:
>>>
>>> Looks good to me but please add document for it.
>>
>> Yes. I will. I was planning to send the bindings document patch alon=
g
>> with the dt patches (adding node entries to dts files).
>> Sylwester had suggested adding this to
>> Documentation/devicetree/bindings/media/ which contains other media
>> IPs.
>=20
> I think that it's better to go to gpu than media and we can divide Ex=
ynos
> IPs into the bellow categories,
>=20
> Media : mfc
> GPU : g2d, g3d, fimc, gsc
> Video : fimd, hdmi, eDP, MIPI-DSI

Hm, here is another considering point. Some device can be used as one o=
f
two sub-system. For example g2d can be used as V4L2 driver or DRM
driver. And more specific case, multiple fimc/gsc deivces can be
separately used as both drivers: two fimc devices are used as V4L2
driver and other devices are used as DRM driver.
Current discussion, without change of build configuration, device can b=
e
only used as one driver.

So I want to discuss about how we can bind device and driver just with
dts configuration.

IMO, there are two options.

=46irst, driver usage is set on configurable node.
	g2d: g2d {
		compatible =3D "samsung,exynos4212-g2d";
                ...
                *subsystem =3D "v4l2"* or *subsystem =3D "drm"*
	};
Node name and type is just an example to describe.
With this option, driver which is not matched with subsystem node shoul=
d
return with fail during its probing.

Second, using dual compatible strings.
	g2d: g2d {
		*compatible =3D "samsung,exynos4212-v4l2-g2d"; or
                compatible =3D "samsung,exynos4212-v4l2-g2d";*
                ...
	};
String is just an example so don't mind if it is ugly. Actually, with
this option, compatible string has non HW information. But this option
does not need fail in probing.

I'm not sure these options are fit to DT concept. Please let me know if
anyone has idea.

Best Regards,
- Seung-Woo Kim

>=20
> And I think that the device-tree describes hardware so possibly, all
> documents in .../bindings/drm/exynos/* should be moved to proper plac=
e also.
> Please give  me any opinions.
>=20
> Thanks,
> Inki Dae
>=20
>>
>>>
>>> To other guys,
>>> And is there anyone who know where this document should be added to=
?
>>> I'm not sure that the g2d document should be placed in
>>> Documentation/devicetree/bindings/gpu, media, drm/exynos or arm/exy=
nos.
>> At
>>> least, this document should be shared with the g2d hw relevant driv=
ers
>> such
>>> as v4l2 and drm. So is ".../bindings/gpu" proper place?
>>>
>>
>>
>> --
>> With warm regards,
>> Sachin
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20
