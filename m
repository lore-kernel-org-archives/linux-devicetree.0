From: Alexander Amelkin <alexander-RgVAGUil9pwRDxlzMovjVg@public.gmane.org>
Subject: [PATCH 1/3] usb: max3421-hcd: Add devicetree support to the driver
Date: Fri, 26 May 2017 14:28:24 +0300
Message-ID: <420c4f42ade4fd33fb8ad00fa54552f1@amelkin.msk.ru>
References: <fe4f9b0f3a18d48dec6c0a8d79cae386@amelkin.msk.ru>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="=_9c0f0c31cd5505eb2742cd2df380deda"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <fe4f9b0f3a18d48dec6c0a8d79cae386-RgVAGUil9pwRDxlzMovjVg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=_9c0f0c31cd5505eb2742cd2df380deda
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII;
 format=flowed

NOTE:
Please don't use the plain text here as a patch because it most probably 
is corrupted by my webmail client.
Attached is a copy of the following text guaranteed to have correct 
tabs/spaces.
-------------------------

Before this patch the max3421-hcd driver could only use
statically linked platform data to initialize its parameters.
This prevented it from being used on systems using device
tree.

The data taken from the device tree is put into dev->platform_data
when CONFIG_OF is enabled and the device is an OpenFirmware node.

The driver's 'compatible' string is 'maxim,max3421'

Binding documentation is also added with this patch.

Signed-off-by: Alexander Amelkin <alexander-RgVAGUil9pwRDxlzMovjVg@public.gmane.org>
---
  .../devicetree/bindings/usb/maxim,max3421-hcd.txt  | 19 +++++
  drivers/usb/host/max3421-hcd.c                     | 96 
++++++++++++++++++++--
  2 files changed, 110 insertions(+), 5 deletions(-)
  create mode 100644 
Documentation/devicetree/bindings/usb/maxim,max3421-hcd.txt

diff --git a/Documentation/devicetree/bindings/usb/maxim,max3421-hcd.txt 
b/Documentation/devicetree/bindings/usb/maxim,max3421-hcd.txt
new file mode 100644
index 0000000..a8b9faa
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/maxim,max3421-hcd.txt
@@ -0,0 +1,19 @@
+* SPI-based USB host controller Maxim Integrated max3421e
+
+Required properties:
+- compatible: must be "maxim,max3421"
+- reg: chip select number to which the max3421 chip is connected
+  (depends on master SPI controller)
+- spi-max-frequency: the operational frequency, must not exceed 
<26000000>
+- interrupt-parent: phandle of the associated GPIO controller to which 
the INT line
+  of max3421e chip is connected
+- interrupts: specification of the GPIO pin (in terms of the 
`interrupt-parent`)
+  to which INT line of max3421e chip is connected.
+  The driver configures MAX3421E for active low level triggered 
interrupts.
+  Configure your 'interrupt-parent' gpio controller accordingly.
+- vbus: <GPOUTx ACTIVE_LEVEL>
+  GPOUTx is the number (1-8) of GPOUT pin of max3421e used to drive 
Vbus.
+  ACTIVE_LEVEL is 1 or 0.
+
+Don't forget to add pinctrl properties if you need some GPIO pins 
reconfigured
+for use as INT. See binding information for the pinctrl nodes.
diff --git a/drivers/usb/host/max3421-hcd.c 
b/drivers/usb/host/max3421-hcd.c
index 369869a..f600052 100644
--- a/drivers/usb/host/max3421-hcd.c
+++ b/drivers/usb/host/max3421-hcd.c
@@ -61,6 +61,12 @@
  #include <linux/usb.h>
  #include <linux/usb/hcd.h>

+#if defined(CONFIG_OF)
+#include <linux/of_device.h>
+
+#define MAX3421_GPOUT_COUNT 8
+#endif
+
  #include <linux/platform_data/max3421-hcd.h>

  #define DRIVER_DESC    "MAX3421 USB Host-Controller Driver"
@@ -1699,6 +1705,10 @@ max3421_hub_control(struct usb_hcd *hcd, u16 
type_req, u16 value, u16 index,
     spin_lock_irqsave(&max3421_hcd->lock, flags);

     pdata = spi->dev.platform_data;
+   if (!pdata) {
+       dev_err(&spi->dev, "Device platform data is missing\n");
+       return -EFAULT;
+   }

     switch (type_req) {
     case ClearHubFeature:
@@ -1831,20 +1841,80 @@ static struct hc_driver max3421_hcd_desc = {
     .bus_resume =       max3421_bus_resume,
  };

+#if defined(CONFIG_OF)
+static struct max3421_hcd_platform_data max3421_data;
+
+static const struct of_device_id max3421_dt_ids[] = {
+   { .compatible = "maxim,max3421", .data = &max3421_data, },
+   { /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, max3421_dt_ids);
+#endif
+
  static int
  max3421_probe(struct spi_device *spi)
  {
     struct max3421_hcd *max3421_hcd;
     struct usb_hcd *hcd = NULL;
     int retval = -ENOMEM;
+#if defined(CONFIG_OF)
+   struct max3421_hcd_platform_data *pdata = NULL;
+#endif

     if (spi_setup(spi) < 0) {
         dev_err(&spi->dev, "Unable to setup SPI bus");
         return -EFAULT;
     }

-   hcd = usb_create_hcd(&max3421_hcd_desc, &spi->dev,
-                dev_name(&spi->dev));
+   if (!spi->irq) {
+       dev_err(&spi->dev, "Failed to get SPI IRQ for node '%s'\n", 
spi->dev.of_node->full_name);
+       return -EFAULT;
+   }
+
+#if defined(CONFIG_OF)
+   if (spi->dev.of_node) {
+       /* A temporary alias structure */
+       union {
+           uint32_t value[2];
+           struct {
+               uint32_t gpout;
+               uint32_t active_level;
+           };
+       } vbus;
+
+       if(!(pdata = devm_kzalloc(&spi->dev, sizeof(*pdata), 
GFP_KERNEL))) {
+           dev_err(&spi->dev, "failed to allocate memory for private 
data\n");
+           retval = -ENOMEM;
+           goto error;
+       }
+       spi->dev.platform_data = pdata;
+
+       if ((retval = of_property_read_u32_array(spi->dev.of_node, 
"vbus", vbus.value, 2))) {
+           dev_err(&spi->dev, "device tree node property 'vbus' is 
missing\n");
+           goto error;
+       }
+       pdata->vbus_gpout = vbus.gpout;
+       pdata->vbus_active_level = vbus.active_level;
+   }
+   else
+#endif
+   pdata = spi->dev.platform_data;
+   if (!pdata) {
+       dev_err(&spi->dev, "driver configuration data is not 
provided\n");
+       retval = -EFAULT;
+       goto error;
+   }
+   if (pdata->vbus_active_level > 1) {
+       dev_err(&spi->dev, "vbus active level value %d is out of range 
(0/1)\n", pdata->vbus_active_level);
+       retval = -EINVAL;
+       goto error;
+   }
+   if (pdata->vbus_gpout < 1 || pdata->vbus_gpout > 
MAX3421_GPOUT_COUNT) {
+       dev_err(&spi->dev, "vbus gpout value %d is out of range 
(1..8)\n", pdata->vbus_gpout);
+       retval = -EINVAL;
+       goto error;
+   }
+   hcd = usb_create_hcd(&max3421_hcd_desc, &spi->dev, 
dev_name(&spi->dev));
     if (!hcd) {
         dev_err(&spi->dev, "failed to create HCD structure\n");
         goto error;
@@ -1892,6 +1962,12 @@ max3421_probe(struct spi_device *spi)
             kthread_stop(max3421_hcd->spi_thread);
         usb_put_hcd(hcd);
     }
+#if defined(CONFIG_OF)
+   if (pdata && spi->dev.platform_data == pdata) {
+       devm_kfree(&spi->dev, pdata);
+       spi->dev.platform_data = NULL;
+   }
+#endif
     return retval;
  }

@@ -1908,14 +1984,12 @@ max3421_remove(struct spi_device *spi)
         if (hcd->self.controller == &spi->dev)
             break;
     }
+
     if (!max3421_hcd) {
         dev_err(&spi->dev, "no MAX3421 HCD found for SPI device %p\n",
             spi);
         return -ENODEV;
     }
-
-   usb_remove_hcd(hcd);
-
     spin_lock_irqsave(&max3421_hcd->lock, flags);

     kthread_stop(max3421_hcd->spi_thread);
@@ -1923,8 +1997,19 @@ max3421_remove(struct spi_device *spi)

     spin_unlock_irqrestore(&max3421_hcd->lock, flags);

+#if defined(CONFIG_OF)
+   if (spi->dev.platform_data) {
+       dev_dbg(&spi->dev, "Freeing platform data structure\n");
+       devm_kfree(&spi->dev, spi->dev.platform_data);
+       spi->dev.platform_data = NULL;
+   }
+#endif
+
     free_irq(spi->irq, hcd);

+   usb_remove_hcd(hcd);
+
+
     usb_put_hcd(hcd);
     return 0;
  }
@@ -1934,6 +2019,7 @@ static struct spi_driver max3421_driver = {
     .remove     = max3421_remove,
     .driver     = {
         .name   = "max3421-hcd",
+       .of_match_table = of_match_ptr(max3421_dt_ids),
     },
  };

--
2.7.4

--=_9c0f0c31cd5505eb2742cd2df380deda
Content-Transfer-Encoding: base64
Content-Type: text/x-diff;
 name=0001-usb-max3421-hcd-Add-devicetree-support-to-the-driver.patch
Content-Disposition: attachment;
 filename=0001-usb-max3421-hcd-Add-devicetree-support-to-the-driver.patch;
 size=6691

RnJvbSAwZWI0NDY0Mzk4YzhiMGEzMzZhYTAzMDU3MjRiNGI4NGVmMmJlMDk3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbGV4YW5kZXIgQW1lbGtpbiA8YW1lbGtpbkBmYXN0d2VsLnJ1
PgpEYXRlOiBUdWUsIDI4IE1hciAyMDE3IDIwOjU5OjA2ICswMzAwClN1YmplY3Q6IFtQQVRDSCAx
LzNdIHVzYjogbWF4MzQyMS1oY2Q6IEFkZCBkZXZpY2V0cmVlIHN1cHBvcnQgdG8gdGhlIGRyaXZl
cgoKQmVmb3JlIHRoaXMgcGF0Y2ggdGhlIG1heDM0MjEtaGNkIGRyaXZlciBjb3VsZCBvbmx5IHVz
ZQpzdGF0aWNhbGx5IGxpbmtlZCBwbGF0Zm9ybSBkYXRhIHRvIGluaXRpYWxpemUgaXRzIHBhcmFt
ZXRlcnMuClRoaXMgcHJldmVudGVkIGl0IGZyb20gYmVpbmcgdXNlZCBvbiBzeXN0ZW1zIHVzaW5n
IGRldmljZQp0cmVlLgoKVGhlIGRhdGEgdGFrZW4gZnJvbSB0aGUgZGV2aWNlIHRyZWUgaXMgcHV0
IGludG8gZGV2LT5wbGF0Zm9ybV9kYXRhCndoZW4gQ09ORklHX09GIGlzIGVuYWJsZWQgYW5kIHRo
ZSBkZXZpY2UgaXMgYW4gT3BlbkZpcm13YXJlIG5vZGUuCgpUaGUgZHJpdmVyJ3MgJ2NvbXBhdGli
bGUnIHN0cmluZyBpcyAnbWF4aW0sbWF4MzQyMScKCkJpbmRpbmcgZG9jdW1lbnRhdGlvbiBpcyBh
bHNvIGFkZGVkIHdpdGggdGhpcyBwYXRjaC4KClNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBBbWVs
a2luIDxhbGV4YW5kZXJAYW1lbGtpbi5tc2sucnU+Ci0tLQogLi4uL2RldmljZXRyZWUvYmluZGlu
Z3MvdXNiL21heGltLG1heDM0MjEtaGNkLnR4dCAgfCAxOSArKysrKwogZHJpdmVycy91c2IvaG9z
dC9tYXgzNDIxLWhjZC5jICAgICAgICAgICAgICAgICAgICAgfCA5NiArKysrKysrKysrKysrKysr
KysrKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDExMCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygt
KQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91
c2IvbWF4aW0sbWF4MzQyMS1oY2QudHh0CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3VzYi9tYXhpbSxtYXgzNDIxLWhjZC50eHQgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvdXNiL21heGltLG1heDM0MjEtaGNkLnR4dApuZXcgZmlsZSBt
b2RlIDEwMDY0NAppbmRleCAwMDAwMDAwLi5hOGI5ZmFhCi0tLSAvZGV2L251bGwKKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9tYXhpbSxtYXgzNDIxLWhjZC50eHQK
QEAgLTAsMCArMSwxOSBAQAorKiBTUEktYmFzZWQgVVNCIGhvc3QgY29udHJvbGxlciBNYXhpbSBJ
bnRlZ3JhdGVkIG1heDM0MjFlCisKK1JlcXVpcmVkIHByb3BlcnRpZXM6CistIGNvbXBhdGlibGU6
IG11c3QgYmUgIm1heGltLG1heDM0MjEiCistIHJlZzogY2hpcCBzZWxlY3QgbnVtYmVyIHRvIHdo
aWNoIHRoZSBtYXgzNDIxIGNoaXAgaXMgY29ubmVjdGVkCisgIChkZXBlbmRzIG9uIG1hc3RlciBT
UEkgY29udHJvbGxlcikKKy0gc3BpLW1heC1mcmVxdWVuY3k6IHRoZSBvcGVyYXRpb25hbCBmcmVx
dWVuY3ksIG11c3Qgbm90IGV4Y2VlZCA8MjYwMDAwMDA+CistIGludGVycnVwdC1wYXJlbnQ6IHBo
YW5kbGUgb2YgdGhlIGFzc29jaWF0ZWQgR1BJTyBjb250cm9sbGVyIHRvIHdoaWNoIHRoZSBJTlQg
bGluZQorICBvZiBtYXgzNDIxZSBjaGlwIGlzIGNvbm5lY3RlZAorLSBpbnRlcnJ1cHRzOiBzcGVj
aWZpY2F0aW9uIG9mIHRoZSBHUElPIHBpbiAoaW4gdGVybXMgb2YgdGhlIGBpbnRlcnJ1cHQtcGFy
ZW50YCkKKyAgdG8gd2hpY2ggSU5UIGxpbmUgb2YgbWF4MzQyMWUgY2hpcCBpcyBjb25uZWN0ZWQu
CisgIFRoZSBkcml2ZXIgY29uZmlndXJlcyBNQVgzNDIxRSBmb3IgYWN0aXZlIGxvdyBsZXZlbCB0
cmlnZ2VyZWQgaW50ZXJydXB0cy4KKyAgQ29uZmlndXJlIHlvdXIgJ2ludGVycnVwdC1wYXJlbnQn
IGdwaW8gY29udHJvbGxlciBhY2NvcmRpbmdseS4KKy0gdmJ1czogPEdQT1VUeCBBQ1RJVkVfTEVW
RUw+CisgIEdQT1VUeCBpcyB0aGUgbnVtYmVyICgxLTgpIG9mIEdQT1VUIHBpbiBvZiBtYXgzNDIx
ZSB1c2VkIHRvIGRyaXZlIFZidXMuCisgIEFDVElWRV9MRVZFTCBpcyAxIG9yIDAuCisKK0Rvbid0
IGZvcmdldCB0byBhZGQgcGluY3RybCBwcm9wZXJ0aWVzIGlmIHlvdSBuZWVkIHNvbWUgR1BJTyBw
aW5zIHJlY29uZmlndXJlZAorZm9yIHVzZSBhcyBJTlQuIFNlZSBiaW5kaW5nIGluZm9ybWF0aW9u
IGZvciB0aGUgcGluY3RybCBub2Rlcy4KZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2hvc3QvbWF4
MzQyMS1oY2QuYyBiL2RyaXZlcnMvdXNiL2hvc3QvbWF4MzQyMS1oY2QuYwppbmRleCAzNjk4Njlh
Li5mNjAwMDUyIDEwMDY0NAotLS0gYS9kcml2ZXJzL3VzYi9ob3N0L21heDM0MjEtaGNkLmMKKysr
IGIvZHJpdmVycy91c2IvaG9zdC9tYXgzNDIxLWhjZC5jCkBAIC02MSw2ICs2MSwxMiBAQAogI2lu
Y2x1ZGUgPGxpbnV4L3VzYi5oPgogI2luY2x1ZGUgPGxpbnV4L3VzYi9oY2QuaD4KIAorI2lmIGRl
ZmluZWQoQ09ORklHX09GKQorI2luY2x1ZGUgPGxpbnV4L29mX2RldmljZS5oPgorCisjZGVmaW5l
IE1BWDM0MjFfR1BPVVRfQ09VTlQgOAorI2VuZGlmCisKICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9y
bV9kYXRhL21heDM0MjEtaGNkLmg+CiAKICNkZWZpbmUgRFJJVkVSX0RFU0MJIk1BWDM0MjEgVVNC
IEhvc3QtQ29udHJvbGxlciBEcml2ZXIiCkBAIC0xNjk5LDYgKzE3MDUsMTAgQEAgbWF4MzQyMV9o
dWJfY29udHJvbChzdHJ1Y3QgdXNiX2hjZCAqaGNkLCB1MTYgdHlwZV9yZXEsIHUxNiB2YWx1ZSwg
dTE2IGluZGV4LAogCXNwaW5fbG9ja19pcnFzYXZlKCZtYXgzNDIxX2hjZC0+bG9jaywgZmxhZ3Mp
OwogCiAJcGRhdGEgPSBzcGktPmRldi5wbGF0Zm9ybV9kYXRhOworCWlmICghcGRhdGEpIHsKKwkJ
ZGV2X2Vycigmc3BpLT5kZXYsICJEZXZpY2UgcGxhdGZvcm0gZGF0YSBpcyBtaXNzaW5nXG4iKTsK
KwkJcmV0dXJuIC1FRkFVTFQ7CisJfQogCiAJc3dpdGNoICh0eXBlX3JlcSkgewogCWNhc2UgQ2xl
YXJIdWJGZWF0dXJlOgpAQCAtMTgzMSwyMCArMTg0MSw4MCBAQCBzdGF0aWMgc3RydWN0IGhjX2Ry
aXZlciBtYXgzNDIxX2hjZF9kZXNjID0gewogCS5idXNfcmVzdW1lID0JCW1heDM0MjFfYnVzX3Jl
c3VtZSwKIH07CiAKKyNpZiBkZWZpbmVkKENPTkZJR19PRikKK3N0YXRpYyBzdHJ1Y3QgbWF4MzQy
MV9oY2RfcGxhdGZvcm1fZGF0YSBtYXgzNDIxX2RhdGE7CisKK3N0YXRpYyBjb25zdCBzdHJ1Y3Qg
b2ZfZGV2aWNlX2lkIG1heDM0MjFfZHRfaWRzW10gPSB7CisJeyAuY29tcGF0aWJsZSA9ICJtYXhp
bSxtYXgzNDIxIiwgLmRhdGEgPSAmbWF4MzQyMV9kYXRhLCB9LAorCXsgLyogc2VudGluZWwgKi8g
fQorfTsKK01PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIG1heDM0MjFfZHRfaWRzKTsKKyNlbmRpZgor
CiBzdGF0aWMgaW50CiBtYXgzNDIxX3Byb2JlKHN0cnVjdCBzcGlfZGV2aWNlICpzcGkpCiB7CiAJ
c3RydWN0IG1heDM0MjFfaGNkICptYXgzNDIxX2hjZDsKIAlzdHJ1Y3QgdXNiX2hjZCAqaGNkID0g
TlVMTDsKIAlpbnQgcmV0dmFsID0gLUVOT01FTTsKKyNpZiBkZWZpbmVkKENPTkZJR19PRikKKwlz
dHJ1Y3QgbWF4MzQyMV9oY2RfcGxhdGZvcm1fZGF0YSAqcGRhdGEgPSBOVUxMOworI2VuZGlmCiAK
IAlpZiAoc3BpX3NldHVwKHNwaSkgPCAwKSB7CiAJCWRldl9lcnIoJnNwaS0+ZGV2LCAiVW5hYmxl
IHRvIHNldHVwIFNQSSBidXMiKTsKIAkJcmV0dXJuIC1FRkFVTFQ7CiAJfQogCi0JaGNkID0gdXNi
X2NyZWF0ZV9oY2QoJm1heDM0MjFfaGNkX2Rlc2MsICZzcGktPmRldiwKLQkJCSAgICAgZGV2X25h
bWUoJnNwaS0+ZGV2KSk7CisJaWYgKCFzcGktPmlycSkgeworCQlkZXZfZXJyKCZzcGktPmRldiwg
IkZhaWxlZCB0byBnZXQgU1BJIElSUSBmb3Igbm9kZSAnJXMnXG4iLCBzcGktPmRldi5vZl9ub2Rl
LT5mdWxsX25hbWUpOworCQlyZXR1cm4gLUVGQVVMVDsKKwl9CisKKyNpZiBkZWZpbmVkKENPTkZJ
R19PRikKKwlpZiAoc3BpLT5kZXYub2Zfbm9kZSkgeworCQkvKiBBIHRlbXBvcmFyeSBhbGlhcyBz
dHJ1Y3R1cmUgKi8KKwkJdW5pb24geworCQkJdWludDMyX3QgdmFsdWVbMl07CisJCQlzdHJ1Y3Qg
eworCQkJCXVpbnQzMl90IGdwb3V0OworCQkJCXVpbnQzMl90IGFjdGl2ZV9sZXZlbDsKKwkJCX07
CisJCX0gdmJ1czsKKworCQlpZighKHBkYXRhID0gZGV2bV9remFsbG9jKCZzcGktPmRldiwgc2l6
ZW9mKCpwZGF0YSksIEdGUF9LRVJORUwpKSkgeworCQkJZGV2X2Vycigmc3BpLT5kZXYsICJmYWls
ZWQgdG8gYWxsb2NhdGUgbWVtb3J5IGZvciBwcml2YXRlIGRhdGFcbiIpOworCQkJcmV0dmFsID0g
LUVOT01FTTsKKwkJCWdvdG8gZXJyb3I7CisJCX0KKwkJc3BpLT5kZXYucGxhdGZvcm1fZGF0YSA9
IHBkYXRhOworCisJCWlmICgocmV0dmFsID0gb2ZfcHJvcGVydHlfcmVhZF91MzJfYXJyYXkoc3Bp
LT5kZXYub2Zfbm9kZSwgInZidXMiLCB2YnVzLnZhbHVlLCAyKSkpIHsKKwkJCWRldl9lcnIoJnNw
aS0+ZGV2LCAiZGV2aWNlIHRyZWUgbm9kZSBwcm9wZXJ0eSAndmJ1cycgaXMgbWlzc2luZ1xuIik7
CisJCQlnb3RvIGVycm9yOworCQl9CisJCXBkYXRhLT52YnVzX2dwb3V0ID0gdmJ1cy5ncG91dDsK
KwkJcGRhdGEtPnZidXNfYWN0aXZlX2xldmVsID0gdmJ1cy5hY3RpdmVfbGV2ZWw7CisJfQorCWVs
c2UKKyNlbmRpZgorCXBkYXRhID0gc3BpLT5kZXYucGxhdGZvcm1fZGF0YTsKKwlpZiAoIXBkYXRh
KSB7CisJCWRldl9lcnIoJnNwaS0+ZGV2LCAiZHJpdmVyIGNvbmZpZ3VyYXRpb24gZGF0YSBpcyBu
b3QgcHJvdmlkZWRcbiIpOworCQlyZXR2YWwgPSAtRUZBVUxUOworCQlnb3RvIGVycm9yOworCX0K
KwlpZiAocGRhdGEtPnZidXNfYWN0aXZlX2xldmVsID4gMSkgeworCQlkZXZfZXJyKCZzcGktPmRl
diwgInZidXMgYWN0aXZlIGxldmVsIHZhbHVlICVkIGlzIG91dCBvZiByYW5nZSAoMC8xKVxuIiwg
cGRhdGEtPnZidXNfYWN0aXZlX2xldmVsKTsKKwkJcmV0dmFsID0gLUVJTlZBTDsKKwkJZ290byBl
cnJvcjsKKwl9CisJaWYgKHBkYXRhLT52YnVzX2dwb3V0IDwgMSB8fCBwZGF0YS0+dmJ1c19ncG91
dCA+IE1BWDM0MjFfR1BPVVRfQ09VTlQpIHsKKwkJZGV2X2Vycigmc3BpLT5kZXYsICJ2YnVzIGdw
b3V0IHZhbHVlICVkIGlzIG91dCBvZiByYW5nZSAoMS4uOClcbiIsIHBkYXRhLT52YnVzX2dwb3V0
KTsKKwkJcmV0dmFsID0gLUVJTlZBTDsKKwkJZ290byBlcnJvcjsKKwl9CisJaGNkID0gdXNiX2Ny
ZWF0ZV9oY2QoJm1heDM0MjFfaGNkX2Rlc2MsICZzcGktPmRldiwgZGV2X25hbWUoJnNwaS0+ZGV2
KSk7CiAJaWYgKCFoY2QpIHsKIAkJZGV2X2Vycigmc3BpLT5kZXYsICJmYWlsZWQgdG8gY3JlYXRl
IEhDRCBzdHJ1Y3R1cmVcbiIpOwogCQlnb3RvIGVycm9yOwpAQCAtMTg5Miw2ICsxOTYyLDEyIEBA
IG1heDM0MjFfcHJvYmUoc3RydWN0IHNwaV9kZXZpY2UgKnNwaSkKIAkJCWt0aHJlYWRfc3RvcCht
YXgzNDIxX2hjZC0+c3BpX3RocmVhZCk7CiAJCXVzYl9wdXRfaGNkKGhjZCk7CiAJfQorI2lmIGRl
ZmluZWQoQ09ORklHX09GKQorCWlmIChwZGF0YSAmJiBzcGktPmRldi5wbGF0Zm9ybV9kYXRhID09
IHBkYXRhKSB7CisJCWRldm1fa2ZyZWUoJnNwaS0+ZGV2LCBwZGF0YSk7CisJCXNwaS0+ZGV2LnBs
YXRmb3JtX2RhdGEgPSBOVUxMOworCX0KKyNlbmRpZgogCXJldHVybiByZXR2YWw7CiB9CiAKQEAg
LTE5MDgsMTQgKzE5ODQsMTIgQEAgbWF4MzQyMV9yZW1vdmUoc3RydWN0IHNwaV9kZXZpY2UgKnNw
aSkKIAkJaWYgKGhjZC0+c2VsZi5jb250cm9sbGVyID09ICZzcGktPmRldikKIAkJCWJyZWFrOwog
CX0KKwogCWlmICghbWF4MzQyMV9oY2QpIHsKIAkJZGV2X2Vycigmc3BpLT5kZXYsICJubyBNQVgz
NDIxIEhDRCBmb3VuZCBmb3IgU1BJIGRldmljZSAlcFxuIiwKIAkJCXNwaSk7CiAJCXJldHVybiAt
RU5PREVWOwogCX0KLQotCXVzYl9yZW1vdmVfaGNkKGhjZCk7Ci0KIAlzcGluX2xvY2tfaXJxc2F2
ZSgmbWF4MzQyMV9oY2QtPmxvY2ssIGZsYWdzKTsKIAogCWt0aHJlYWRfc3RvcChtYXgzNDIxX2hj
ZC0+c3BpX3RocmVhZCk7CkBAIC0xOTIzLDggKzE5OTcsMTkgQEAgbWF4MzQyMV9yZW1vdmUoc3Ry
dWN0IHNwaV9kZXZpY2UgKnNwaSkKIAogCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJm1heDM0MjFf
aGNkLT5sb2NrLCBmbGFncyk7CiAKKyNpZiBkZWZpbmVkKENPTkZJR19PRikKKwlpZiAoc3BpLT5k
ZXYucGxhdGZvcm1fZGF0YSkgeworCQlkZXZfZGJnKCZzcGktPmRldiwgIkZyZWVpbmcgcGxhdGZv
cm0gZGF0YSBzdHJ1Y3R1cmVcbiIpOworCQlkZXZtX2tmcmVlKCZzcGktPmRldiwgc3BpLT5kZXYu
cGxhdGZvcm1fZGF0YSk7CisJCXNwaS0+ZGV2LnBsYXRmb3JtX2RhdGEgPSBOVUxMOworCX0KKyNl
bmRpZgorCiAJZnJlZV9pcnEoc3BpLT5pcnEsIGhjZCk7CiAKKwl1c2JfcmVtb3ZlX2hjZChoY2Qp
OworCisKIAl1c2JfcHV0X2hjZChoY2QpOwogCXJldHVybiAwOwogfQpAQCAtMTkzNCw2ICsyMDE5
LDcgQEAgc3RhdGljIHN0cnVjdCBzcGlfZHJpdmVyIG1heDM0MjFfZHJpdmVyID0gewogCS5yZW1v
dmUJCT0gbWF4MzQyMV9yZW1vdmUsCiAJLmRyaXZlcgkJPSB7CiAJCS5uYW1lCT0gIm1heDM0MjEt
aGNkIiwKKwkJLm9mX21hdGNoX3RhYmxlID0gb2ZfbWF0Y2hfcHRyKG1heDM0MjFfZHRfaWRzKSwK
IAl9LAogfTsKIAotLSAKMi43LjQKCg==
--=_9c0f0c31cd5505eb2742cd2df380deda--

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
