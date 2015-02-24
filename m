From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 06/12] ARM: DT: apq8064: add pci support in CM QS600
Date: Tue, 24 Feb 2015 10:47:28 +0000
Message-ID: <54EC56C0.1010705@linaro.org>
References: <424678035-12862-1-git-send-email-srinivas.kandagatla@linaro.org> <1424678135-13178-1-git-send-email-srinivas.kandagatla@linaro.org> <54EB0F7F.1050307@compulab.co.il> <54EB1245.3030902@linaro.org> <54EC5127.1090504@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <54EC5127.1090504@mm-sol.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stanimir Varbanov <svarbanov@mm-sol.com>
Cc: Igor Grinberg <grinberg@compulab.co.il>, Kumar Gala <galak@codeaurora.org>, linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Nicolas Dechesne <nicolas.dechesne@linaro.org>
List-Id: devicetree@vger.kernel.org



On 24/02/15 10:23, Stanimir Varbanov wrote:
> On 02/23/2015 01:43 PM, Srinivas Kandagatla wrote:
>> Hi Kumar,
>>
>> Sorry, I should have dropped this patch.. PCIE is still not in the
>> mainline.. :-)
>>
>
> Srini,
>
> Does it possible to reuse the driver which I'm trying to upstream at [1]

Yes, it should be possible, that's the plan anyway for A family.

> ? I'm planing to send v2 soon.
Great.

--srini
>
>
> [1] https://lkml.org/lkml/2014/12/12/557
>
