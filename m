From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: Re: [PATCH v3 5/7] iio: Support triggered events
Date: Fri, 07 Aug 2015 19:10:32 +0300
Message-ID: <55C4D878.1010605@cogentembedded.com>
References: <1438174469-19054-1-git-send-email-vladimir.barinov@cogentembedded.com> <1438174648-19296-1-git-send-email-vladimir.barinov@cogentembedded.com> <55C4B66C.1020609@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <55C4B66C.1020609@metafoo.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lars-Peter Clausen <lars@metafoo.de>, Jonathan Cameron <jic23@kernel.org>
Cc: Hartmut Knaack <knaack.h@gmx.de>, Peter Meerwald <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, cory.tusar@pid1solutions.com
List-Id: devicetree@vger.kernel.org

Hi Lars,

On 07.08.2015 16:45, Lars-Peter Clausen wrote:
> Hi,
>
> On 07/29/2015 02:57 PM, Vladimir Barinov wrote:
>> Support triggered events.
>>
>> This is useful for chips that don't have their own interrupt sources.
>> It allows to use generic/standalone iio triggers for those drivers.
>>
> Thanks for the patch. Can you describe in more detail how
> INDIO_EVENT_TRIGGERED differs from the INDIO_BUFFER_TRIGGERED. By just
> looking at the source code I don't understand quite why it is necessary.
This is needed for the case when iio buffer is not used and used only 
iio event.

The difference to INDIO_BUFFER_TRIGGERED is that for triggered buffer 
the trigger poll function is attached (using 
iio_trigger_attach_poll_func) only in
industrialio-buffer.c using number of steps/conditions starting by 
issuing 1 to buffer/enable sysfs path.

For chips that do not use iio buffer but use only iio events the 
iio_trigger_attach_poll_func never called.

In case of using INDIO_BUFFER_TRIGGERED the poll func is 
attached/detached via industrialio-buffer.c
In case of using INDIO_EVENT_TRIGGERED the poll func is 
attached/detached via industrialio-trigger.c during set/change the 
current trigger.

Regards,
Vladimir

>
> Thanks,
> - Lars
>
