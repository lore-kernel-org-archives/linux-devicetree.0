From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 3/5] media: uapi: Add RGB bus formats for the GiantPlus
 GPM940B0 panel
Date: Mon, 08 Apr 2019 12:40:34 +0200
Message-ID: <1554720034.1893.1@crapouillou.net>
References: <20190314122622.7597-1-paul@crapouillou.net>
        <20190314122622.7597-3-paul@crapouillou.net> <20190403163259.GS5238@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190403163259.GS5238@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hans.verkuil@cisco.com>, od@zcrc.me, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Thierry,

Le mer. 3 avril 2019 =E0 18:32, Thierry Reding=20
<thierry.reding@gmail.com> a =E9crit :
> On Thu, Mar 14, 2019 at 01:26:20PM +0100, Paul Cercueil wrote:
>>  The GiantPlus GPM940B0 is a 24-bit TFT panel where the RGB=20
>> components
>>  are transferred sequentially on a 8-bit bus.
>>=20
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  ---
>>=20
>>  Notes:
>>      v2: New patch
>>=20
>>   include/uapi/linux/media-bus-format.h | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> Please make sure you Cc the media maintainers on this one when you=20
> send
> the next version. Adding them now.

Oops. Will do.

>>=20
>>  diff --git a/include/uapi/linux/media-bus-format.h=20
>> b/include/uapi/linux/media-bus-format.h
>>  index d6a5a3bfe6c4..f31724d6cd40 100644
>>  --- a/include/uapi/linux/media-bus-format.h
>>  +++ b/include/uapi/linux/media-bus-format.h
>>  @@ -34,7 +34,7 @@
>>=20
>>   #define MEDIA_BUS_FMT_FIXED			0x0001
>>=20
>>  -/* RGB - next is	0x101b */
>>  +/* RGB - next is	0x101d */
>>   #define MEDIA_BUS_FMT_RGB444_1X12		0x1016
>>   #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE	0x1001
>>   #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE	0x1002
>>  @@ -54,6 +54,8 @@
>>   #define MEDIA_BUS_FMT_RGB888_1X24		0x100a
>>   #define MEDIA_BUS_FMT_RGB888_2X12_BE		0x100b
>>   #define MEDIA_BUS_FMT_RGB888_2X12_LE		0x100c
>>  +#define MEDIA_BUS_FMT_RGB888_3X8_BE		0x101b
>>  +#define MEDIA_BUS_FMT_RGB888_3X8_LE		0x101c
>=20
> The list looks roughly sorted, but these are not. That said, there are
> others that don't seem like they are sorted either.

To me it looks like it's sorted alphabetically, that's why I
put the two new macros there.

> All the more important to get feedback from the media maintainers.
>=20
> Thierry

=
