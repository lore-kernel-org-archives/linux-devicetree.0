From: Haojian Zhuang <haojian.zhuang@gmail.com>
Subject: Re: [PATCH 1/6] mfd: max8925: add irqdomain for dt
Date: Tue, 5 Feb 2013 16:40:11 +0800
Message-ID: <CAN1soZzewq_+6xy059kL07U-eP2W1k+ZKZ7AkTOAUrD4qJ5CKQ@mail.gmail.com>
References: <1359992448-22229-1-git-send-email-haojian.zhuang@linaro.org>
	<20130205081924.GM8476@sortiz-mobl>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130205081924.GM8476@sortiz-mobl>
Sender: linux-kernel-owner@vger.kernel.org
To: Samuel Ortiz <sameo@linux.intel.com>
Cc: Haojian Zhuang <haojian.zhuang@linaro.org>, Qing Xu <qingx@marvell.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, cxie4@marvell.com, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree-discuss@lists.ozlabs.org, patches@linaro.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 5, 2013 at 4:19 PM, Samuel Ortiz <sameo@linux.intel.com> wrote:
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
>>  drivers/mfd/max8925-core.c  |   73 +++++++++++++++++++++++++------------------
>>  drivers/mfd/max8925-i2c.c   |   36 +++++++++++++++++++--
>>  include/linux/mfd/max8925.h |    3 +-
>>  3 files changed, 78 insertions(+), 34 deletions(-)
> This and the next 5 patches applied, thanks for the heads up.
>

Thanks :)

Best Regards
Haojian
