From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [PATCH v2 1/3] devicetree: bindings: Document qcom,msm-id and qcom,board-id
Date: Tue, 10 Mar 2015 13:10:08 -0500
Message-ID: <3A588B25-66ED-4BB5-8C8F-D050D8A2F9F3@codeaurora.org>
References: <1425503602-24916-1-git-send-email-galak@codeaurora.org> <CAOesGMjpOx4SxY7j8jnoEwLG+mhPKB2st8qCb-hduHLOVw=RcQ@mail.gmail.com> <F9B276F7-61EF-4406-AB46-97D7F1ECEEFE@codeaurora.org> <89746055.qtEO3GZJmR@wuerfel> <F5017A7F-0EA2-41B3-A9DD-6123CCFD36FA@codeaurora.org> <CAOesGMjJXyjNH-Lm66mZXq0X=52DyRtdmpvQ4sFEr0cMAp3b-w@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <CAOesGMjJXyjNH-Lm66mZXq0X=52DyRtdmpvQ4sFEr0cMAp3b-w@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "arm@kernel.org" <arm@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, =?windows-1252?Q?Heiko_St=FCbner?= <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org

>>>>>>>>> The top level qcom,msm-id and qcom,board-id are utilized by b=
ootloaders
>>>>>>>>>> on Qualcomm MSM platforms to determine which device tree sho=
uld be
>>>>>>>>>> utilized and passed to the kernel.
>>>>>>>>>>=20
>>>>>>>>>> Cc: <devicetree@vger.kernel.org>
>>>>>>>>>> Signed-off-by: Kumar Gala <galak@codeaurora.org>
>>>>>>>>>=20
>>>>>>>>> Is this the special magic that allows qcom bootloaders to tak=
e a kernel
>>>>>>>>> plus multiple DTBs and figure out which DTB to pass?
>>>>>>>>>=20
>>>>>>>>> Kevin
>>>>>>>>=20
>>>>>>>> yes
>>>>>>>=20
>>>>>>> That's a bummer.
>>>>>>>=20
>>>>>>> Luckily, the solution for upstream is still quite simple: Provi=
de only
>>>>>>> one devicetree, and it'll be used, right?
>>>>>>=20
>>>>>> We can provide only one, we still need the IDs in the DT.
>>>>>=20
>>>>> How are the DTS provided? Concatenated with the kernel, or in a
>>>>> wrapped data format? Or in a separate partition from the kernel?
>>>>=20
>>>> Its a wrapped data format that is than concatenated with the kerne=
l if I remember correctly.
>>>=20
>>> Then you should be able to create a tool that can write this concat=
enated
>>> format and insert these properties from a table that matches the bo=
ot
>>> loader, right?
>>>=20
>>>      Arnd
>>=20
>> Are you suggesting the tool insert the properties in the DT?  I=92m =
not sure I understand what the point of doing that would be.
>=20
> To insert platform-local properties that mean nothing outside of the
> firmware packaging of the device trees, which is the case here?
>=20
> I think the idea of having the installer script inserting them is
> quite reasonable in this case.
>=20
>=20
> -Olof

These values are static, so not sure what the point of having the insta=
ller script do that?

- k

--=20
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora For=
um,
a Linux Foundation Collaborative Project
