From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add msm8916 CoreSight components
Date: Thu, 30 Apr 2015 07:03:31 -0600
Message-ID: <CANLsYkwaOe2b+Hytfkd18YbOXQcG7cdEi-HgZS1g_ZFpFDyMNQ@mail.gmail.com>
References: <1430310000-10867-1-git-send-email-ivan.ivanov@linaro.org>
	<1430310000-10867-3-git-send-email-ivan.ivanov@linaro.org>
	<CANLsYkxE9xieUW+OMgb4LbnJHRdCtTM=uzcwPzC6bs4x4pP3MA@mail.gmail.com>
	<1430385874.2400.13.camel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1430385874.2400.13.camel@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: "Ivan T. Ivanov" <ivan.ivanov@linaro.org>
Cc: Kumar Gala <galak@codeaurora.org>, Pratik Patel <pratikp@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 30 April 2015 at 03:24, Ivan T. Ivanov <ivan.ivanov@linaro.org> wrote:
>
> On Wed, 2015-04-29 at 10:49 -0600, Mathieu Poirier wrote:
>> On 29 April 2015 at 06:20, Ivan T. Ivanov ivanov@linaro.org> wrote:
>
>
>> > +
>> > +       funnel@821000 {
>> > +               compatible = "arm,coresight-funnel", "arm,primecell";
>> > +               reg = <0x821000 0x1000>;
>> > +
>> > +               clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
>> > +               clock-names = "apb_pclk", "atclk";
>> > +
>> > +               ports {
>> > +                       #address-cells = <1>;
>> > +                       #size-cells = <0>;
>> > +
>> > +                       port@4 {
>> > +                               reg = <4>;
>> > +                               funnel0_in4: endpoint {
>> > +                                       slave-mode;
>> > +                                       remote-endpoint = <&funnel1_out>;
>> > +                               };
>> > +                       };
>> > +                       port@8 {
>> > +                               reg = <0>;
>> > +                               funnel0_out: endpoint {
>> > +                                       remote-endpoint = <&etf_in>;
>> > +                               };
>> > +                       };
>>
>> Please add a comment indicating what the other ports are connected to.
>>
>> > +               };
>> > +       };
>> > +
>> > +       replicator@824000 {
>> > +               compatible = "qcom,coresight-replicator", "arm,primecell";
>> > +               reg = <0x824000 0x1000>;
>> > +
>> > +               clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
>> > +               clock-names = "apb_pclk", "atclk";
>> > +
>> > +               ports {
>> > +                       #address-cells = <1>;
>> > +                       #size-cells = <0>;
>> > +
>> > +                       port@0 {
>> > +                               reg = <0>;
>> > +                               replicator_out0: endpoint {
>> > +                                       remote-endpoint = <&etr_in>;
>> > +                               };
>> > +                       };
>> > +                       port@1 {
>> > +                               reg = <1>;
>> > +                               replicator_out1: endpoint {
>> > +                                       remote-endpoint = <&tpiu_in>;
>> > +                               };
>> > +                       };
>> > +                       port@2 {
>> > +                               reg = <0>;
>> > +                               replicator_in: endpoint {
>> > +                                       slave-mode;
>> > +                                       remote-endpoint = <&etf_out>;
>> > +                               };
>> > +                       };
>>
>> Same comment as with the funnel component.
>
> Sorry, but what do you mean here?

My bad - replicators have only one input port and two output ones.
Forget about this comments.

>
> Regards,
> Ivan
