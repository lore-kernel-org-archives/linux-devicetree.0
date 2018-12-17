Return-Path: <SRS0=pUvx=O2=cogentembedded.com=sergei.shtylyov@kernel.org>
Subject: Re: [PATCH 06/17] arm64: dts: renesas: r8a774c0: Add MSIOF nodes
References: <1544780260-27590-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1544780260-27590-7-git-send-email-fabrizio.castro@bp.renesas.com>
 <f6834dd2-7a2d-5ca9-0961-2c992ce22002@cogentembedded.com>
 <TY1PR01MB17700E941C41403A2EEF3DE6C0BC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <ae733707-ebab-b85f-c1ab-71bc87339a9f@cogentembedded.com>
Date: Mon, 17 Dec 2018 19:46:03 +0300
MIME-Version: 1.0
In-Reply-To: <TY1PR01MB17700E941C41403A2EEF3DE6C0BC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Mark Rutland <mark.rutland@arm.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On 12/17/2018 07:36 PM, Fabrizio Castro wrote:

[...]
>>> Add the device nodes for all MSIOF SPI controllers on RZ/G2E SoC.
>>>
>>> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
>>> ---
>>>  arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 62 +++++++++++++++++++++++++++++++
>>>  1 file changed, 62 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
>>> index 9532d29..9bd66b1 100644
>>> --- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
>>> +++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
>>> @@ -855,6 +855,68 @@
>>>  status = "disabled";
>>>  };
>>>
>>> +msiof0: spi@e6e90000 {
>>> +compatible = "renesas,msiof-r8a774c0",
>>> +     "renesas,rcar-gen3-msiof";
>>> +reg = <0 0xe6e90000 0 0x0064>;
>>
>>    Do we really need the leading zeros in the size cells?
> 
> We don't, I just kept it consistent with the same definitions for the other platforms.
> Do you want me to send a v2 for this?

   Ah, consistency is good. Keep it then. :-)

MBR, Sergei
