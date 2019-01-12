From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [Letux-kernel] [PATCH RFC] bluetooth: add uart h4 devices via serdev/devicetree
Date: Sat, 12 Jan 2019 13:15:28 +0100
Message-ID: <A88AE17C-28B7-4CD9-9F3B-AD436A64460B@goldelico.com>
References: <20181110232034.17277-1-andreas@kemnade.info> <20181111024648.7rt7rlhaqihtqecv@earth.universe> <20181112215812.18ebca35@aktux> <2C74C837-A6D3-47C9-BE59-CCA594289B94@goldelico.com> <20181112222726.73m2oca7hankvcjs@earth.universe> <CABGGisxsdv+BTd5-HMzF8asEcWtL5F4CMzmkrBCwK=NibvqjLQ@mail.gmail.com> <20181113170128.0f59ef0e@kemnade.info> <86A3A2E6-FC89-42FE-8410-9C8273EC9CF7@holtmann.org> <20181116204601.4e1aa0de@kemnade.info> <09AFE47C-D188-4397-A2CD-C70FFAC3B677@holtmann.org> <20190104064403.325771fd@kemnade.info> <B5CEA49A-0F54-40C5-BCEA-7875BE1358E3@holtmann.org> <20190104205600.3e6b31c9@aktux> <CABdtJHuHrp6iPEWaCJ1_dMg0reED8ScKTjnW9aRa2JvMnHtH_A@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CABdtJHuHrp6iPEWaCJ1_dMg0reED8ScKTjnW9aRa2JvMnHtH_A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Nettleton <jon@solid-run.com>, Sean Wang <sean.wang@mediatek.com>
Cc: Andreas Kemnade <andreas@kemnade.info>, Marcel Holtmann <marcel@holtmann.org>, Rob Herring <robh@kernel.org>, Sebastian Reichel <sebastian.reichel@collabora.com>, devicetree <devicetree@vger.kernel.org>, Johan Hedberg <johan.hedberg@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-bluetooth@vger.kernel.org, letux-kernel@openphoenux.org
List-Id: devicetree@vger.kernel.org

Hi all,

> Am 12.01.2019 um 12:16 schrieb Jon Nettleton <jon@solid-run.com>:
>=20
> On Fri, Jan 4, 2019 at 8:57 PM Andreas Kemnade <andreas@kemnade.info> =
wrote:
>>=20
>> Hi Marcel,
>>=20
>> On Fri, 4 Jan 2019 10:07:34 +0100
>> Marcel Holtmann <marcel@holtmann.org> wrote:
>>=20
>>> Hi Andreas,
>>>=20
>>>>>>> Btw. I see nothing standing in the way of merging btuart.c =
driver and then go from there. Either I dig this out and submit or =
someone else does.
>>>>>>>=20
>>>>>> Do you mean this?
>>>>>> https://patchwork.kernel.org/patch/10490651/
>>>>>=20
>>>>> yes, that one.
>>>>>=20
>>>> Hmm, there seemed to be nothing in the pull requests regarding =
btuart.
>>>> Did you change plans?
>>>=20
>>> because I only submitted it as RFC. We can easily merge that one =
upstream since it is rather trivial. The main problem is how you want to =
do the device matching. Do you have a DT entry for your really simple =
devices?
>>>=20
>> Hmm, in that link it is non-rfc. So someone picked you rfc patch up =
and
>> submitted it?

I have researched a little the patchwork entry and it makes me think =
that Sean did post it as part of a series for MediaTek Bluetooth drivers =
to the mediatek mailing list (which is why we can find it in patchwork):

	=
https://patchwork.kernel.org/project/linux-mediatek/list/?series=3D&submit=
ter=3D169671&state=3D&q=3D%5Bv5&archive=3D&delegate=3D

It wasn't discussed there and some other patches of the series have been =
merged to other trees (e.g. for serdev core).

So I assume Sean is also waiting to get this patch upstream.

>> You might see what we are already doing here:
>> =
http://git.goldelico.com/?p=3Dletux-kernel.git;a=3Dblobdiff;f=3Darch/arm/b=
oot/dts/omap3-gta04.dtsi;h=3D4d2bac4293938de4a15a59979616909cf8842524;hp=3D=
bfced960d63ec40cf9db4901374b331737a9a168;hb=3Df78bf51754e35010de40518b9a8a=
148d0269bbc8;hpb=3Db6805813a9ab5b0d66b44cc54a0059eca4dd0a98
>>=20
>> We are using compatible =3D "wi2wi,w2cbw003-bluetooth"
>>=20
>> But I think we should also add a generic device string like
>> bluetooth,h4
>> So if people dig out older hardware, they can just add that to their
>> device trees and have bluetooth
>>=20
>> The full patchset we are currently using is here:
>> =
http://git.goldelico.com/?p=3Dletux-kernel.git;a=3Dshortlog;h=3Drefs/heads=
/letux/bluetooth-h4-serdev
>>=20
>> Regards,
>> Andreas
>=20
> Good timing for this thread.  I have just integrated the mynewt blehci
> firmware for the nina-b1 chip integrated onto our SOM.  This is
> exactly the functionality I need in the kernel to make the
> initialization seamless.  A generic device string is exactly what
> would be needed for most devices that are running in this
> configuration.  We may also want to have a generic reset_gpio handler.
>=20
> -Jon

BR,
Nikolaus
