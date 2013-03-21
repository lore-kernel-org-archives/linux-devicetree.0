From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH 01/11] OF: add empty of_device_is_available for !OF
Date: Thu, 21 Mar 2013 09:26:45 -0500
Message-ID: <514B18A5.20001@gmail.com>
References: <1363820051-24428-1-git-send-email-robherring2@gmail.com> <1363820051-24428-2-git-send-email-robherring2@gmail.com> <20130321141812.GG15279@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130321141812.GG15279@e106331-lin.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <Pawel.Moll@arm.com>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "john.stultz@linaro.org" <john.stultz@linaro.org>, "haojian.zhuang@linaro.org" <haojian.zhuang@linaro.org>, "tglx@linutronix.de" <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

On 03/21/2013 09:18 AM, Mark Rutland wrote:
> On Wed, Mar 20, 2013 at 10:54:01PM +0000, Rob Herring wrote:
>> From: Rob Herring <rob.herring@calxeda.com>
>>
>> Add an empty version of of_device_is_available.
>>
>> Signed-off-by: Rob Herring <rob.herring@calxeda.com>
>> ---
>>  include/linux/of.h |    5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/include/linux/of.h b/include/linux/of.h
>> index a0f1292..6fe655b 100644
>> --- a/include/linux/of.h
>> +++ b/include/linux/of.h
>> @@ -379,6 +379,11 @@ static inline int of_device_is_compatible(const struct device_node *device,
>>  	return 0;
>>  }
>>  
>> +static inline int of_device_is_available(const struct device_node *device,)
> 
> I assume that comma shouldn't be there?                                     ^

Right. I've fixed that up in my git tree.

Rob
