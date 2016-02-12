From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 3/4] mailbox: mailbox-test: use print_hex_dump_bytes to
 allow dynamic printk
Date: Fri, 12 Feb 2016 09:32:15 +0000
Message-ID: <56BDA69F.5060102@arm.com>
References: <1455210808-29395-1-git-send-email-sudeep.holla@arm.com>
 <1455210808-29395-4-git-send-email-sudeep.holla@arm.com>
 <20160212091218.GR20693@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160212091218.GR20693@x1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Jassi Brar <jassisinghbrar@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 12/02/16 09:12, Lee Jones wrote:
> On Thu, 11 Feb 2016, Sudeep Holla wrote:
>
>> Reduce the logging from info to debug. Also use print_hex_dump_bytes
>> instead as it has support for dynamic printk providing options to
>> conditionally enable/disable these logs.
>
> Printing out the data in this way is kinda the point of the driver.
> But if you don't have a use for it, then I guess it's okay to
> downgrade it to DEBUG, as turning debug on, or hacking the driver back
> again are trivial actions.
>

Agreed, I wanted check the same by adding additional note but forgot.
Sorry for missing that.

One of the reasons I preferred this it's easy to switch it on or off via
debug level or dynamic debug. It's useful when the test application
using these sysfs also logs and ends up cluttered by kernel logs.

-- 
Regards,
Sudeep
