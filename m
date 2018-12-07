From: Rui Miguel Silva <rui.silva@linaro.org>
Subject: Re: [PATCH v9 01/13] media: staging/imx: refactor imx media device
 probe
Date: Fri, 07 Dec 2018 13:53:01 +0000
Message-ID: <m37egl30le.fsf@linaro.org>
References: <20181122151834.6194-1-rui.silva@linaro.org>
 <20181122151834.6194-2-rui.silva@linaro.org>
 <b0fffeef-439b-e3a7-67d1-900a7ea1664f@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-reply-to: <b0fffeef-439b-e3a7-67d1-900a7ea1664f@xs4all.nl>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, sakari.ailus@linux.intel.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Philipp Zabel <p.zabel@pengutronix.de>, Steve Longerbeam <slongerbeam@gmail.com>, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Hans,
Thanks for the review.

On Fri 07 Dec 2018 at 12:38, Hans Verkuil wrote:
> On 11/22/2018 04:18 PM, Rui Miguel Silva wrote:
>> Refactor and move media device initialization code to a new 
>> common
>> module, so it can be used by other devices, this will allow for 
>> example
>> a near to introduce imx7 CSI driver, to use this media device.
>> 
>> Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
>> ---
>>  drivers/staging/media/imx/Makefile            |   1 +
>>  .../staging/media/imx/imx-media-dev-common.c  | 102 
>>  ++++++++++++++++++
>>  drivers/staging/media/imx/imx-media-dev.c     |  88 
>>  ++++-----------
>>  drivers/staging/media/imx/imx-media-of.c      |   6 +-
>>  drivers/staging/media/imx/imx-media.h         |  15 +++
>>  5 files changed, 141 insertions(+), 71 deletions(-)
>>  create mode 100644 
>>  drivers/staging/media/imx/imx-media-dev-common.c
>> 
>> diff --git a/drivers/staging/media/imx/Makefile 
>> b/drivers/staging/media/imx/Makefile
>> index 698a4210316e..a30b3033f9a3 100644
>> --- a/drivers/staging/media/imx/Makefile
>> +++ b/drivers/staging/media/imx/Makefile
>> @@ -1,5 +1,6 @@
>>  # SPDX-License-Identifier: GPL-2.0
>>  imx-media-objs := imx-media-dev.o imx-media-internal-sd.o 
>>  imx-media-of.o
>> +imx-media-objs += imx-media-dev-common.o
>>  imx-media-common-objs := imx-media-utils.o imx-media-fim.o
>>  imx-media-ic-objs := imx-ic-common.o imx-ic-prp.o 
>>  imx-ic-prpencvf.o
>>  
>> diff --git a/drivers/staging/media/imx/imx-media-dev-common.c 
>> b/drivers/staging/media/imx/imx-media-dev-common.c
>> new file mode 100644
>> index 000000000000..55fe94fb72f2
>> --- /dev/null
>> +++ b/drivers/staging/media/imx/imx-media-dev-common.c
>> @@ -0,0 +1,102 @@
>> +// SPDX-License-Identifier: GPL
>
> This is an invalid SPDX license identifier. You probably want to 
> use GPL-2.0.

hrr... you are right, I will update it here and others.

---
Cheers,
	Rui
