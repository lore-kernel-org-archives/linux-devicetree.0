From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V2 4/6] usb: ohci-platform: Add support for Broadcom STB SoC's
Date: Tue, 30 Oct 2018 21:08:54 +0100
Message-ID: <CAK8P3a3M5ppNKwthz5NcCrXc74r1aG9aJhQXzaP-Fa5a81U8yw@mail.gmail.com>
References: <CAOGqxeVfZaJWCVvjNq6_N_eQBvW-8z7NaOmRcQb6hE_c416v6A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOGqxeVfZaJWCVvjNq6_N_eQBvW-8z7NaOmRcQb6hE_c416v6A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Cooper <alcooperx@gmail.com>
Cc: ": Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>, Alan Stern <stern@rowland.harvard.edu>, Alban Bedel <albeu@free.fr>, Alex Elder <elder@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Avi Fishman <avifishman70@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Bjorn Andersson <bjorn.andersson@linaro.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, David Miller <davem@davemloft.net>, DTML <devicetree@vger.kernel.org>, Dmitry Osipenko <digetx@gmail.com>, gregkh <gregkh@linuxfoundation.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Hans de Goede <hdegoede@redhat.com>, James Hogan <jhogan@kernel.org>, Jianguo Sun <sunjianguo1@huawei.com>, Johan Hovold <johan@kernel.org>, Kees Cook <keescook@chromium.org>USB list <linu>
List-Id: devicetree@vger.kernel.org

On 10/30/18, Alan Cooper <alcooperx@gmail.com> wrote:
>> On 10/24/18 3:11 AM, Arnd Bergmann wrote:
>>
>> On Wed, Oct 17, 2018 at 11:30 PM Al Cooper <alcooperx@gmail.com> wrote:
>>
>> Add support for Broadcom STB SoC's to the ohci platform driver.
>>
>> Signed-off-by: Al Cooper <alcooperx@gmail.com>
>> ---
>>  drivers/usb/host/ohci-platform.c | 35
>> +++++++++++++++++++++++++++++------
>>  include/linux/usb/ohci_pdriver.h |  1 +
>>  2 files changed, 30 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/usb/host/ohci-platform.c
> b/drivers/usb/host/ohci-platform.c
>> index 65a1c3fdc88c..363d6fa676a5 100644
>> --- a/drivers/usb/host/ohci-platform.c
>> +++ b/drivers/usb/host/ohci-platform.c
>> @@ -22,6 +22,7 @@
>>  #include <linux/module.h>
>>  #include <linux/err.h>
>>  #include <linux/of.h>
>> +#include <linux/of_device.h>
>>  #include <linux/platform_device.h>
>>  #include <linux/pm_runtime.h>
>>  #include <linux/reset.h>
>> @@ -99,12 +100,24 @@ static int ohci_platform_probe(struct
> platform_device *dev)
>>         if (usb_disabled())
>>                 return -ENODEV;
>>
>> -       /*
>> -        * Use reasonable defaults so platforms don't have to provide
> these
>> -        * with DT probing on ARM.
>> -        */
>> -       if (!pdata)
>> -               pdata = &ohci_platform_defaults;
>> +       if (!pdata) {
>> +               const struct usb_ohci_pdata *match_pdata;
>> +
>> +               match_pdata = of_device_get_match_data(&dev->dev);
>> +               if (match_pdata) {
>> +                       pdata = devm_kzalloc(&dev->dev, sizeof(*pdata),
>> +                                            GFP_KERNEL);
>> +                       if (!pdata)
>> +                               return -ENOMEM;
>> +                       *pdata = *match_pdata;
>>
>> It looks like you copy the const pdata to get a non-const version.
>> Have you tried
>> propagating the 'const' modifier so that users can rely on that here?
>
> The problem is that the const pdata from of_device_get_match() needs to be
> saved in device->platform_data which is not a const pointer (and can't be
> changed). How can I propagate the "const" to solve the problem?

Ah, I see your problem, and unfortunately don't have an easy answer.

You could split up the structure between a constant part and a non-constant
part, and have the latter be what gets put into the platform_data, but that
wouldn't really be much nicer than what you have here.

You could use devm_kmemdup() to save a few lines to simplify your
code without any other changes maybe, but it doesn't solve the
fact that the mismatch between platform_data being non-const and
of_match_data being const is a bit ugly.

        Arnd
