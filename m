From: Wei Xu <xuwei5@hisilicon.com>
Subject: Re: [PATCH v13 8/9] arm64: dts: hi6220: register debug module
Date: Mon, 5 Jun 2017 16:02:46 +0100
Message-ID: <59357296.7040707@hisilicon.com>
References: <1495727836-30094-1-git-send-email-leo.yan@linaro.org>
 <1495727836-30094-9-git-send-email-leo.yan@linaro.org>
 <59351771.5080807@hisilicon.com>
 <CANLsYkyGK7xwVczYEqP=bKuE1kOd7-ghCRX8L1t5BN4Am6SSiw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CANLsYkyGK7xwVczYEqP=bKuE1kOd7-ghCRX8L1t5BN4Am6SSiw@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Leo Yan <leo.yan@linaro.org>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, Mike Leach <mike.leach@li>
List-Id: devicetree@vger.kernel.org

Hi Mathieu,

On 2017/6/5 15:17, Mathieu Poirier wrote:
> On 5 June 2017 at 02:33, Wei Xu <xuwei5@hisilicon.com> wrote:
>> Hi Leo,
>>
>> On 2017/5/25 16:57, Leo Yan wrote:
>>> Bind debug module driver for Hi6220.
>>>
>>> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>>> Signed-off-by: Leo Yan <leo.yan@linaro.org>
>>
>> Thanks!
>> Fine to me.
>> Acked-by: Wei Xu <xuwei5@hisilicon.com>
>>
>> Hi Mathieu,
>>
>> Can you help to pick up this patch as well?
>> Thanks!
> 
> Sure - I'll add this to my tree.

Thanks!

BR,
Wei

> 
>>
>> Best Regards,
>> Wei
>>
>>> ---
>>>  arch/arm64/boot/dts/hisilicon/hi6220.dtsi | 64 +++++++++++++++++++++++++++++++
>>>  1 file changed, 64 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
>>> index 1e5129b..21805b9 100644
>>> --- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
>>> +++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
>>> @@ -916,5 +916,69 @@
>>>                               };
>>>                       };
>>>               };
>>> +
>>> +             debug@f6590000 {
>>> +                     compatible = "arm,coresight-cpu-debug","arm,primecell";
>>> +                     reg = <0 0xf6590000 0 0x1000>;
>>> +                     clocks = <&sys_ctrl HI6220_DAPB_CLK>;
>>> +                     clock-names = "apb_pclk";
>>> +                     cpu = <&cpu0>;
>>> +             };
>>> +
>>> +             debug@f6592000 {
>>> +                     compatible = "arm,coresight-cpu-debug","arm,primecell";
>>> +                     reg = <0 0xf6592000 0 0x1000>;
>>> +                     clocks = <&sys_ctrl HI6220_DAPB_CLK>;
>>> +                     clock-names = "apb_pclk";
>>> +                     cpu = <&cpu1>;
>>> +             };
>>> +
>>> +             debug@f6594000 {
>>> +                     compatible = "arm,coresight-cpu-debug","arm,primecell";
>>> +                     reg = <0 0xf6594000 0 0x1000>;
>>> +                     clocks = <&sys_ctrl HI6220_DAPB_CLK>;
>>> +                     clock-names = "apb_pclk";
>>> +                     cpu = <&cpu2>;
>>> +             };
>>> +
>>> +             debug@f6596000 {
>>> +                     compatible = "arm,coresight-cpu-debug","arm,primecell";
>>> +                     reg = <0 0xf6596000 0 0x1000>;
>>> +                     clocks = <&sys_ctrl HI6220_DAPB_CLK>;
>>> +                     clock-names = "apb_pclk";
>>> +                     cpu = <&cpu3>;
>>> +             };
>>> +
>>> +             debug@f65d0000 {
>>> +                     compatible = "arm,coresight-cpu-debug","arm,primecell";
>>> +                     reg = <0 0xf65d0000 0 0x1000>;
>>> +                     clocks = <&sys_ctrl HI6220_DAPB_CLK>;
>>> +                     clock-names = "apb_pclk";
>>> +                     cpu = <&cpu4>;
>>> +             };
>>> +
>>> +             debug@f65d2000 {
>>> +                     compatible = "arm,coresight-cpu-debug","arm,primecell";
>>> +                     reg = <0 0xf65d2000 0 0x1000>;
>>> +                     clocks = <&sys_ctrl HI6220_DAPB_CLK>;
>>> +                     clock-names = "apb_pclk";
>>> +                     cpu = <&cpu5>;
>>> +             };
>>> +
>>> +             debug@f65d4000 {
>>> +                     compatible = "arm,coresight-cpu-debug","arm,primecell";
>>> +                     reg = <0 0xf65d4000 0 0x1000>;
>>> +                     clocks = <&sys_ctrl HI6220_DAPB_CLK>;
>>> +                     clock-names = "apb_pclk";
>>> +                     cpu = <&cpu6>;
>>> +             };
>>> +
>>> +             debug@f65d6000 {
>>> +                     compatible = "arm,coresight-cpu-debug","arm,primecell";
>>> +                     reg = <0 0xf65d6000 0 0x1000>;
>>> +                     clocks = <&sys_ctrl HI6220_DAPB_CLK>;
>>> +                     clock-names = "apb_pclk";
>>> +                     cpu = <&cpu7>;
>>> +             };
>>>       };
>>>  };
>>>
>>
> 
> .
> 

