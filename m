From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: berlin: enable SD card reader and eMMC
 for the BG2Q DMP
Date: Wed, 23 Apr 2014 19:43:22 +0200
Message-ID: <5357FBBA.6070107@gmail.com>
References: <1398155248-1659-1-git-send-email-antoine.tenart@free-electrons.com> <1398155248-1659-3-git-send-email-antoine.tenart@free-electrons.com> <5357F7BF.8000703@gmail.com> <20140423173631.GA10464@kwain>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140423173631.GA10464@kwain>
Sender: linux-kernel-owner@vger.kernel.org
To: =?ISO-8859-1?Q?Antoine_T=E9nart?= <antoine.tenart@free-electrons.com>
Cc: zmxu@marvell.com, jszhang@marvell.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, alexandre.belloni@free-electrons.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 04/23/2014 07:36 PM, Antoine T=E9nart wrote:
> On Wed, Apr 23, 2014 at 07:26:23PM +0200, Sebastian Hesselbarth wrote=
:
>> On 04/22/2014 10:27 AM, Antoine T=E9nart wrote:
>>> Enable the SD Card reader and the internal eMMC on the Berlin BG2Q =
DMP
>>> using two of the SDHCI nodes of the Berlin BG2Q.
>>>
>>> Signed-off-by: Antoine T=E9nart <antoine.tenart@free-electrons.com>
>>> ---
>>>  arch/arm/boot/dts/berlin2q-marvell-dmp.dts | 11 +++++++++++
>>>  1 file changed, 11 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/berlin2q-marvell-dmp.dts b/arch/arm/=
boot/dts/berlin2q-marvell-dmp.dts
>>> index 2da9c41e29d8..6ca8c9e52b08 100644
>>> --- a/arch/arm/boot/dts/berlin2q-marvell-dmp.dts
>>> +++ b/arch/arm/boot/dts/berlin2q-marvell-dmp.dts
>>> @@ -26,3 +26,14 @@
>>>  &uart0 {
>>>  	status =3D "okay";
>>>  };
>>> +
>>> +&sdhci1 {
>>
>> Antoine,
>>
>> nit: please sort referenced nodes alphabetically.
>>
>> With your comments about mmc aliases, I can take both patches
>> in now (and fixup ordering) if you like.
>=20
> You can take them.
>=20
> I talked with Jisheng about this and the plan is to make a following =
up
> series for the aliases since it will require to modify the subsystem.

Applied both patches to berlin/dt, with &uart0, &sdhci1, &sdhci2 sorted
alphabetically now.

Sebastian
