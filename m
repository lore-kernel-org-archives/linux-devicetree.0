From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: Re: [PATCH 2/2] drivercore: Fix unregistration path of platform devices
Date: Mon, 8 Jun 2015 10:42:50 +0200
Message-ID: <CAPybu_2ftjZ5pmTXqn4iHXc6mrj0qzmQ-SLhLZvcRk=1gwF=9g@mail.gmail.com>
References: <1433686811-12303-1-git-send-email-grant.likely@linaro.org>
 <1433686811-12303-3-git-send-email-grant.likely@linaro.org>
 <CAPybu_30jTDuwEW_WTGuu6pWwv86p6OqV0eRE1GbCwUVtBm7KA@mail.gmail.com> <CF8AAE4C-400C-47D9-9440-3CD04DF02F50@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CF8AAE4C-400C-47D9-9440-3CD04DF02F50@konsulko.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <robherring2@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: devicetree@vger.kernel.org

Hello Pantelis

On Mon, Jun 8, 2015 at 10:14 AM, Pantelis Antoniou
<pantelis.antoniou@konsulko.com> wrote:
>>
>
> Either patch fixes (or rather papers over) the problem.
>
> The way I understand it is that we have two issues.
>
> 1. The rather obvious crash on device removal.
> 2. The of_platform_populate (and the subsequent call to
> of_platform_device_create_pdata()) not registering the resources
> due to bugs in platforms that do overlapping regions.
>
>
> #1 is fixed but #2 is rather touchy.

I believe that after my last patchset also #2 is fixed.

The only missing part is applying the shared flag to ONLY the broken
OF platforms, not to all.

We even have a warning on overlapping resources, that should help the
development

https://git.kernel.org/cgit/linux/kernel/git/gregkh/driver-core.git/tree/drivers/base/platform.c?h=driver-core-testing#n379

Hopefully one day we can merge of and platform :)

>
> I would like to eventually fix those platforms; starting with a
> nice fat warning when using overlapping regions would be nice.
>
> The problem is how to deal with range definitions that overlap.
> Does anyone remember what does the spec say regarding those?
>
> If the way they are used now in those platform is wrong we should
> mark them in some manner in the DT so that the idiom does not propagate.

We could easily find out which DT have overlapping resources on the tree...

Regars!
