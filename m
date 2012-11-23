From: Qing Xu <qingx@marvell.com>
Subject: Re: [PATCH 1/7] mfd: max8925: add irqdomain for dt
Date: Fri, 23 Nov 2012 15:13:08 +0800
Message-ID: <50AF2204.4070508@marvell.com>
References: <1352187429-9711-1-git-send-email-qingx@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1352187429-9711-1-git-send-email-qingx@marvell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Qing Xu <qingx@marvell.com>
Cc: "sameo@linux.intel.com" <sameo@linux.intel.com>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "haojian.zhuang@gmail.com" <haojian.zhuang@gmail.com>, Chao Xie <cxie4@marvell.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On 11/06/2012 03:37 PM, Qing Xu wrote:
> From: Qing Xu <qingx@marvell.com>
>
> Add irqdomains for max8925's main irq, and touch irq.
> Wrap irq register operations into irqdomain's map func.
> it is necessary for dt support.
> Also, add dt support for max8925 driver.
>
> Signed-off-by: Qing Xu <qingx@marvell.com>
> ---
>   drivers/mfd/max8925-core.c  |   87 ++++++++++++++++++++++++++++---------------
>   drivers/mfd/max8925-i2c.c   |   32 +++++++++++++++-
>   include/linux/mfd/max8925.h |   12 ++++-
>   3 files changed, 96 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/mfd/max8925-core.c b/drivers/mfd/max8925-core.c
> index 1e0ab0a..dcc218a 100644
> --- a/drivers/mfd/max8925-core.c
> +++ b/drivers/mfd/max8925-core.c
> @@ -14,10 +14,14 @@
>   #include <linux/i2c.h>
>   #include <linux/irq.h>
>   #include <linux/interrupt.h>
> +#include <linux/irqdomain.h>
>   #include <linux/platform_device.h>
>   #include <linux/regulator/machine.h>
>   #include <linux/mfd/core.h>
>   #include <linux/mfd/max8925.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/of_irq.h>
Hi Haojian, Sameo,

Could you help to review my patches? Can it be merged?

Thanks a lot!
-Qing
