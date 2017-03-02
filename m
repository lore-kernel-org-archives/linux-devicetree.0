From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v2 1/2] extcon: cros-ec: Add extcon-cros-ec driver to
 support display out.
Date: Thu, 02 Mar 2017 16:29:03 +0900
Message-ID: <58B7C9BF.1040708@samsung.com>
References: <20170301111943.12170-1-enric.balletbo@collabora.com>
 <CGME20170301112844epcas4p34012f1564f1145f8d8a8967f4fe9a821@epcas4p3.samsung.com>
 <20170301111943.12170-2-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20170301111943.12170-2-enric.balletbo@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Rob Herring <robh+dt@kernel.org>
Cc: Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Benson Leung <bleung@chromium.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 2017년 03월 01일 20:19, Enric Balletbo i Serra wrote:
> From: Benson Leung <bleung@chromium.org>
> 
> This is the driver for the USB Type C cable detection mechanism
> built into the ChromeOS Embedded Controller on systems that
> have USB Type-C ports.
> 
> At present, this allows for the presence of display out, but in
> future, it may also be used to notify host and device type cables
> and the presence of power.
> 
> Signed-off-by: Benson Leung <bleung@chromium.org>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> Changes since v1:
>  Requested by Chanwoo Choi
>  - Rename files changing _ for -
>  - Remove the unneeded blank line on bottom of header.
>  - Remove kobject.h and cros_ec_commands.h includes.
>  - Remove the debug message as is not necessary.
>  - Use the tab for indentation instead of space for if sentence.
>  - Define each variable on different lines when the variables should be
>    initialized.
>  - Remove EXTCON_USB and EXTCON_USB_HOST as are not really used for now.
>  - Add one blank line to split out between state and property setting.
>  - Add the author information (header and module)
> 
>  Enric Balletbo
>  - As Rob suggested to rename the compatible name to something indicating that
>    is USB Type C related I also renamed the file names, extcon-cros-ec ->
>    extcon-usbc-cros-ec, I think it's more clear.
> 
>  drivers/extcon/Kconfig               |   7 +
>  drivers/extcon/Makefile              |   1 +
>  drivers/extcon/extcon-usbc-cros-ec.c | 415 +++++++++++++++++++++++++++++++++++
>  include/linux/mfd/cros_ec_commands.h |  75 +++++++
>  4 files changed, 498 insertions(+)
>  create mode 100644 drivers/extcon/extcon-usbc-cros-ec.c
> 

Looks good to me.
Acked-by: Chanwoo Choi <cw00.chio@samsung.com>

I think this patch should be handled with patches[1].
[1] https://lkml.org/lkml/2017/2/14/655

I think that one maintainer among following subsystems
(mfd, chrome h/w platform, rtc and extcon)
will apply their git repository, and then one maintainer
will send the pull request of immutable branch for these patches.

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
