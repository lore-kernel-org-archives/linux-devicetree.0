From: "Olimpiu Dejeu" <olimpiu-eV7fy4qpoLhpLGFMi4vTTA@public.gmane.org>
Subject: RE: [PATCH v10 3/3] backlight arcxcnn add support for ArcticSand devices
Date: Fri, 5 May 2017 13:06:00 -0400
Message-ID: <000001d2c5c1$e00500f0$a00f02d0$@arcticsand.com>
References: <1493823859-22402-1-git-send-email-olimpiu@arcticsand.com> <1493823859-22402-3-git-send-email-olimpiu@arcticsand.com> <20170505075712.xroroafofrkfxux4@dell>
Mime-Version: 1.0
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170505075712.xroroafofrkfxux4@dell>
Content-Language: en-us
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Lee Jones' <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Brian Dodge <bdodge-eV7fy4qpoLhpLGFMi4vTTA@public.gmane.org>, joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

>> backlight: Add support for Arctic Sand LED backlight driver chips

>This should be the subject line of the patch.

>Out of interest, how are you submitting your patches?

>If you're not already, you should be using:

 > `git format-patch ...`
 > `git send-email ...`
 =20
>> This driver provides support for the Arctic Sand arc2c0608 chip,=20
>>     and provides a framework to support future devices.

>'\n' here.

>> Reviewed-by: Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Signed-off-by: Olimpiu Dejeu <olimpiu-eV7fy4qpoLhpLGFMi4vTTA@public.gmane.org>

>Biggest point however is that this patch is already in Mainline.

The only reason for this set of patches is based on the request from Rob =
Herring for vendor name change from 'arc' to 'arctic'. Not sure how to =
proceed, please advise.
=20
>> ---
>> v9 =3D> v10:
>> - Per Rob Herring's request changed vendor-prefix to arctic
>> v8 =3D> v9:
>> - Addressing kbuild test robot WARNING: PTR_ERR_OR_ZERO can be used
>> v7 =3D> v8:
>> - Version updated to match other patch in set. No other changes.
>> v6 =3D> v7:
>> - Addressing issues brought up by Daniel Thompson
>> v5 =3D> v6:
>> - Addressing issues brought up by Daniel Thompson
>> v4 =3D> v5:
>> - Code style changes per Joe Perches and Jingoo Han
>> v3 =3D> v4:
>> - Code style changes per Joe Perches and Jingoo Han
>> v2 =3D> v3:
>> - Renamed variables to comply with conventions on naming
>> - Corrected device name in arcxcnn.h
>> v1 =3D> v2:
>> - Removed "magic numbers" to initialize registers
>> - Cleaned up device tree bindings
>> - Fixed code style to address comments and pass "checkpatch"
>> - Removed unneeded debug and testing code
>>=20
>>=20
>>  drivers/video/backlight/Kconfig      |   7 +
>>  drivers/video/backlight/Makefile     |   1 +
>>  drivers/video/backlight/arcxcnn_bl.c | 419=20
>> +++++++++++++++++++++++++++++++++++
>>  3 files changed, 427 insertions(+)
>>  create mode 100644 drivers/video/backlight/arcxcnn_bl.c
>>=20


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
