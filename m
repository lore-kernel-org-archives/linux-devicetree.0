From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH RESEND v2 1/6] dt-bindings: watchdog: Add YAML schemas for
 the generic watchdog bindings
Date: Mon, 2 Sep 2019 17:37:15 -0700
Message-ID: <a7c5892b-4fd5-9b24-fdd6-f3aa1e6c98e7@roeck-us.net>
References: <20190821143835.7294-1-mripard@kernel.org>
 <20190830164811.GA7911@roeck-us.net> <20190902114650.w65ya7mgfsyu275x@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190902114650.w65ya7mgfsyu275x@flea>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <mripard@kernel.org>
Cc: wim@linux-watchdog.org, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 9/2/19 4:46 AM, Maxime Ripard wrote:
> Hi Guenther,
> 
> On Fri, Aug 30, 2019 at 09:48:11AM -0700, Guenter Roeck wrote:
>> On Wed, Aug 21, 2019 at 04:38:30PM +0200, Maxime Ripard wrote:
>>> From: Maxime Ripard <maxime.ripard@bootlin.com>
>>>
>>> The watchdogs have a bunch of generic properties that are needed in a
>>> device tree. Add a YAML schemas for those.
>>>
>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>>
>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 
> Thanks for reviewing this, which tree should this go through? Yours or Rob's?
> 
I added the watchdog patches to my watchdog-next tree, where Wim
usually pick them up. I would be ok with Rob picking them up too
if he wants to.

Guenter
