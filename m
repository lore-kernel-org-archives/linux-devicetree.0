From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 0/4 v2] of/overlay: sysfs based ABI for dt overlays
Date: Tue, 3 Jan 2017 14:11:08 +0200
Message-ID: <ADF59727-1808-4C9E-B763-FF1F493DAACE@konsulko.com>
References: <20161220190455.25115-1-xypron.glpk@gmx.de> <585C22BB.3080403@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <585C22BB.3080403-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Frank, Heinrich,

> On Dec 22, 2016, at 21:00 , Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> =
wrote:
>=20
> Hi Heinrich,
>=20
> On 12/20/16 11:04, Heinrich Schuchardt wrote:
>> Currently the kernel only supplies an internal API for creating
>> and destroying device tree overlays.
>>=20
>> For some boards vendor specific kernel modules exist for
>> managing device tree overlays but they have not been
>> upstreamed or upstreaming stalled.
>> https://lkml.org/lkml/2015/6/12/624
>> https://lkml.org/lkml/2013/1/7/366
>>=20
>> This patch series provides a sysfs based ABI for creation and
>> destruction of dt overlays in /sys/firmware/devicetree/overlays.
>>=20
>> The following files are provided:
>>=20
>> load:   This is a write only file.
>>        A string written to it is interpreted as the path to a
>>        flattened device tree overlay file. It is used to create
>>        and apply the contained overlays.
>>=20
>> loaded: This is a read only file.
>>        It provides the count of loaded overlays as a decimal
>>        number.
>>=20
>> unload: This is a write only file.
>>        If a positive number n is wrtten to this file the n
>>        most recent overlays are destroyed.
>>        If a negative number is written to this file all
>>        overlays are destroyed.
>=20
> This patch series follows a _somewhat_ similar approach to what
> was first proposed two years ago, and does not address the
> issues that were brought up at that time.  See:
>=20
>  From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
>  Date: Wed,  3 Dec 2014 13:23:28 +0200
>  Subject: [PATCH] OF: DT-Overlay configfs interface (v3)
>=20
> But just responding directly to the two year old issues would not
> be a productive approach, since there has been a lot of subsequent
> discussion on how to load overlays (you point to two of the many
> threads above).  The latest discussions are based on the concept
> of describing the overlay attachment points as connectors.
>=20
> Please join in pushing the connectors discussion along to make
> sure that it meets your needs.
>=20

I think it would be best if we focus on getting the configfs based =
loader
to work. It is pretty similar to what Heinrich is proposing.

> -Frank
>=20

Regards

=97 Pantelis

>=20
>>=20
>> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
>>=20
>> version 2:
>> 	change sysfs path to
>> 	/sys/firmware/devicetree/overlays
>>=20
>> 	Fix errors indicated by kbuild robot:
>> 	Add missing inline attribute to of_overlay_count
>> 	in patch 1.
>> 	Add 'select CONFIG_OF_EARLY_FLATTREE' to Kconfig
>> 	in patch 2.
>>=20
>> 	Change unit test cases to check new functions
>> 	of_overlay_count and of_overlay_destroy_last.
>>=20
>> Heinrich Schuchardt (4):
>>  of/overlay: add API function to count and pop last
>>  of/overlay: sysfs based ABI for dt overlays
>>  of/overlay: documentation for sysfs ABI=20
>>  of/overlay: test count and destroy_last
>>=20
>> .../ABI/testing/sysfs-firmware-devicetree-overlays |  24 +++=20
>> Documentation/devicetree/overlay-notes.txt         |   7 +-
>> drivers/of/Kconfig                                 |  15 ++
>> drivers/of/Makefile                                |   2 +=20
>> drivers/of/base.c                                  |   1 +=20
>> drivers/of/ov_sysfs.c                              | 223 =
+++++++++++++++++++++
>> drivers/of/overlay.c                               |  50 +++++
>> drivers/of/unittest.c                              |  15 +-
>> include/linux/of.h                                 |  12 ++
>> 9 files changed, 346 insertions(+), 3 deletions(-)
>> create mode 100644 =
Documentation/ABI/testing/sysfs-firmware-devicetree-overlays
>> create mode 100644 drivers/of/ov_sysfs.c

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
