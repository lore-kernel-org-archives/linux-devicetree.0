From: Philippe Reynes <tremyfr@gmail.com>
Subject: Re: [PATCH] imx27: dt: only map 1 Kbyte for fec registers
Date: Wed, 13 May 2015 00:21:08 +0200
Message-ID: <55527CD4.6010208@gmail.com>
References: <1431204870-17233-1-git-send-email-tremyfr@gmail.com> <20150511120101.GA25495@tiger> <55511E34.5040908@gmail.com> <20150512070117.GV12671@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150512070117.GV12671@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?ISO-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>, mark.rutland@arm.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, linux-kernel@vger.kernel.org, robh+dt@kernel.org, kernel@pengutronix.de, galak@codeaurora.org, shawn.guo@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Uwe,

On 12/05/15 09:01, Uwe Kleine-K=F6nig wrote:
> Hello,
>
> On Mon, May 11, 2015 at 11:25:08PM +0200, Philippe Reynes wrote:
>> On 11/05/15 14:01, Shawn Guo wrote:
>>> On Sat, May 09, 2015 at 10:54:30PM +0200, Philippe Reynes wrote:
>>>> According to the imx27 documentation, fec has a 1 Kbyte
>>>> memory space map, spitted in two regions of 512 bytes.
>>>> The first one for control/status registers, and the
>>>> second one for event/statistic registers. So, we don't
>>>> need to map 16 Kbyte for registers, 1 Kbyte is enough.
>>>>
>>>> Signed-off-by: Philippe Reynes<tremyfr@gmail.com>
>>>> ---
>>>>   arch/arm/boot/dts/imx27.dtsi |    2 +-
>>>>   1 files changed, 1 insertions(+), 1 deletions(-)
>>>>
>>>> diff --git a/arch/arm/boot/dts/imx27.dtsi b/arch/arm/boot/dts/imx2=
7.dtsi
>>>> index 6951b66..56bb917 100644
>>>> --- a/arch/arm/boot/dts/imx27.dtsi
>>>> +++ b/arch/arm/boot/dts/imx27.dtsi
>>>> @@ -533,7 +533,7 @@
>>>>
>>>>   			fec: ethernet@1002b000 {
>>>>   				compatible =3D "fsl,imx27-fec";
>>>> -				reg =3D<0x1002b000 0x4000>;
>>>> +				reg =3D<0x1002b000 0x400>;
>>>
>>> No.  Per MCIMX27RM.pdf, Table 2-7. AIPI2 Memory Map, it should be 4=
KiB.
>>
>> I agree, this table show that 4KiB is reserved for fec registers.
>> But, in paragraph 29.6.1, there is :
>> "The FEC implementation requires a 1-Kbyte memory map space"
>> So I've thought that 1 Kbye is enough for the register memory space.
> The table 2-7 suggests that 4 KiB are routed to the fec even though t=
he
> fec module might only make use of the first 1 KiB. That's no
> contradiction. The convention used in the device trees is that the fi=
rst
> amount is used.

Ok, I understand, thanks for this explaination.

>> I'm pleased to understand that we're both agree that 16 Kbyte is too=
 large.
>>
>> If you prefer 4 Kbyte, I'll send a v2 of this patch with this value.
> Yes please. In the commit log you might want to point out that a leng=
th
> of 16 KiB overlaps with the (currently unused?) Security Controller
> (SCC) of the i.MX27.

I've send a new patch (v2 and v3) that map 4 Kbyte for fec registers on=
 imx27.

> Best regards
> Uwe

Best regards,
Philippe
