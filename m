From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 1/2] extcon: extcon-dra7xx: Add extcon driver for USB ID
 detection
Date: Fri, 30 Aug 2013 09:20:25 +0900
Message-ID: <521FE549.3080605@samsung.com>
References: <1376648029-30659-1-git-send-email-george.cherian@ti.com>
 <1376648029-30659-2-git-send-email-george.cherian@ti.com>
 <52127284.6030506@wwwdotorg.org> <521312CC.8060003@ti.com>
 <52139F0F.6090507@wwwdotorg.org> <52199663.8070201@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-reply-to: <52199663.8070201@roeck-us.net>
Sender: linux-doc-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Stephen Warren <swarren@wwwdotorg.org>, George Cherian <george.cherian@ti.com>, balbi@ti.com, myungjoo.ham@samsung.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, grant.likely@linaro.org, rob@landley.net, ian.campbell@citrix.com, mark.rutland@arm.com, pawel.moll@arm.co
List-Id: devicetree@vger.kernel.org

Hi Guenter,

> I am currently working on adding device tree support to the extcon-gpio driver.
> 
> Wonder if it would make sense to just use that driver. As far as I can see
> the only missing part is support for multiple cables and cable naming through
> device tree properties.
> 
> Any thoughts ? The patches are not yet clean enough to submit upstream,
> but I could send them as RFC if there is interest.
> 

I'm considering ways to use and update extcon-gpio driver.
I have interest concerning your approach.
After completing your work, send them as RFC as you mentioned.

Thanks,
Chanwoo Choi

