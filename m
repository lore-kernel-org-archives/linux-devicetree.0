From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add msm8916 CoreSight components
Date: Fri, 8 May 2015 08:13:22 -0600
Message-ID: <CANLsYkyNYQf80c+8uMbZDr=kQ2YEOqy2aS8muEJsLsanDRGLOQ@mail.gmail.com>
References: <1431012969-16338-1-git-send-email-ivan.ivanov@linaro.org>
	<1431012969-16338-3-git-send-email-ivan.ivanov@linaro.org>
	<CANLsYkzNXBH0d6v1Ny_JwpW6NcKr9v0oAi9K3YfipwDgHWfMMA@mail.gmail.com>
	<1431092877.21307.18.camel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1431092877.21307.18.camel@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: "Ivan T. Ivanov" <ivan.ivanov@linaro.org>
Cc: Kumar Gala <galak@codeaurora.org>, Pratik Patel <pratikp@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 8 May 2015 at 07:47, Ivan T. Ivanov <ivan.ivanov@linaro.org> wrote:
>
> On Fri, 2015-05-08 at 07:38 -0600, Mathieu Poirier wrote:
>> On 7 May 2015 at 09:36, Ivan T. Ivanov ivanov@linaro.org> wrote:
>> > Add initial set of CoreSight components found on Qualcomm's 8x16 chipset.
>> >
>> >
>> > +       replicator@824000 {
>> > +               compatible = "qcom,coresight-replicator", "arm,primecell";
>>
>> Shouldn't it be "qcom,coresight-replicator1x" ?
>>
>
>
>
> True, I still wonder, why we have to have this compatible string?
> Drivers are probed by amba_id and "arm,primecell", after all.
>

Drivers have their own compatible strings for historical reasons,
something I've been meaning to fix for a long time now...

> Thanks,
> Ivan
