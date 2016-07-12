From: Ian Arkver <ian.arkver.dev@gmail.com>
Subject: Re: [PATCH v3 3/9] DocBook/v4l: Add compressed video formats used on
 MT8173 codec driver
Date: Tue, 12 Jul 2016 20:31:10 +0100
Message-ID: <b2eb532d-5b22-8468-d74e-0b66b9fc69ee@gmail.com>
References: <1464611363-14936-1-git-send-email-tiffany.lin@mediatek.com>
 <1464611363-14936-2-git-send-email-tiffany.lin@mediatek.com>
 <1464611363-14936-3-git-send-email-tiffany.lin@mediatek.com>
 <1464611363-14936-4-git-send-email-tiffany.lin@mediatek.com>
 <5a793171-24a7-4e9e-8bfd-f668c789f8e0@xs4all.nl>
 <1468205771.3725.8.camel@mtksdaap41>
 <CAOMLVLiZU3D587dSyp2b2v4DV+MS9vh85bA4BoG7ddK6556rbA@mail.gmail.com>
 <1468350511.8843.16.camel@gmail.com> <1468350842.8843.18.camel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1468350842.8843.18.camel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nicolas@ndufresne.ca, =?UTF-8?B?V3UtQ2hlbmcgTGkgKOadjuWLmeiqoCk=?= <wuchengli@chromium.org>, tiffany lin <tiffany.lin@mediatek.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Hans Verkuil <hans.verkuil@cisco.com>, Daniel Thompson <daniel.thompson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Matthias Brugger <matthias.bgg@gmail.com>, Daniel Kurtz <djkurtz@chromium.org>, Pawel Osciak <posciak@chromium.org>, Eddie Huang <eddie.huang@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, Lin PoChun <PoChun.Lin@mediatek.com>
List-Id: devicetree@vger.kernel.org

On 12/07/16 20:14, Nicolas Dufresne wrote:
> Le mardi 12 juillet 2016 =C3=A0 15:08 -0400, Nicolas Dufresne a =C3=A9=
crit :
>> Le mardi 12 juillet 2016 =C3=A0 16:16 +0800, Wu-Cheng Li (=E6=9D=8E=E5=
=8B=99=E8=AA=A0) a =C3=A9crit :
>>> Decoder hardware produces MT21 (compressed). Image processor can
>>> convert it to a format that can be input of display driver.
>>> Tiffany.
>>> When do you plan to upstream image processor (mtk-mdp)?
>>>> It can be as input format for encoder, MDP and display drivers in
>>> our
>>>> platform.
>>> I remember display driver can only accept uncompressed MT21. Right?
>>> Basically V4L2_PIX_FMT_MT21 is compressed and is like an opaque
>>> format. It's not usable until it's decompressed and converted by
>>> image
>>> processor.
>> Previously it was described as MediaTek block mode, and now as a
>> MediaTek compressed format. It makes me think you have no idea what
>> this pixel format really is. Is that right ?
>>
>> The main reason why I keep asking, is that we often find similaritie=
s
>> between what vendor like to call their proprietary formats. Doing th=
e
>> proper research helps not creating a mess like in Android where you
>> have a lot of formats that all point to the same format. I believe
>> there was the same concern when Samsung wanted to introduce their Z-
>> flip-Z NV12 tile format. In the end they simply provided sufficient
>> documentation so we could document it and implement software
>> converters
>> for test and validation purpose.
> Here's the kind of information we want in the documentation.
>
> https://chromium.googlesource.com/chromium/src/media/+/master/base/vi=
de
> o_types.h#40
>
>    // MediaTek proprietary format. MT21 is similar to NV21 except the=
 memory
>    // layout and pixel layout (swizzles). 12bpp with Y plane followed=
 by a 2x2
>    // interleaved VU plane. Each image contains two buffers -- Y plan=
e and VU
>    // plane. Two planes can be non-contiguous in memory. The starting=
 addresses
>    // of Y plane and VU plane are 4KB alignment.
>    // Suppose image dimension is (width, height). For both Y plane an=
d VU plane:
>    // Row pitch =3D ((width+15)/16) * 16.
>    // Plane size =3D Row pitch * (((height+31)/32)*32)
>
> Now obviously this is incomplete, as the swizzling need to be documen=
ted of course.
Not sure where that chromium comment came from, but if MT21 really is=20
similar to NV21 (a 4:2:0 format) and has 2x2 downsampled chroma, then=20
the combined VU plane will be half the size of the Y plane.

Maybe that's not relevant to this discussion.

Regards,
Ian
>
>> regards,
>> Nicolas
> --
> To unsubscribe from this list: send the line "unsubscribe linux-media=
" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
