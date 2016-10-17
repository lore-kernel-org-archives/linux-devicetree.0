From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2] usb: xhci: add support for performing fake doorbell
Date: Mon, 17 Oct 2016 23:21:14 +0200
Message-ID: <CACna6rwpZGr-y7YrVrYio5=3Ntpkso9VdCPGvX1AhwL0qyYtrA@mail.gmail.com>
References: <20161001215817.25384-1-zajec5@gmail.com> <20161017203036.23399-1-zajec5@gmail.com>
 <d41d60cc-9710-deb8-f4a5-784894b8e3d5@hauke-m.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d41d60cc-9710-deb8-f4a5-784894b8e3d5-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>, Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 17 October 2016 at 23:10, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org> wrote:
> On 10/17/2016 10:30 PM, Rafa=C5=82 Mi=C5=82ecki wrote:
>> From: Rafa=C5=82 Mi=C5=82ecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
>>
>> Broadcom's Northstar XHCI controllers seem to need a special start
>> procedure to work correctly. There isn't any official documentation of
>> this, the problem is that controller doesn't detect any connected
>> devices with default setup. Moreover connecting USB device to controller
>> that doesn't run properly can cause SoC's watchdog issues.
>>
>> A workaround that was successfully tested on multiple devices is to
>> perform a fake doorbell. This patch adds code for doing this and enables
>> it on BCM4708 family.
>>
>> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
>> ---
>> V2: Enable quirk for brcm,bcm4708 machines instead of adding separated b=
inding
>>     for it. Thanks Rob for your comment on this.
>> ---
>>  drivers/usb/host/xhci-plat.c |  6 +++++
>>  drivers/usb/host/xhci.c      | 63 +++++++++++++++++++++++++++++++++++++=
++++---
>>  drivers/usb/host/xhci.h      |  1 +
>>  3 files changed, 67 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
>> index ed56bf9..b01a3be 100644
>> --- a/drivers/usb/host/xhci-plat.c
>> +++ b/drivers/usb/host/xhci-plat.c
>> @@ -56,12 +56,18 @@ static int xhci_priv_init_quirk(struct usb_hcd *hcd)
>>
>>  static void xhci_plat_quirks(struct device *dev, struct xhci_hcd *xhci)
>>  {
>> +     struct platform_device  *pdev =3D to_platform_device(dev);
>> +     struct device_node      *node =3D pdev->dev.of_node;
>> +
>>       /*
>>        * As of now platform drivers don't provide MSI support so we ensu=
re
>>        * here that the generic code does not try to make a pci_dev from =
our
>>        * dev struct in order to setup MSI
>>        */
>>       xhci->quirks |=3D XHCI_PLAT;
>> +
>> +     if (node && of_machine_is_compatible("brcm,bcm4708"))
>> +             xhci->quirks |=3D XHCI_FAKE_DOORBELL;
>
> Are you sure only the bcm4708 and similar SoCs are affected? Having here
> a list with 3 or more checks would looks strange. I prefer your first pat=
ch.
>
> @Florian do you know if other Broadcom SoC are affected by this problem
> or are only Northstar SoCs affected?

I also believed usb3-fake-doorbell property looks nicer, but then just
followed Rob's suggestion.

I don't know about Northstar Plus or Northstar 2, I just know it's not
needed for BCM53573.

--=20
Rafa=C5=82
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
