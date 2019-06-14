From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH v3] dt-bindings: arm: Convert Actions Semi bindings to
 jsonschema
Date: Fri, 14 Jun 2019 19:07:44 +0200
Message-ID: <5946467c-7674-de2b-a657-627cf3be42df@suse.de>
References: <20190517153223.7650-1-robh@kernel.org>
 <20190613224435.GA32572@bogus> <20190614170450.GA29654@Mani-XPS-13-9360>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190614170450.GA29654@Mani-XPS-13-9360>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am 14.06.19 um 19:04 schrieb Manivannan Sadhasivam:
> On Thu, Jun 13, 2019 at 04:44:35PM -0600, Rob Herring wrote:
>> On Fri, May 17, 2019 at 10:32:23AM -0500, Rob Herring wrote:
>>> Convert Actions Semi SoC bindings to DT schema format using json-schema.
>>>
>>> Cc: "Andreas Färber" <afaerber@suse.de>
>>> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>>> Cc: Mark Rutland <mark.rutland@arm.com>
>>> Cc: linux-arm-kernel@lists.infradead.org
>>> Cc: devicetree@vger.kernel.org
>>> Signed-off-by: Rob Herring <robh@kernel.org>
>>> ---
>>> v3:
>>> - update MAINTAINERS
>>>
>>>  .../devicetree/bindings/arm/actions.txt       | 56 -------------------
>>>  .../devicetree/bindings/arm/actions.yaml      | 38 +++++++++++++
>>>  MAINTAINERS                                   |  2 +-
>>>  3 files changed, 39 insertions(+), 57 deletions(-)
>>>  delete mode 100644 Documentation/devicetree/bindings/arm/actions.txt
>>>  create mode 100644 Documentation/devicetree/bindings/arm/actions.yaml
>>
>> Ping. Please apply or modify this how you'd prefer. I'm not going to 
>> keep respinning this.
>>
> 
> Sorry for that Rob.

Well, it was simply not clear whether we were supposed to or not. :)

> Andreas, are you going to take this patch? Else I'll pick it up (If you
> want me to do the PR for next cycle)

I had checked that all previous changes to the .txt file were by myself,
so I would prefer if we not license it under GPLv2-only but under the
same dual-license (MIT/GPLv2+) as the DTs. That modification would need
Rob's approval then.

Regards,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG Nürnberg)
