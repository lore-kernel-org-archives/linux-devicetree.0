From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 1/2] extcon: cros-ec: Add extcon-cros-ec driver to
 support display out.
Date: Mon, 24 Apr 2017 12:58:25 +0100
Message-ID: <20170424115825.ce2tsg7pafavb3sm@dell>
References: <20170301111943.12170-1-enric.balletbo@collabora.com>
 <CGME20170301112844epcas4p34012f1564f1145f8d8a8967f4fe9a821@epcas4p3.samsung.com>
 <20170301111943.12170-2-enric.balletbo@collabora.com>
 <58B7C9BF.1040708@samsung.com>
 <58E44698.5020605@samsung.com>
 <cb06a494-3bce-0240-9a87-74a7942d4bf6@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cb06a494-3bce-0240-9a87-74a7942d4bf6@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Benson Leung <bleung@chromium.org>
List-Id: devicetree@vger.kernel.org

On Mon, 10 Apr 2017, Enric Balletbo i Serra wrote:

> 
> 
> On 05/04/17 03:21, Chanwoo Choi wrote:
> > Hi Enric,
> > 
> > On 2017년 03월 02일 16:29, Chanwoo Choi wrote:
> >> Hi,
> >>
> >> On 2017년 03월 01일 20:19, Enric Balletbo i Serra wrote:
> >>> From: Benson Leung <bleung@chromium.org>
> >>>
> >>> This is the driver for the USB Type C cable detection mechanism
> >>> built into the ChromeOS Embedded Controller on systems that
> >>> have USB Type-C ports.
> >>>
> >>> At present, this allows for the presence of display out, but in
> >>> future, it may also be used to notify host and device type cables
> >>> and the presence of power.
> >>>
> >>> Signed-off-by: Benson Leung <bleung@chromium.org>
> >>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> >>> ---
> >>> Changes since v1:
> >>>  Requested by Chanwoo Choi
> >>>  - Rename files changing _ for -
> >>>  - Remove the unneeded blank line on bottom of header.
> >>>  - Remove kobject.h and cros_ec_commands.h includes.
> >>>  - Remove the debug message as is not necessary.
> >>>  - Use the tab for indentation instead of space for if sentence.
> >>>  - Define each variable on different lines when the variables should be
> >>>    initialized.
> >>>  - Remove EXTCON_USB and EXTCON_USB_HOST as are not really used for now.
> >>>  - Add one blank line to split out between state and property setting.
> >>>  - Add the author information (header and module)
> >>>
> >>>  Enric Balletbo
> >>>  - As Rob suggested to rename the compatible name to something indicating that
> >>>    is USB Type C related I also renamed the file names, extcon-cros-ec ->
> >>>    extcon-usbc-cros-ec, I think it's more clear.
> >>>
> >>>  drivers/extcon/Kconfig               |   7 +
> >>>  drivers/extcon/Makefile              |   1 +
> >>>  drivers/extcon/extcon-usbc-cros-ec.c | 415 +++++++++++++++++++++++++++++++++++
> >>>  include/linux/mfd/cros_ec_commands.h |  75 +++++++
> >>>  4 files changed, 498 insertions(+)
> >>>  create mode 100644 drivers/extcon/extcon-usbc-cros-ec.c
> >>>
> >>
> >> Looks good to me.
> >> Acked-by: Chanwoo Choi <cw00.chio@samsung.com>
> >>
> >> I think this patch should be handled with patches[1].
> >> [1] https://lkml.org/lkml/2017/2/14/655
> >>
> >> I think that one maintainer among following subsystems
> >> (mfd, chrome h/w platform, rtc and extcon)
> >> will apply their git repository, and then one maintainer
> >> will send the pull request of immutable branch for these patches.
> >>
> > 
> > As I mentioned, these patch should be handled with related patches[1].
> > [1] https://lkml.org/lkml/2017/2/14/655
> > 
> > So, I can't apply these patch on extcon git because there is a merge conflict
> > and we should handle these patches with immutable branch between subsystem maintainer.
> > 
> > The v4.11-rc5 was released, if you want to apply this patch to the v4.12-rc1,
> > please take care of these patches.
> > 
> 
> Thanks, unfortunately the above patch dependency is not merged yet, I'll take
> care of these an resend this series rebased again once I have the confirmation
> of the above patch is merged or in a immutable branch.

I guess this patch will have to wait until v3.13 now.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
