From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [PATCH v2 1/3] devicetree: bindings: Document qcom,msm-id and qcom,board-id
Date: Tue, 10 Mar 2015 12:13:46 -0500
Message-ID: <F5017A7F-0EA2-41B3-A9DD-6123CCFD36FA@codeaurora.org>
References: <1425503602-24916-1-git-send-email-galak@codeaurora.org> <CAOesGMjpOx4SxY7j8jnoEwLG+mhPKB2st8qCb-hduHLOVw=RcQ@mail.gmail.com> <F9B276F7-61EF-4406-AB46-97D7F1ECEEFE@codeaurora.org> <89746055.qtEO3GZJmR@wuerfel>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <89746055.qtEO3GZJmR@wuerfel>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "arm@kernel.org" <arm@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, =?windows-1252?Q?Heiko_St=FCbner?= <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org


On Mar 9, 2015, at 7:11 AM, Arnd Bergmann <arnd@arndb.de> wrote:

> On Friday 06 March 2015 14:37:52 Kumar Gala wrote:
>> On Mar 6, 2015, at 1:15 PM, Olof Johansson <olof@lixom.net> wrote:
>>=20
>>> On Fri, Mar 6, 2015 at 8:08 AM, Kumar Gala <galak@codeaurora.org> w=
rote:
>>>>=20
>>>> On Mar 5, 2015, at 7:59 PM, Olof Johansson <olof@lixom.net> wrote:
>>>>=20
>>>>> On Thu, Mar 5, 2015 at 12:23 PM, Kumar Gala <galak@codeaurora.org=
> wrote:
>>>>>>=20
>>>>>> On Mar 5, 2015, at 1:42 PM, Kevin Hilman <khilman@kernel.org> wr=
ote:
>>>>>>=20
>>>>>>> Kumar Gala <galak@codeaurora.org> writes:
>>>>>>>=20
>>>>>>>> The top level qcom,msm-id and qcom,board-id are utilized by bo=
otloaders
>>>>>>>> on Qualcomm MSM platforms to determine which device tree shoul=
d be
>>>>>>>> utilized and passed to the kernel.
>>>>>>>>=20
>>>>>>>> Cc: <devicetree@vger.kernel.org>
>>>>>>>> Signed-off-by: Kumar Gala <galak@codeaurora.org>
>>>>>>>=20
>>>>>>> Is this the special magic that allows qcom bootloaders to take =
a kernel
>>>>>>> plus multiple DTBs and figure out which DTB to pass?
>>>>>>>=20
>>>>>>> Kevin
>>>>>>=20
>>>>>> yes
>>>>>=20
>>>>> That's a bummer.
>>>>>=20
>>>>> Luckily, the solution for upstream is still quite simple: Provide=
 only
>>>>> one devicetree, and it'll be used, right?
>>>>=20
>>>> We can provide only one, we still need the IDs in the DT.
>>>=20
>>> How are the DTS provided? Concatenated with the kernel, or in a
>>> wrapped data format? Or in a separate partition from the kernel?
>>=20
>> Its a wrapped data format that is than concatenated with the kernel =
if I remember correctly.
>=20
> Then you should be able to create a tool that can write this concaten=
ated
> format and insert these properties from a table that matches the boot
> loader, right?
>=20
> 	Arnd

Are you suggesting the tool insert the properties in the DT?  I=92m not=
 sure I understand what the point of doing that would be.

- k

--=20
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora For=
um,
a Linux Foundation Collaborative Project
