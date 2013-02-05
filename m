From: Qing Xu <qingx@marvell.com>
Subject: Re: [PATCH 1/6] mfd: max8925: add irqdomain for dt
Date: Tue, 05 Feb 2013 16:21:06 +0800
Message-ID: <5110C0F2.1080108@marvell.com>
References: <1359992448-22229-1-git-send-email-haojian.zhuang@linaro.org> <20130205081924.GM8476@sortiz-mobl>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130205081924.GM8476@sortiz-mobl>
Sender: linux-kernel-owner@vger.kernel.org
To: Samuel Ortiz <sameo@linux.intel.com>
Cc: Haojian Zhuang <haojian.zhuang@linaro.org>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Chao Xie <cxie4@marvell.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "patches@linaro.org" <patches@linaro.org>, Haojian Zhuang <haojian.zhuang@gmail.com>
List-Id: devicetree@vger.kernel.org

On 02/05/2013 04:19 PM, Samuel Ortiz wrote:
> Hi Haojian,
>
> On Mon, Feb 04, 2013 at 11:40:42PM +0800, Haojian Zhuang wrote:
>> From: Qing Xu <qingx@marvell.com>
>>
>> Add irqdomains for max8925's main irq, wrap irq register operations
>> into irqdomain's map func. it is necessary for dt support.
>>
>> Also, add dt support for max8925 driver.
>>
>> Signed-off-by: Qing Xu <qingx@marvell.com>
>> Signed-off-by: Haojian Zhuang <haojian.zhuang@gmail.com>
>> ---
>>   drivers/mfd/max8925-core.c  |   73 +++++++++++++++++++++++++------------------
>>   drivers/mfd/max8925-i2c.c   |   36 +++++++++++++++++++--
>>   include/linux/mfd/max8925.h |    3 +-
>>   3 files changed, 78 insertions(+), 34 deletions(-)
> This and the next 5 patches applied, thanks for the heads up.
>
> Cheers,
> Samuel.
>
Hi Samuel, Haojian,

Thank you very much!

-Qing
