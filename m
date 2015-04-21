From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: Re: [PATCH 2/2 v2] of/platform: Use platform_device interface
Date: Tue, 21 Apr 2015 23:09:46 +0200
Message-ID: <CAPybu_0C=iAGY9cFgxOt7YgCRG+xvKo1YBJfWent5+xord-xmg@mail.gmail.com>
References: <1429604702-14157-1-git-send-email-ricardo.ribalda@gmail.com>
 <1429604702-14157-2-git-send-email-ricardo.ribalda@gmail.com> <CAL_Jsq+ux9aCNUNVH+Vwy_j9oeV0CLbruPN4arkuCBPxvgrzhw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+ux9aCNUNVH+Vwy_j9oeV0CLbruPN4arkuCBPxvgrzhw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Bjorn Helgaas <bhelgaas@google.com>, Vivek Goyal <vgoyal@redhat.com>, Jakub Sitnicki <jsitnicki@gmail.com>, Mike Travis <travis@sgi.com>, Jiang Liu <jiang.liu@linux.intel.com>, Thierry Reding <treding@nvidia.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hello Rob

On Tue, Apr 21, 2015 at 10:13 PM, Rob Herring <robherring2@gmail.com> wrote:
> On Tue, Apr 21, 2015 at 3:25 AM, Ricardo Ribalda Delgado
> <ricardo.ribalda@gmail.com> wrote:
>> of_platform_device_create_pdata() was using of_device_add() to create
>> the devices, but of_platform_device_destroy was using
>> of_platform_device_destroy().
>>
>> of_device_add(), do not call insert_resource(), which initializes the
>> parent field of the resource structure, needed by release_resource(),
>> called by of_platform_device_destroy().
>
> This is because some DTs have overlapping resources and doing this
> would break things. If you look at the git history, this was fixed and
> then reverted by Grant.

I cannot find that commit sorry, could you give me the hash or a link
to the mailing list?

ricardo@pilix:~/linux$ git shortlog drivers/of/platform.c | grep -i Revert
      Revert "drivers: of: add initialization code for dma reserved memory"


To give a litte context to this patch, the issue started with this
conversaion with Bjorn:
https://lkml.org/lkml/2015/4/20/435


What we have today is also wrong, it leads to a null pointer deference
(and therefore a whole crash).

If we cannot use platform_device_add, then we cannot use
platform_device_destroy :)

Shall I prepare a patch replacing platform_device_destroy()?


Thanks!
