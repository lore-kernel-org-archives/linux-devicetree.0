From: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Subject: Re: Re: [PATCH v6 2/3] ARM: sun7i/sun6i: dts: Add NMI
 irqchip support
Date: Mon, 17 Mar 2014 15:13:25 +0100
Message-ID: <CAOQ7t2b5w7P_pNPJPkfSfx-N8adSqe_bv1xPRLh0pEUg1P=68w@mail.gmail.com>
References: <1394890861-18347-1-git-send-email-carlo@caione.org>
	<1394890861-18347-3-git-send-email-carlo@caione.org>
	<20140317133057.GK27873@lukather>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDWJTUUC5UCBBMEGTSMQKGQEHHGJT2A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20140317133057.GK27873@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 17, 2014 at 2:30 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> On Sat, Mar 15, 2014 at 02:41:00PM +0100, Carlo Caione wrote:
>> This patch adds DTS entries for NMI controller as child of GIC.
>>
>> Signed-off-by: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/sun6i-a31.dtsi | 9 +++++++++
>>  arch/arm/boot/dts/sun7i-a20.dtsi | 9 +++++++++
>>  2 files changed, 18 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/sun6i-a31.dtsi b/arch/arm/boot/dts/sun6i-a31.dtsi
>> index 5256ad9..4a5050c 100644
>> --- a/arch/arm/boot/dts/sun6i-a31.dtsi
>> +++ b/arch/arm/boot/dts/sun6i-a31.dtsi
>> @@ -190,6 +190,15 @@
>>               #size-cells = <1>;
>>               ranges;
>>
>> +             nmi_intc: sc-nmi-intc@01f00c0c {
>
> It should be interrupt-controller@01f00c0c, according to the ePAPR.

Ok

>> +                     compatible = "allwinner,sun6i-a31-sc-nmi";
>
> I'm curious, what is the "sc" for?

It stands for System Control (in the datasheet the NMI controller is
included in a block named System Controller)

>> +                     interrupt-controller;
>> +                     #interrupt-cells = <2>;
>> +                     reg = <0x01f00c0c 0x38>;
>> +                     interrupt-parent = <&gic>;
>
> This is actually the default.

I'll delete it.

>> +                     interrupts = <0 0 4>;
>> +             };
>> +
>
> Thanks!
> Maxime

Thank you,

-- 
Carlo Caione
