From: "Andrew F. Davis" <afd@ti.com>
Subject: Re: [PATCH v4 2/5] mfd: tps65912: Remove old driver in preparation
 for new driver
Date: Mon, 5 Oct 2015 11:01:37 -0500
Message-ID: <56129EE1.90000@ti.com>
References: <1443731874-21362-1-git-send-email-afd@ti.com>
 <1443731874-21362-3-git-send-email-afd@ti.com> <20151005092820.GF3243@x1>
 <20151005092903.GG3243@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151005092903.GG3243@x1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mark Brown <broonie@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

he On 10/05/2015 04:29 AM, Lee Jones wrote:
> On Mon, 05 Oct 2015, Lee Jones wrote:
>
>> On Thu, 01 Oct 2015, Andrew F. Davis wrote:
>>
>>> The old tps65912 driver is being replaced, delete old driver.
>>>
>>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>>
>> I already Acked this in v3.
>>
>> Acked-by: Lee Jones <lee.jones@linaro.org>
>
> Ack can carry, but is there any chance this can be split up for easy
> digestion into the respective trees?
>

I'm not sure, the components are tightly coupled and if one tree has
different parts deleted/replaced I'm not sure if this will leave the
trees in a compilable state. I think one tree will need to take all
the parts.

If it was just adding components then this wouldn't be needed, but
having old and new together may be a problem.
