From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH 1/9] pci-rcar-gen2: add devicetree support
Date: Sun, 30 Mar 2014 20:21:01 +0100
Message-ID: <53386E9D.70803@codethink.co.uk>
References: <1394128887-4197-1-git-send-email-ben.dooks@codethink.co.uk> <1394128887-4197-2-git-send-email-ben.dooks@codethink.co.uk> <5318BCAE.7000108@codethink.co.uk> <53386C2F.1090508@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <53386C2F.1090508@cogentembedded.com>
Sender: linux-pci-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-sh@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@lists.codethink.co.uk, magnus.damn@opensource.se, horms@verge.net.au, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 30/03/14 20:10, Sergei Shtylyov wrote:
> Hello.
>
> On 03/06/2014 09:21 PM, Ben Dooks wrote:
>
>>> Add OF match table for pci-rcar-gen2 driver for device tree support.
> [...]
>
>>> diff --git a/drivers/pci/host/pci-rcar-gen2.c
>>> b/drivers/pci/host/pci-rcar-gen2.c
>>> index fd3e3ab..1216784 100644
>>> --- a/drivers/pci/host/pci-rcar-gen2.c
>>> +++ b/drivers/pci/host/pci-rcar-gen2.c
>>> @@ -16,6 +16,7 @@
>>>   #include <linux/kernel.h>
>>>   #include <linux/module.h>
>>>   #include <linux/pci.h>
>>> +#include <linux/of_pci.h>
>>>   #include <linux/platform_device.h>
>>>   #include <linux/pm_runtime.h>
>>>   #include <linux/sizes.h>
>
>> Apologies all, there's a missing include of <linux/of.h> which should
>> have been added here
>
>     Have you ever re-posted this patch fixed? If not, it's not going to
> be merged for 3.15 I guess...

I thought I did. I can have a look a reposting it.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius
