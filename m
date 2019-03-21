Return-Path: <SRS0=Xkv+=RY=vger.kernel.org=devicetree-owner@kernel.org>
Received: from uho.ysoft.cz ([81.19.3.130]:48160 "EHLO uho.ysoft.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727923AbfCUMo3 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 21 Mar 2019 08:44:29 -0400
Subject: Re: PM: RE: [PATCH] ARM: dts: imx6dl-yapp4: Use correct pseudo PHY
 address for the switch
References: <1553080145-29348-1-git-send-email-michal.vokac@ysoft.com>
 <3351685.tXMZElDEK0@debian64>
From: =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>
Message-ID: <517b0bc6-9128-02be-7adb-7da286a0c00d@ysoft.com>
Date: Thu, 21 Mar 2019 13:44:26 +0100
MIME-Version: 1.0
In-Reply-To: <3351685.tXMZElDEK0@debian64>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Christian Lamparter <chunkeey@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Christian,

I added all the original recipients back to your PM as we may get some
useful feedback from someone.

On 21. 03. 19 0:17, Christian Lamparter wrote:
> On Wednesday, March 20, 2019 12:09:05 PM CET you wrote:
>> The switch is accessible through pseudo PHY which is located at 0x10.
> 
> It doesn't look like your patch made it to the device-tree patchwork?!
> (Maybe your @ysoft.com is blacklisted or something else is broken?)

I am aware of that and I am quite sure my mail is not blacklisted.
I submitted quite some patches recently and some of those made it to
the device-tree patchwork with no problem. I've got the impression that
only patches that modify something inside Documentation/devicetree/ are
visible there (but I do not really know how the system works).

@Rob, would you mind to shortly clarify how this works?

> Also I don't think devicetree-tree would merge it. I think the best bet
> would be to resent the mail and include netdev mailing list and everyone
> from the get_maintainer.pl output:

I always use the get_maintainter.pl script to get some initial list and
then I apply common sense to shrink/broaden the list to which people and
lists send the patches.

> Shawn Guo <shawnguo@kernel.org> (maintainer:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE)
> Sascha Hauer <s.hauer@pengutronix.de> (maintainer:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE)
> Pengutronix Kernel Team <kernel@pengutronix.de> (reviewer:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE)
> Fabio Estevam <festevam@gmail.com> (reviewer:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE)
> NXP Linux Team <linux-imx@nxp.com> (reviewer:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE)
> devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
> linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE)

In this case this is really trivial patch so I think bothering all those
people is not necessary. In my case the script actually reports more
items then what you posted.

I added you, Florian and Andrew just because I tripped around your patch
that fixes the device tree example of the qca8k binding and this change
is related to it.

I actually expect the patch to be picked by Shawn (AFAIK he takes care
of the imx device trees).

@Shawn, if my expectation is wrong, please correct me.

Anyway, thanks a lot for your comments Christian!

Best regards,
Michal

>> Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
>> ---
>>   arch/arm/boot/dts/imx6dl-yapp4-common.dtsi | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/imx6dl-yapp4-common.dtsi b/arch/arm/boot/dts/imx6dl-yapp4-common.dtsi
>> index 091d829f6b05..e8d800fec637 100644
>> --- a/arch/arm/boot/dts/imx6dl-yapp4-common.dtsi
>> +++ b/arch/arm/boot/dts/imx6dl-yapp4-common.dtsi
>> @@ -114,9 +114,9 @@
>>   			reg = <2>;
>>   		};
>>   
>> -		switch@0 {
>> +		switch@10 {
>>   			compatible = "qca,qca8334";
>> -			reg = <0>;
>> +			reg = <10>;
>>   
>>   			switch_ports: ports {
>>   				#address-cells = <1>;
>>
