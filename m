From: Guodong Xu <guodong.xu@linaro.org>
Subject: Re: [PATCH] arm64: dts: hikey: extend default cma size to 128MB
Date: Thu, 25 Aug 2016 10:02:31 +0800
Message-ID: <CAFGCpxwQLhADWH9aZufgX8YhPF2T-63ZPv1GB6gK8w1dzTzN4w@mail.gmail.com>
References: <1472045710-15832-1-git-send-email-guodong.xu@linaro.org>
 <CAL_JsqJxE+fAbSsp=N7dvzvQiKwh3nM8-oSJH1OzV+KfW3w4jw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL_JsqJxE+fAbSsp=N7dvzvQiKwh3nM8-oSJH1OzV+KfW3w4jw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <rob.herring@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Xinliang Liu <xinliang.liu@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Wei Xu <xuwei5@hisilicon.com>, John Stultz <john.stultz@linaro.org>, Fathi Boudra <fathi.boudra@linaro.org>, Thierry Reding <treding@nvidia.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 24 August 2016 at 23:10, Rob Herring <robh+dt@kernel.org> wrote:
> On Wed, Aug 24, 2016 at 8:35 AM, Guodong Xu <guodong.xu@linaro.org> wrote:
>> To support display in Debian on HiKey, cma heap is used to allocate
>> graphic buffers. The default size of CMA is 16 MB which is not enought.
>
> s/enought/enough/
>
>>
>> Increase the default CMA size to 128 MB.
>>
>> cc: Rob Herring <rob.herring@linaro.org>
>> cc: Fathi Boudra <fathi.boudra@linaro.org>
>> cc: John Stultz <john.stultz@linaro.org>
>> cc: Xinliang Liu <xinliang.liu@linaro.org>
>> Signed-off-by: Guodong Xu <guodong.xu@linaro.org>
>> ---
>>  arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
>> index 4a51058..abb3434 100644
>> --- a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
>> +++ b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
>> @@ -45,6 +45,20 @@
>>                       <0x00000000 0x22000000 0x00000000 0x1c000000>;
>>         };
>>
>> +       reserved-memory {
>> +               #address-cells = <2>;
>> +               #size-cells = <2>;
>> +               ranges;
>> +
>> +               /* global autoconfigured region for contiguous allocations */
>> +               linux,cma {
>> +                       compatible = "shared-dma-pool";
>> +                       reusable;
>> +                       size = <0x00000000 0x08000000>;
>> +                       linux,cma-default;
>> +               };
>> +       };
>> +
>>         pstore: pstore@0x21f00000 {
>
> So what is upstream (as of 4.8) for ramoops also uses reserved-memory,
> so you should separately fix this.
>

Got it. I will fix and resend.

> Acked-by: Rob Herring <robh@kernel.org>
>

Thanks.
-Guodong


> Rob
