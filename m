From: "Andrew F. Davis" <afd@ti.com>
Subject: Re: [PATCH v8 0/5] mfd: tps65912: Driver rewrite with DT support
Date: Sat, 6 Feb 2016 10:21:24 -0600
Message-ID: <56B61D84.9000709@ti.com>
References: <1453736627-2634-1-git-send-email-afd@ti.com>
 <20160128064149.GM3368@x1> <20160128114026.GB6078@sirena.org.uk>
 <20160128120423.GP3368@x1> <20160128124525.GF6078@sirena.org.uk>
 <20160128133049.GQ3368@x1> <56B0C559.7060204@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <56B0C559.7060204@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 02/02/2016 09:03 AM, Andrew F. Davis wrote:
> On 01/28/2016 07:30 AM, Lee Jones wrote:
>> On Thu, 28 Jan 2016, Mark Brown wrote:
>>
>>> On Thu, Jan 28, 2016 at 12:04:23PM +0000, Lee Jones wrote:
>>>> On Thu, 28 Jan 2016, Mark Brown wrote:
>>>
>>>>> Please be more specific?  What is it that you are looking for beyond the
>>>>> review I already did for the regulator driver?
>>>
>>>> Patch 2.
>>>
>>> I reviewed that *ages* ago.
>>
>> Link or it didn't happen. ;)
>>
>
> Might be best to take his ack for the new regulator driver
> as approval to remove the old one. :)

If not, is there anything I can do to help keep this from getting
delayed another cycle?
