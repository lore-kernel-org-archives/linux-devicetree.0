From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [PATCH v2 1/3] devicetree: bindings: Document qcom,msm-id and qcom,board-id
Date: Tue, 10 Mar 2015 14:57:47 -0500
Message-ID: <7DA73171-01A5-4158-9A69-015B62D2D7E8@codeaurora.org>
References: <1425503602-24916-1-git-send-email-galak@codeaurora.org> <CAOesGMjJXyjNH-Lm66mZXq0X=52DyRtdmpvQ4sFEr0cMAp3b-w@mail.gmail.com> <3A588B25-66ED-4BB5-8C8F-D050D8A2F9F3@codeaurora.org> <10886228.vUHyKm1ubP@wuerfel>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <10886228.vUHyKm1ubP@wuerfel>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "arm@kernel.org" <arm@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, =?windows-1252?Q?Heiko_St=FCbner?= <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org


On Mar 10, 2015, at 2:52 PM, Arnd Bergmann <arnd@arndb.de> wrote:

> On Tuesday 10 March 2015 13:10:08 Kumar Gala wrote:
>>>>>>>>>>> The top level qcom,msm-id and qcom,board-id are utilized by=
 bootloaders
>>>>>>>>>>>> on Qualcomm MSM platforms to determine which device tree s=
hould be
>>>>>>>>>>>> utilized and passed to the kernel.
>>>>>>>>>>>>=20
>>>>>>>>>>>> Cc: <devicetree@vger.kernel.org>
>>>>>>>>>>>> Signed-off-by: Kumar Gala <galak@codeaurora.org>
>>>>>>>>>>>=20
>>>>>>>>>>> Is this the special magic that allows qcom bootloaders to t=
ake a kernel
>>>>>>>>>>> plus multiple DTBs and figure out which DTB to pass?
>>>>>>>>>>>=20
>>>>>>>>>>> Kevin
>>>>>>>>>>=20
>>>>>>>>>> yes
>>>>>>>>>=20
>>>>>>>>> That's a bummer.
>>>>>>>>>=20
>>>>>>>>> Luckily, the solution for upstream is still quite simple: Pro=
vide only
>>>>>>>>> one devicetree, and it'll be used, right?
>>>>>>>>=20
>>>>>>>> We can provide only one, we still need the IDs in the DT.
>>>>>>>=20
>>>>>>> How are the DTS provided? Concatenated with the kernel, or in a
>>>>>>> wrapped data format? Or in a separate partition from the kernel=
?
>>>>>>=20
>>>>>> Its a wrapped data format that is than concatenated with the ker=
nel if I remember correctly.
>>>>>=20
>>>>> Then you should be able to create a tool that can write this conc=
atenated
>>>>> format and insert these properties from a table that matches the =
boot
>>>>> loader, right?
>>>>>=20
>>>>>     Arnd
>>>>=20
>>>> Are you suggesting the tool insert the properties in the DT?  I=92=
m not sure I understand what the point of doing that would be.
>>>=20
>>> To insert platform-local properties that mean nothing outside of th=
e
>>> firmware packaging of the device trees, which is the case here?
>>>=20
>>> I think the idea of having the installer script inserting them is
>>> quite reasonable in this case.
>>>=20
>>>=20
>>> -Olof
>>=20
>> These values are static, so not sure what the point of having the in=
staller script do that?
>>=20
>=20
> It combines two hacks to work around a nonstandard boot loader.
> Once the bootloader is fixed, you can stop using that script.
>=20
> 	Arnd

I feel as if I=92m missing something here.  If we just have the propert=
ies in the .dts files I don=92t need to change anything ever, no script=
, no worries about working with old or new boot loaders, etc.

- k

--=20
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora For=
um,
a Linux Foundation Collaborative Project
