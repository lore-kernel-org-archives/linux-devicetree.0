From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v4 1/6] rtc: sun6i: Add sun6i RTC driver
Date: Wed, 30 Jul 2014 17:33:49 +0800
Message-ID: <CAGb2v641zgGuV7NZSXprNgMCKCzejCT6UZhBSw6SUyrL5Ar4LA@mail.gmail.com>
References: <1406535661-25072-1-git-send-email-wens@csie.org>
 <1406535661-25072-2-git-send-email-wens@csie.org> <20140730085713.GX3952@lukather>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBEPY4KPAKGQEMVOTWMQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20140730085713.GX3952@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Varka Bhadram <varkabhadram-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, Jul 30, 2014 at 4:57 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> Hi Chen-Yu,
>
> On Mon, Jul 28, 2014 at 04:20:56PM +0800, Chen-Yu Tsai wrote:
>> This patch introduces the driver for the RTC in the Allwinner A31 and
>> A23 SoCs.
>>
>> Unlike the RTC found in A10/A20 SoCs, which was part of the timer, the
>> RTC in A31/A23 are a separate hardware block, which also contain a few
>> controls for the RTC block hardware (a regulator and RTC block GPIO pin
>> latches), while also having separate interrupts for the alarms.
>>
>> The hardware is different enough to make a different driver for it.
>>
>> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>> ---
>>  .../devicetree/bindings/rtc/sun6i-rtc.txt          |  17 +
>>  drivers/rtc/Kconfig                                |   7 +
>>  drivers/rtc/Makefile                               |   1 +
>>  drivers/rtc/rtc-sun6i.c                            | 447 +++++++++++++++++++++
>>  4 files changed, 472 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/rtc/sun6i-rtc.txt
>>  create mode 100644 drivers/rtc/rtc-sun6i.c
>>
>> diff --git a/Documentation/devicetree/bindings/rtc/sun6i-rtc.txt b/Documentation/devicetree/bindings/rtc/sun6i-rtc.txt
>> new file mode 100644
>> index 0000000..b7fb7a8
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/rtc/sun6i-rtc.txt
>> @@ -0,0 +1,17 @@
>> +* sun6i Real Time Clock
>> +
>> +RTC controller for the Allwinner A31
>> +
>> +Required properties:
>> +- compatible : Should be "allwinner,sun6i-a31-rtc"
>> +- reg                : physical base address of the controller and length of
>> +               memory mapped region.
>> +- interrupts : IRQ line for the RTC alarm 0.
>
> Even if we're using only one interrupt in the code, the hardware has
> two, so it would be great if you could ask for these two in the
> bindings.

Sure. It's just a minor change here and in the example:

- interrupts : IRQ lines for the RTC alarm 0 and alarm 1, in that order.

Varka, may I keep your Reviewed-by with the changes?

> Since it also impacts the DT patches I just merged, I dropped them,
> and will merge them as soon as they have the two interrupts listed.

I will send a new version later.

>> +
>> +Example:
>> +
>> +rtc: rtc@01f00000 {
>> +     compatible = "allwinner,sun6i-a31-rtc";
>> +     reg = <0x01f00000 0x54>;
>> +     interrupts = <0 40 4>;

Change:

        interrupts = <0 40 4>, <0 41 4>;

>> +};

[...]

> It looks nice otherwise.
>
> Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Thanks.

ChenYu
