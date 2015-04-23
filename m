From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: Re: [PATCH v3 4/4] of/platform: Use platform_device interface
Date: Thu, 23 Apr 2015 09:28:39 +0200
Message-ID: <CAPybu_3Ej2ecFDTiJVL9TfE=ZLFN2wLKE_nFL2WjMQtk+4LO_A@mail.gmail.com>
References: <1429719261-18024-1-git-send-email-ricardo.ribalda@gmail.com>
 <1429719261-18024-5-git-send-email-ricardo.ribalda@gmail.com> <CAL_JsqKYkNyfY+4RPY=FD1=wBxc2EJXaSsJ8D+0T84JK_65E4Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKYkNyfY+4RPY=FD1=wBxc2EJXaSsJ8D+0T84JK_65E4Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Jakub Sitnicki <jsitnicki@gmail.com>, Vivek Goyal <vgoyal@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, Jiang Liu <jiang.liu@linux.intel.com>, Mike Travis <travis@sgi.com>, Thierry Reding <treding@nvidia.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hello Rob

On Wed, Apr 22, 2015 at 6:25 PM, Rob Herring <robherring2@gmail.com> wrote:

>> This patch, replaces of_device_add() with platform_device_data().
>
> This doesn't match the change.

Thanks for catching it up. Will fix it and resend

>> -       if (of_device_add(dev) != 0) {
>> +       if (platform_device_add(dev) != 0) {
>
> Can't we now remove of_device_add?

Now it is only used by ibmebus


ricardo@neopili:~/linux-upstream$ git grep of_device_add
arch/powerpc/kernel/ibmebus.c:  ret = of_device_add(dev);
drivers/of/device.c:int of_device_add(struct platform_device *ofdev)
drivers/of/device.c:    return of_device_add(pdev);
include/linux/of_device.h:extern int of_device_add(struct
platform_device *pdev);

I think it can also use platform_device_add. I will prepare a patch to
finally remove of_device_add()

Thanks!




-- 
Ricardo Ribalda
