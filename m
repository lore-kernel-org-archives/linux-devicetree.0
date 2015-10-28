From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 02/19] Documentation: devicetree: fix reference to legacy
 wakeup properties
Date: Wed, 28 Oct 2015 18:23:57 +0000
Message-ID: <563112BD.2050700@arm.com>
References: <1445422216-29375-1-git-send-email-sudeep.holla@arm.com>
 <1445422216-29375-3-git-send-email-sudeep.holla@arm.com>
 <CAL_JsqJ+5RNCehN9izgChf1fXhctzf+ShevjdAGnW5jF1GsAXw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJ+5RNCehN9izgChf1fXhctzf+ShevjdAGnW5jF1GsAXw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>
List-Id: devicetree@vger.kernel.org



On 21/10/15 23:04, Rob Herring wrote:
> On Wed, Oct 21, 2015 at 5:09 AM, Sudeep Holla <sudeep.holla@arm.com> wrote:
>> This patch marks all the reference to the legacy wakeup bindings
>> and replaces them with the standard "wakeup-source" property.
>>
>> All these legacy property are also listed under a separate section in
>> the generic wakeup-source binding document.
>>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Pawel Moll <pawel.moll@arm.com>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
>> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
>
> Acked-by: Rob Herring <robh@kernel.org>
>

Thanks Rob, can you take these couple(first two) of DT binding patches
via devicetree. I can then push remaining patches via respective trees
later.

-- 
Regards,
Sudeep
