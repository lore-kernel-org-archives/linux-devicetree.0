From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] of: Have of_device_add call platform_device_add rather
 than device_add
Date: Wed, 21 Nov 2012 16:05:23 +0000
Message-ID: <CACxGe6v4qJ6jp43=i2aAhht2GuZsuLLPz8oSPUk4rCp92mQXNQ@mail.gmail.com>
References: <20121121072448.GG19837@obsidianresearch.com> <20121121155104.726B83E0AE2@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20121121155104.726B83E0AE2@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 21, 2012 at 3:51 PM, Grant Likely <grant.likely@secretlab.ca> wrote:
> On Wed, 21 Nov 2012 00:24:48 -0700, Jason Gunthorpe <jgunthorpe@obsidianresearch.com> wrote:
>> This allows platform_device_add a chance to call insert_resource
>> on all of the resources from OF. At a minimum this fills in proc/iomem
>> and presumably makes resource tracking and conflict detection work
>> better.
>>
>> Signed-off-by: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
>> ---
>>  drivers/of/device.c |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> Tested on PPC32 and ARM32 embedded kernels.
>>
>> diff --git a/drivers/of/device.c b/drivers/of/device.c
>> index 4c74e4f..a5b67dc 100644
>> --- a/drivers/of/device.c
>> +++ b/drivers/of/device.c
>> @@ -62,7 +62,7 @@ int of_device_add(struct platform_device *ofdev)
>>       if (!ofdev->dev.parent)
>>               set_dev_node(&ofdev->dev, of_node_to_nid(ofdev->dev.of_node));
>>
>> -     return device_add(&ofdev->dev);
>> +     return platform_device_add(ofdev);
>>  }
>>
>>  int of_device_register(struct platform_device *pdev)
>
> This has the side effect of moving all devices at the root of the tree
> from /sys/devices/ to /sys/devices/platform. It also has the possibility
> of breaking if any devices get registered with overlapping regions. I
> think there are some powerpc 5200 boards that do this, and I'm not sure
> about the larger Power boxen.
>
> I've got a more nuanced version of this patch that I'm trying to get
> published today for review. I'll add you to the cc list.

However, while on this topic;

Ben. Do you have any objections to registering all OF generated
platform devices under /sys/devices/platform instead of /sys/devices?
I don't much like the platform directory, but it would make the code
more consistent for DT and non-DT users.

g.

--
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
