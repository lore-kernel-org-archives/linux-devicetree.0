From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: Re: [PATCH 4/5] arm64: dts: renesas: ulcb: Add HDMI output connector
Date: Mon, 10 Jul 2017 19:28:57 +0300
Message-ID: <fbc99ea5-cfbb-5fcf-9162-7358fe4d667c@cogentembedded.com>
References: <1499394976-14201-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1499395056-14375-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <2531734.5WngiEmILA@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <2531734.5WngiEmILA@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Laurent,

Thank you for the review!

On 10.07.2017 16:09, Laurent Pinchart wrote:
> Hi Vladimir,
>
> Thank you for the patch.
>
> On Friday 07 Jul 2017 05:37:36 Vladimir Barinov wrote:
>> From: Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>
>>
>> The ULCB board has one HDMI output connector.
>>
>> This connector is available on both the H3 and M3-W ULCB boards.
>> Add this to the ulcb.dtsi file.
>>
>> Signed-off-by: Vladimir Barinov
>> <vladimir.barinov+renesas@cogentembedded.com> ---
>>   arch/arm64/boot/dts/renesas/ulcb.dtsi | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi
>> b/arch/arm64/boot/dts/renesas/ulcb.dtsi index 6f0a7ca..fc5408d 100644
>> --- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
>> @@ -34,6 +34,17 @@
>>   		clock-frequency = <11289600>;
>>   	};
>>
>> +	hdmi0-out {
>> +		compatible = "hdmi-connector";
>> +		label = "HDMI0 OUT";
> As far as I know there is no "HDMI0 OUT" label on the board or casing. You can
> remove the label property. Apart from that,
I was thinking that this is a label on schematic.

ULCB has similar schematic label as first HDMI connector on Salvator-X  
"HDMI output(HDMI0)", hence I've just copied label name from Salvator-X 
file.

Right, there is no such name on ULCB pcb or plastic cover.

Is it okay If I resend only one patch with label field removed?

Regards,
Vladimir
