From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 1/2] of: base: add support to get machine model name
Date: Wed, 23 Nov 2016 10:23:21 +0000
Message-ID: <27006aab-91c4-f468-6fd5-00220e045c6a@arm.com>
References: <1479396775-32033-1-git-send-email-sudeep.holla@arm.com>
 <20161118144651.275xz4gu6jaefhp7@rob-hp-laptop> <582F5DC0.4080804@gmail.com>
 <5834921F.2020809@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5834921F.2020809@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 22/11/16 18:44, Frank Rowand wrote:
> Hi Rob,

[...]

>
> This patch adds a function that leads to conflating the "model"
> property and the "compatible" property. This leads to opaque,
> confusing and unclear code where ever it is used.   I think it is
> not good for the device tree framework to contribute to writing
> unclear code.
>

I agree, the main intention of this patch initially was to have a non
flat_* version of of_flat_dt_get_machine_name

> Further, only two of the proposed users of this new function appear
> to be proper usage.  I do not think that the small amount of reduced
> lines of code is a good trade off for the reduced code clarity and
> for the potential for future mis-use of this function.
>

OK, most of the place I found it used for logging/informational purpose
and hence I thought it could replace in places where even compatible is
used. If that's wrong or leads to misuse of this API, then fine we
should not have one.

-- 
Regards,
Sudeep
