Return-Path: <SRS0=gbhc=KZ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:46504 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727575AbeHJPAi (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 10 Aug 2018 11:00:38 -0400
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH] arm64: dts: renesas: salvator-common: adv748x: Override
 secondary addresses
References: <20180807155933.3732-1-kieran.bingham@ideasonboard.com>
 <20180810120111.k35v6mbm7ryvhpvx@verge.net.au>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <2bf8e52a-27fa-4f64-09bf-44cd0f0b43c2@ideasonboard.com>
Date: Fri, 10 Aug 2018 13:30:48 +0100
MIME-Version: 1.0
In-Reply-To: <20180810120111.k35v6mbm7ryvhpvx@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Simon,

On 10/08/18 13:01, Simon Horman wrote:
> On Tue, Aug 07, 2018 at 04:59:33PM +0100, Kieran Bingham wrote:
>> Ensure that the ADV748x device addresses do not conflict, and group them
>> together (visually in i2cdetect)
> 
> Hi Kieran,
> 
> could you help me out with some pointers on how to correlate this
> with the HW documentation?

Not easily :) - Except for the 'main' address (0x70), these are not
addresses documented by the datasheet. <by the very nature of the
activity>. The driver supports the DT providing the slave pages to
allocate. One day the I2C framework might allow us to 'request' an
unused page :D

I performed a scan on the Salvator-X, (i2cdetect -r -y 4) and identified
a region of unused I2C address space to allocate the 12 pages so that
they did not conflict.

In particular, the address <0x30> which is the default for the CBUS page
conflicts with the default address of the OV10635 used by the GMSL
cameras on the same bus, and so I needed to move that one.

To make the effects clear, (and the i2cdetect reporting more obvious) I
chose to reassign all of the movable pages so that it is clear they are
from the same device.

Rather annoyingly it's difficult to map a slave page back to it's driver
due to the fact that it gets registered as a 'dummy' driver, so keeping
the related addresses together is quite valuable.

As soon as I get some free cycles, I plan to look at being able to map
extra driver information to dummy I2C registrations to make it easier to
identify who owns the address :)

--
Regards

Kieran





>>
>> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
>> ---
>>  arch/arm64/boot/dts/renesas/salvator-common.dtsi | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
>> index 5cfb9b99de89..2eba743c5c3f 100644
>> --- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
>> @@ -414,7 +414,10 @@
>>  
>>  	video-receiver@70 {
>>  		compatible = "adi,adv7482";
>> -		reg = <0x70>;
>> +		reg = <0x70 0x71 0x72 0x73 0x74 0x75
>> +		       0x60 0x61 0x62 0x63 0x64 0x65>;
>> +		reg-names = "main", "dpll", "cp", "hdmi", "edid", "repeater",
>> +			    "infoframe", "cbus", "cec", "sdp", "txa", "txb" ;
>>  
>>  		#address-cells = <1>;
>>  		#size-cells = <0>;
>> -- 
>> 2.17.1
>>

-- 
Regards
--
Kieran
