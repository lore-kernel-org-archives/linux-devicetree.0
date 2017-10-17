From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [RFC usb-next v5 1/3] dt-bindings: usb: add the documentation for
 USB root-hub
Date: Tue, 17 Oct 2017 23:00:03 +0200
Message-ID: <CAFBinCC7disratgMmmaSJMfywb-bPF32L-1BarSsX6zTChHEJg@mail.gmail.com>
References: <20171008211713.18696-1-martin.blumenstingl@googlemail.com>
 <20171008211713.18696-2-martin.blumenstingl@googlemail.com>
 <CAK8P3a2607YnNRRmAJJyTNJTTJmJvx-ZJm3QNAq84noPLy+F+A@mail.gmail.com>
 <CAFBinCCc+Fj6wwGk+OLNQTHEYU8xBPe7OGHVSQ82kMew3xUsww@mail.gmail.com> <CAK8P3a2C+8w5_8uZF2qHvq7Cp=AH6DDx5Y=mGJFCCz2pTLvPPg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="94eb2c05df2a699841055bc46948"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK8P3a2C+8w5_8uZF2qHvq7Cp=AH6DDx5Y=mGJFCCz2pTLvPPg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:ARM/Amlogic Meson SoC support" <linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--94eb2c05df2a699841055bc46948
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

On Fri, Oct 13, 2017 at 9:37 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Thu, Oct 12, 2017 at 10:56 PM, Martin Blumenstingl
> <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
>> Hi Arnd,
>>
>> thank you for reviewing this patch!
>>
>> On Mon, Oct 9, 2017 at 12:24 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
>>> On Sun, Oct 8, 2017 at 11:17 PM, Martin Blumenstingl
>>> <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
>>>> A USB root-hub may have several PHYs which need to be configured before
>>>> the root-hub starts working.
>>>> This adds the documentation for such a USB root-hub as well as a hint
>>>> regarding the child-nodes on XHCI controllers which can include the
>>>> roothub.
>>>>
>>>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
>>>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>>
>>> Have you checked that this still works with DT properties on a USB device
>>> that is listed in the DT? A common use-case is to provide the MAC address
>>> of a soldered-down USB-ethernet that lacks its own eeprom, and it seems
>>> you are changing the way the parent devices of that get represented,
>>> so the dev->of_node pointer in the USB device might no longer refer
>>> to the correct device.
>> I haven't tested the described use-case. however, this patch is not
>> supposed to change the binding for actual devices.
>> USB device numbering starts at 1, while 0 is reserved for the root-hub
>> (at least from what I know). before this patch there was no way to
>> describe the root-hub via .dts. this however is required for some
>> platforms that need to set up a PHY for each port on the root-hub
>> (Amlogic Meson GXL platform is one example: there are two ports
>> enabled on dwc3's root-hub with 2x USB2 and 1x USB3 PHYs) - so this
>> patch uses a similar binding as we already have (to describe the
>> devices) to describe the root-hub
>
> My point is that the DT binding does depend on the hierarchy, there
> is no way to find a particular device unless each parent up the
> chain is described correctly in DT as well and has a valid of_node
> pointer.
>
> It's possible that this has never worked on XHCI because of the lack
> of the root-hub in DT. Either way, we should ensure that it does work
> now and you didn't break it, so please at least test it with your patches.
>
> The patch below should be sufficient to see if any device has an
> of_node pointer when you add it to your DT:
I slightly modified your patch (see the attached version) and tried it:
# lsusb -t
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci-hcd/0p, 5000M
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci-hcd/2p, 480M
   |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
       |__ Port 3: Dev 3, If 0, Class=Mass Storage, Driver=usb-storage, 480M

the roothub (bus 1 port 1 dev 1) and a soldered down hub (child of
that root-hub, port 1 dev 2) have an entry in the .dts

# dmesg | grep usb
[    0.174097] usbcore: registered new interface driver usbfs
[    0.174147] usbcore: registered new interface driver hub
[    0.174217] usbcore: registered new device driver usb
[    1.354280] usb usb2: We don't know the algorithms for LPM for this
host, disabling LPM.
[    1.373297] usbcore: registered new interface driver usb-storage
[    1.512840] usbcore: registered new interface driver dvb_usb_rtl28xxu
[    1.550506] usb 1-1: of_node /soc/usb@c9000000/hub@1 parent /soc/usb@c9000000
^ this is the soldered down hub
[    1.552579] usbcore: registered new interface driver bcm203x
[    1.712033] usbcore: registered new interface driver usbhid
[    1.716994] usbhid: USB HID core driver
[    1.738827] usb 1-1: new high-speed USB device number 2 using xhci-hcd
[    2.142392] usb 1-1.3: of_node <no-node> parent /soc/usb@c9000000/hub@1
^ this is the thumb drive plugged into the hub (not specified in the .dts)
[    2.220399] usb 1-1.3: new high-speed USB device number 3 using xhci-hcd
[    2.326144] usb-storage 1-1.3:1.0: USB Mass Storage device detected
[    2.328352] scsi host0: usb-storage 1-1.3:1.0

so for me it seems to be working fine

is there anything else you want me to test?

> diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
> index 17681d5638ac..498d0aa0a5c0 100644
> --- a/drivers/usb/core/usb.c
> +++ b/drivers/usb/core/usb.c
> @@ -647,6 +647,7 @@ struct usb_device *usb_alloc_dev(struct usb_device *parent,
>                 }
>                 dev->dev.of_node = usb_of_get_child_node(parent->dev.of_node,
>                                 raw_port);
> +               dev_info(&dev->dev, "of_node %p parent %p\n",
> dev->dev.of_node, parent->dev.of_node);
>
>                 /* hub driver sets up TT records */
>         }
>
>
>        Arnd


Regards,
Martin

--94eb2c05df2a699841055bc46948
Content-Type: text/x-patch; charset="US-ASCII";
	name="khadas-vim-soldered-usb-hub-print.patch"
Content-Disposition: attachment;
	filename="khadas-vim-soldered-usb-hub-print.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_j8w39zeb0

ZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1neGwuZHRzaSBi
L2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1neGwuZHRzaQppbmRleCBjZmJmYmZl
ZmY4NWQuLjc2NzdjZTc3ZDEyMiAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxv
Z2ljL21lc29uLWd4bC5kdHNpCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNv
bi1neGwuZHRzaQpAQCAtODEsNiArODEsMTEgQEAKIAkJCQkJcGh5LW5hbWVzID0gInVzYjItcGh5
IjsKIAkJCQl9OwogCQkJfTsKKworCQkJaHViQDEgeworCQkJCWNvbXBhdGlibGUgPSAidXNiMWE0
MCw4MDEiOworCQkJCXJlZyA9IDwxPjsKKwkJCX07CiAJCX07CiAJfTsKIH07CmRpZmYgLS1naXQg
YS9kcml2ZXJzL3VzYi9jb3JlL3VzYi5jIGIvZHJpdmVycy91c2IvY29yZS91c2IuYwppbmRleCAx
NzY4MWQ1NjM4YWMuLjg5M2Y0ZThiMDczMyAxMDA2NDQKLS0tIGEvZHJpdmVycy91c2IvY29yZS91
c2IuYworKysgYi9kcml2ZXJzL3VzYi9jb3JlL3VzYi5jCkBAIC02NDcsNiArNjQ3LDcgQEAgc3Ry
dWN0IHVzYl9kZXZpY2UgKnVzYl9hbGxvY19kZXYoc3RydWN0IHVzYl9kZXZpY2UgKnBhcmVudCwK
IAkJfQogCQlkZXYtPmRldi5vZl9ub2RlID0gdXNiX29mX2dldF9jaGlsZF9ub2RlKHBhcmVudC0+
ZGV2Lm9mX25vZGUsCiAJCQkJcmF3X3BvcnQpOworCQlkZXZfaW5mbygmZGV2LT5kZXYsICJvZl9u
b2RlICVzIHBhcmVudCAlc1xuIiwgb2Zfbm9kZV9mdWxsX25hbWUoZGV2LT5kZXYub2Zfbm9kZSks
IG9mX25vZGVfZnVsbF9uYW1lKHBhcmVudC0+ZGV2Lm9mX25vZGUpKTsKIAogCQkvKiBodWIgZHJp
dmVyIHNldHMgdXAgVFQgcmVjb3JkcyAqLwogCX0K
--94eb2c05df2a699841055bc46948--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
