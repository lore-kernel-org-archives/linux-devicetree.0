From: Bjorn Andersson <bjorn@kryo.se>
Subject: Re: [PATCH v2 1/2] soc: qcom: Add device tree binding for SMEM
Date: Thu, 30 Apr 2015 10:41:26 -0700
Message-ID: <CAJAp7OgNfnppcg7u-rjH0gG=7t45bgXYfN1+wAOEZD6xwEb=zQ@mail.gmail.com>
References: <1428795178-24312-1-git-send-email-bjorn.andersson@sonymobile.com>
	<55424C78.3020506@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <55424C78.3020506@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Jeffrey Hugo <jhugo@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Andry Gross <agross@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 30, 2015 at 8:38 AM, Jeffrey Hugo <jhugo@codeaurora.org> wrote:
> On 4/11/2015 5:32 PM, Bjorn Andersson wrote:
>>
>> Add device tree binding documentation for the Qualcom Shared Memory
>> manager.
[..]
>> +- hwspinlocks:
>> +       Usage: required
>> +       Value type: <prop-encoded-array>
>> +       Definition: reference to a hwspinlock used to protect allocations
>> from
>> +                   the shared memory
>> +
>> += EXAMPLE
[..]
>> +               hwlocks = <&tcsr_mutex 3>;
>
>
> Just noticed, this looks like a typo.  The description of the field above
> calls it "hwspinlocks".  Would to please determine which of the two labels
> you most prefer, and change things so that label is used in both the
> description and the example?  Thanks
>

Thanks, you're correct it's a typo in the definition.

Regards,
Bjorn
