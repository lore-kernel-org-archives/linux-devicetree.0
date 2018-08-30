From: Eddie James <eajames@linux.vnet.ibm.com>
Subject: Re: [PATCH 4/4] media: platform: Add Aspeed Video Engine driver
Date: Thu, 30 Aug 2018 10:40:21 -0500
Message-ID: <7cb0c2f0-cc12-81a6-a858-40776ec5904c@linux.vnet.ibm.com>
References: <1535576973-8067-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1535576973-8067-5-git-send-email-eajames@linux.vnet.ibm.com>
 <CAAEAJfBpmFPLTMAr+Azc-53JXHPkCU4bjtwqE6nDWUvm=J_x-A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAAEAJfBpmFPLTMAr+Azc-53JXHPkCU4bjtwqE6nDWUvm=J_x-A@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-media <linux-media@vger.kernel.org>, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, andrew@aj.id.au, Mauro Carvalho Chehab <mchehab@kernel.org>, joel@jms.id.au, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org



On 08/29/2018 07:52 PM, Ezequiel Garcia wrote:
> Hi Eddie,
>
> On 29 August 2018 at 18:09, Eddie James <eajames@linux.vnet.ibm.com> wrote:
>> The Video Engine (VE) embedded in the Aspeed AST2400 and AST2500 SOCs
>> can capture and compress video data from digital or analog sources. With
>> the Aspeed chip acting a service processor, the Video Engine can capture
>> the host processor graphics output.
>>
>> Add a V4L2 driver to capture video data and compress it to JPEG images,
>> making the data available through a standard read interface.
>>
>> Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
>> ---
>>   drivers/media/platform/Kconfig        |    8 +
>>   drivers/media/platform/Makefile       |    1 +
>>   drivers/media/platform/aspeed-video.c | 1307 +++++++++++++++++++++++++++++++++
>>   3 files changed, 1316 insertions(+)
>>   create mode 100644 drivers/media/platform/aspeed-video.c
>>
>> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
>> index 94c1fe0..e599245 100644
>> --- a/drivers/media/platform/Kconfig
>> +++ b/drivers/media/platform/Kconfig
>> @@ -32,6 +32,14 @@ source "drivers/media/platform/davinci/Kconfig"
>>
>>   source "drivers/media/platform/omap/Kconfig"
>>
>> +config VIDEO_ASPEED
>> +       tristate "Aspeed AST2400 and AST2500 Video Engine driver"
>> +       depends on VIDEO_V4L2
> It seems you are not using videobuf2. I think it should simplify the read
> I/O part and at the same time expose the other capture methods.

Hi,

Well I'm not sure it would simplify the read interface; it's quite 
simple as it is, both in the driver and to set up in user-space.

I did get streaming I/O working but found the performance significantly 
worse than simple read calls, and therefore not worth the additional 
complexity.

Is it required that I support streaming?

Thanks,
Eddie

>
> There are plenty of examples to follow.
>
> Regards,
> Eze
>
