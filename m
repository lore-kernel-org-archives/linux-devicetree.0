From: Vineet Gupta <Vineet.Gupta1-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v3] ARC: [dts] Introduce Timer bindings
Date: Mon, 21 Mar 2016 05:02:36 +0000
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075F4E90A92@us01wembx1.internal.synopsys.com>
References: <20160317162421.GA21947@rob-hp-laptop>
 <1458278789-18924-1-git-send-email-vgupta@synopsys.com>
 <20160320004212.GA8061@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sunday 20 March 2016 06:12 AM, Rob Herring wrote:
> On Fri, Mar 18, 2016 at 10:56:29AM +0530, Vineet Gupta wrote:
>> ARC Timers have historically been probed directly.
>> As precursor to start probing Timers thru DT introduce these bindings
>> Note that to keep series bisectable, these bindings are not yet used in
>> code.
>>
>> Cc: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Signed-off-by: Vineet Gupta <vgupta-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
>> ---
>> v3:
>>  - Renamed Node name to avoid new warnings when unit address used w/o regs [Rob]
>> v2:
>>  - http://lists.infradead.org/pipermail/linux-snps-arc/2016-March/000653.html
>>  - snps,arc-timer[0-1] folded into single snps-arc-timer	[Rob]
>>  - Node name in DT example fixed:				[Rob]
>>      "timer1: timer_clksrc {" -> timer@1 {
>>  - Introduced 64bit RTC in skeleton_hs.dtsi			[Vineet]
>> v1:
>>  - http://lists.infradead.org/pipermail/linux-snps-arc/2016-February/000447.html
>> ---
>>  .../devicetree/bindings/timer/snps,arc-timer.txt   | 32 ++++++++++++++++++++++
>>  .../devicetree/bindings/timer/snps,archs-gfrc.txt  | 14 ++++++++++
>>  .../devicetree/bindings/timer/snps,archs-rtc.txt   | 14 ++++++++++
>>  arch/arc/boot/dts/abilis_tb10x.dtsi                | 14 ++++++++++
>>  arch/arc/boot/dts/skeleton.dtsi                    | 14 ++++++++++
>>  arch/arc/boot/dts/skeleton_hs.dtsi                 | 20 ++++++++++++++
>>  arch/arc/boot/dts/skeleton_hs_idu.dtsi             | 14 ++++++++++
>>  7 files changed, 122 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/timer/snps,arc-timer.txt
>>  create mode 100644 Documentation/devicetree/bindings/timer/snps,archs-gfrc.txt
>>  create mode 100644 Documentation/devicetree/bindings/timer/snps,archs-rtc.txt
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Thx a bunch Rob !

-Vineet
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
