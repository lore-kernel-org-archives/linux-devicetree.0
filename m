From: =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>
Subject: Re: [PATCH] ARM: dts: imx6dl-yapp4: Use rgmii-id phy mode on the cpu
 port
Date: Fri, 1 Mar 2019 07:29:37 +0100
Message-ID: <47d36e23-1113-56ff-e285-f9bd274004ff@ysoft.com>
References: <1550583420-112858-1-git-send-email-michal.vokac@ysoft.com>
 <20190301021344.GK26041@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190301021344.GK26041@dragon>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 01. 03. 19 3:13, Shawn Guo wrote:
> On Tue, Feb 19, 2019 at 02:37:00PM +0100, Michal Vokáč wrote:
>> The PHY must add delays to both Tx and Rx clock on the cpu port
>> to work propperly.
>>
>> It worked with the rgmii mode before beacause the qca8k driver
>> (incorrecly) enabled delays in that mode.
>>
>> Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
>> ---
>> This imx6dl-yapp4 platform is currently waiting in linux-next.
>>
>> Commit 5ecdd77c61c8 ("net: dsa: qca8k: disable delay for RGMII mode"), now
>> also in linux-next removed the delays from the RGMII mode so the networking
>> stopped working.
>>
>> Recently Koul submitted a patch that implements the rgmii-id mode to fix
>> the issue [1].
>>
>> As the networking is broken at this moment it does not matter which patch
>> goes in first. It is not neccessary to wait until the Koul's patch is
>> applied/merged if that should be the case.
>>
>> [1] http://patchwork.ozlabs.org/patch/1044505/
> 
> Can we have such useful info in the commit log in some proper form?

Sure, I will transplant relevant parts of the message into the commit
log. I just thought that most of this info will be outdated immediately
after applying.

BTW the patch[1] from Vinod is already merged.

Michal

>>
>>   arch/arm/boot/dts/imx6dl-yapp4-common.dtsi | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/imx6dl-yapp4-common.dtsi b/arch/arm/boot/dts/imx6dl-yapp4-common.dtsi
>> index b715ab0fa1ff..091d829f6b05 100644
>> --- a/arch/arm/boot/dts/imx6dl-yapp4-common.dtsi
>> +++ b/arch/arm/boot/dts/imx6dl-yapp4-common.dtsi
>> @@ -125,7 +125,7 @@
>>   				ethphy0: port@0 {
>>   					reg = <0>;
>>   					label = "cpu";
>> -					phy-mode = "rgmii";
>> +					phy-mode = "rgmii-id";
>>   					ethernet = <&fec>;
>>   
>>   					fixed-link {
>> -- 
>> 2.1.4
>>
