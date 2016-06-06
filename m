From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v3 0/6] Add R8A7794/SILK sound DT support
Date: Mon, 6 Jun 2016 21:11:17 +0300
Message-ID: <b77ad169-c9d1-4d67-0973-fc9639ddb613@cogentembedded.com>
References: <2378837.cigT3tNQPe@wasted.cogentembedded.com>
 <7d19e749-8264-9004-64f4-aefabda699c6@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <7d19e749-8264-9004-64f4-aefabda699c6@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello.

On 05/13/2016 12:16 AM, Sergei Shtylyov wrote:

>>    Here's the set of 6 patches against Simon Horman's 'renesas.git' repo,
>> 'renesas-devel-20160509-v4.6-rc7' tag. I'm adding the sound device tree support
>> for the R8A7794 SoC based SILK board.
>>
>> [1/6] ARM: dts: r8a7794: add audio clocks
>> [2/6] ARM: dts: r8a7794: add MSTP5 clocks
>> [3/6] ARM: dts: r8a7794: add MSTP10 clocks
>> [4/6] ARM: dts: r8a7794: add Audio-DMAC support
>> [5/6] ARM: dts: r8a7794: add sound support
>> [6/6] ARM: dts: silk: add sound support
>
>    Oops, forgot to mention that patch #5 depends on the R-Car sound patch
> posted yesterday in order to get interpreted as intended (it uses a disabled
> SRC node).

   Simon, that patch has already hit Linus' tree but this series seems to be 
stuck. Please merge!

WBR, Sergei
