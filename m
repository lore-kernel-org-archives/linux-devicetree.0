From: Ene Alexandru <ene.alexandru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: PATH[1/3] ARM: axp20x_usb_power.c add device tree
 configuration options for REG 30H: VBUS-IPSOUT
Date: Tue, 17 May 2016 10:47:40 -0700 (PDT)
Message-ID: <671c7471-b63a-40cc-989f-6b20f00571ee@googlegroups.com>
References: <0f58d2b3-f3d3-45a3-a307-e54df26c1ab1@googlegroups.com>
Reply-To: ene.alexandru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_801_1555850365.1463507260916"
Return-path: <linux-sunxi+bncBDC4H35J54ORBPNS5W4QKGQE2BPM6AY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <0f58d2b3-f3d3-45a3-a307-e54df26c1ab1-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

------=_Part_801_1555850365.1463507260916
Content-Type: multipart/alternative;
	boundary="----=_Part_802_1108009033.1463507260916"

------=_Part_802_1108009033.1463507260916
Content-Type: text/plain; charset=UTF-8

axp20x_usb_power.c is modified to read those parameters from the device 
tree configuration.
if a configuration value is not found then the corresponding register value 
is not changed.

also, debug messages are added, controlled by "CONFIG_POWER_SUPPLY_DEBUG" : 

Signed-off-by: Ene Alexandru <ene.alexandru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>


---
diff -uprN -X linux-sunxi-original/Documentation/dontdiff 
linux-sunxi-original/drivers/power/axp20x_usb_power.c 
linux-sunxi/drivers/power/axp20x_usb_power.c
--- linux-sunxi-original/drivers/power/axp20x_usb_power.c  2016-05-09 
16:51:44.000000000 +0200
+++ linux-sunxi/drivers/power/axp20x_usb_power.c          2016-05-11 
13:26:24.444681579 +0200
@@ -41,6 +41,19 @@
 #define AXP20X_VBUS_MON_VBUS_VALID       BIT(3)
+/* bit defines for REG 30H: VBUS-IPSOUT Power Path Management */
+/* VBUS VHOLD voltage limiting control  */
+#define AXP20X_VBUS_IPSOUT_MGMT_VHOLD                       BIT(6)
+#define AXP20X_VBUS_IPSOUT_MGMT_VHOLD_ENA  BIT(6)
+#define AXP20X_VBUS_IPSOUT_MGMT_VHOLD_DIS    BIT(0)
+/* VHOLD Set voltage */
+#define AXP20X_VBUS_IPSOUT_MGMT_VHOLD_SET_MASK (BIT(5)|BIT(4)|BIT(3))
+#define AXP20X_VBUS_IPSOUT_MGMT_VHOLD_SET_SHIFT (3)
+/* VBUS current-limit selection */
+#define AXP20X_VBUS_IPSOUT_MGMT_IBUS_MASK (BIT(1) | BIT(0))
+
+
+
struct axp20x_usb_power {
           struct regmap *regmap;
           struct power_supply *supply;
@@ -164,6 +177,93 @@ static const struct power_supply_desc ax
           .get_property = axp20x_usb_power_get_property,
};
+
+static int axp20x_usb_power_read_params(const struct device_node *node,
+                      struct axp20x_usb_power *power, struct 
platform_device *pdev)
+{
+          const u32 *prop;
+          int ret;
+
+          /*
+          * configurable parameters are:
+          * register VBUS-IPSOUT
+          * bit 6: VBUS VHOLD voltage limiting control
+          *           0: No voltage drop limit
+          *           1: Limit the voltage drop
+          * bit 5-3 VHOLD Set VHOLD = [4.0+ (Bit5-3) * 0.1] V
+          * bit 1-0 VBUS current-limit selection
+          *           00:900mA
+          *           01:500mA
+          *           10:100mA
+          *           11:no limit
+          */
+
+          prop = of_get_property(node, "vhold-enable", NULL);
+          if (prop) {
+                      /* either 1 or 0 */
+#ifdef DEBUG
+                      dev_info(&pdev->dev, "set vhold-enable property to 
%d",
+                                  !!(*prop));
+#endif
+                      if (!!(*prop)) {
+                                  ret = regmap_update_bits(power->regmap,
+                                                         
 AXP20X_VBUS_IPSOUT_MGMT,
+                                                         
 AXP20X_VBUS_IPSOUT_MGMT_VHOLD,
+                                                         
 AXP20X_VBUS_IPSOUT_MGMT_VHOLD_ENA);
+                      } else {
+                                  ret = regmap_update_bits(power->regmap,
+                                                         
 AXP20X_VBUS_IPSOUT_MGMT,
+                                                         
 AXP20X_VBUS_IPSOUT_MGMT_VHOLD,
+                                                         
 AXP20X_VBUS_IPSOUT_MGMT_VHOLD_DIS);
+                      }
+                      if (ret)
+                                  return ret;
+          } else {
+#ifdef DEBUG
+                      dev_info(&pdev->dev, "no vhold-enable property 
found");
+#endif
+          }
+
+          prop = of_get_property(node, "vhold-set", NULL);
+          if (prop) {
+                      /* from 0b000 to 0b111 */
+#ifdef DEBUG
+                      dev_info(&pdev->dev, "set vhold-set property to 
%02X",
+                                  ((*prop)>>24));
+#endif
+                      ret = regmap_update_bits(power->regmap,
+                                              AXP20X_VBUS_IPSOUT_MGMT,
+                                             
 AXP20X_VBUS_IPSOUT_MGMT_VHOLD_SET_MASK,
+                                              ((*prop)>>24) << 
AXP20X_VBUS_IPSOUT_MGMT_VHOLD_SET_SHIFT);
+                      if (ret)
+                                  return ret;
+          } else {
+#ifdef DEBUG
+                      dev_info(&pdev->dev, "no vhold-set property found");
+#endif
+          }
+
+          prop = of_get_property(node, "ibus-limit", NULL);
+          if (prop) {
+                      /* from 0b0 to 0b11 */
+#ifdef DEBUG
+                      dev_info(&pdev->dev, "set ibus-limit property to 
%02X",
+                                  ((*prop)>>24));
+#endif
+                      ret = regmap_update_bits(power->regmap, 
AXP20X_VBUS_IPSOUT_MGMT,
+                                                         
 AXP20X_VBUS_IPSOUT_MGMT_IBUS_MASK,
+                                                          ((*prop)>>24));
+                      if (ret)
+                                  return ret;
+          } else {
+#ifdef DEBUG
+                      dev_info(&pdev->dev, "no ibus-limit property found");
+#endif
+          }
+
+          return 0;
+}
+
static int axp20x_usb_power_probe(struct platform_device *pdev)
{
           struct axp20x_dev *axp20x = dev_get_drvdata(pdev->dev.parent);
@@ -172,6 +272,7 @@ static int axp20x_usb_power_probe(struct
           static const char * const irq_names[] = { "VBUS_PLUGIN",
                       "VBUS_REMOVAL", "VBUS_VALID", "VBUS_NOT_VALID" };
           int i, irq, ret;
+          struct device_node *node;
            if (!of_device_is_available(pdev->dev.of_node))
                       return -ENODEV;
@@ -208,6 +309,11 @@ static int axp20x_usb_power_probe(struct
           if (IS_ERR(power->supply))
                       return PTR_ERR(power->supply);
+
+          /* read DT configurations parameters, if available */
+          for_each_compatible_node(node, NULL, 
"x-powers,axp202-usb-power-supply")
+                                  axp20x_usb_power_read_params(node, 
power, pdev);
+
           /* Request irqs after registering, as irqs may trigger 
immediately */
           for (i = 0; i < ARRAY_SIZE(irq_names); i++) {
                       irq = platform_get_irq_byname(pdev, irq_names[i]);
---

-- 
You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

------=_Part_802_1108009033.1463507260916
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdj5heHAyMHhfdXNiX3Bvd2VyLmMgaXMgbW9kaWZpZWQgdG8gcmVh
ZCB0aG9zZSBwYXJhbWV0ZXJzIGZyb20gdGhlIGRldmljZSB0cmVlIGNvbmZpZ3VyYXRpb24uPC9k
aXY+PGRpdj5pZiBhIGNvbmZpZ3VyYXRpb24gdmFsdWUgaXMgbm90IGZvdW5kIHRoZW4gdGhlIGNv
cnJlc3BvbmRpbmcgcmVnaXN0ZXIgdmFsdWUgaXMgbm90IGNoYW5nZWQuPC9kaXY+PGRpdj48YnI+
PC9kaXY+PGRpdj5hbHNvLCBkZWJ1ZyBtZXNzYWdlcyBhcmUgYWRkZWQsIGNvbnRyb2xsZWQgYnkg
JnF1b3Q7Q09ORklHX1BPV0VSX1NVUFBMWV9ERUJVRyZxdW90OyA6wqA8L2Rpdj48ZGl2Pjxicj48
L2Rpdj48ZGl2PlNpZ25lZC1vZmYtYnk6IEVuZSBBbGV4YW5kcnUgJmx0OzxhIGhyZWY9Im1haWx0
bzplbmUuYWxleGFuZHJ1QGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiIHJlbD0ibm9mb2xsb3ci
IHN0eWxlPSJjdXJzb3I6IHBvaW50ZXI7Ij5lbmUuYWxleGFuZHJ1QGdtYWlsLmNvbTwvYT4mZ3Q7
PGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+LS0tPC9kaXY+PGRp
dj48ZGl2PmRpZmYgLXVwck4gLVggbGludXgtc3VueGktb3JpZ2luYWwvRG9jdW1lbnRhdGlvbi9k
b250ZGlmZiBsaW51eC1zdW54aS1vcmlnaW5hbC9kcml2ZXJzL3Bvd2VyL2F4cDIweF91c2JfcG93
ZXIuYyBsaW51eC1zdW54aS9kcml2ZXJzL3Bvd2VyL2F4cDIweF91c2JfcG93ZXIuYzwvZGl2Pjxk
aXY+LS0tIGxpbnV4LXN1bnhpLW9yaWdpbmFsL2RyaXZlcnMvcG93ZXIvYXhwMjB4X3VzYl9wb3dl
ci5jIMKgMjAxNi0wNS0wOSAxNjo1MTo0NC4wMDAwMDAwMDAgKzAyMDA8L2Rpdj48ZGl2PisrKyBs
aW51eC1zdW54aS9kcml2ZXJzL3Bvd2VyL2F4cDIweF91c2JfcG93ZXIuYyDCoCDCoCDCoCDCoCDC
oDIwMTYtMDUtMTEgMTM6MjY6MjQuNDQ0NjgxNTc5ICswMjAwPC9kaXY+PGRpdj5AQCAtNDEsNiAr
NDEsMTkgQEA8L2Rpdj48ZGl2PsKgI2RlZmluZSBBWFAyMFhfVkJVU19NT05fVkJVU19WQUxJRCDC
oCDCoCDCoCBCSVQoMyk8L2Rpdj48ZGl2PisvKiBiaXQgZGVmaW5lcyBmb3IgUkVHIDMwSDogVkJV
Uy1JUFNPVVQgUG93ZXIgUGF0aCBNYW5hZ2VtZW50ICovPC9kaXY+PGRpdj4rLyogVkJVUyBWSE9M
RCB2b2x0YWdlIGxpbWl0aW5nIGNvbnRyb2wgwqAqLzwvZGl2PjxkaXY+KyNkZWZpbmUgQVhQMjBY
X1ZCVVNfSVBTT1VUX01HTVRfVkhPTEQgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
QklUKDYpPC9kaXY+PGRpdj4rI2RlZmluZSBBWFAyMFhfVkJVU19JUFNPVVRfTUdNVF9WSE9MRF9F
TkEgwqBCSVQoNik8L2Rpdj48ZGl2PisjZGVmaW5lIEFYUDIwWF9WQlVTX0lQU09VVF9NR01UX1ZI
T0xEX0RJUyDCoCDCoEJJVCgwKTwvZGl2PjxkaXY+Ky8qIFZIT0xEIFNldCB2b2x0YWdlICovPC9k
aXY+PGRpdj4rI2RlZmluZSBBWFAyMFhfVkJVU19JUFNPVVRfTUdNVF9WSE9MRF9TRVRfTUFTSyAo
QklUKDUpfEJJVCg0KXxCSVQoMykpPC9kaXY+PGRpdj4rI2RlZmluZSBBWFAyMFhfVkJVU19JUFNP
VVRfTUdNVF9WSE9MRF9TRVRfU0hJRlQgKDMpPC9kaXY+PGRpdj4rLyogVkJVUyBjdXJyZW50LWxp
bWl0IHNlbGVjdGlvbiAqLzwvZGl2PjxkaXY+KyNkZWZpbmUgQVhQMjBYX1ZCVVNfSVBTT1VUX01H
TVRfSUJVU19NQVNLIChCSVQoMSkgfCBCSVQoMCkpPC9kaXY+PGRpdj4rPC9kaXY+PGRpdj4rPC9k
aXY+PGRpdj4rPC9kaXY+PGRpdj5zdHJ1Y3QgYXhwMjB4X3VzYl9wb3dlciB7PC9kaXY+PGRpdj7C
oCDCoCDCoCDCoCDCoCDCoHN0cnVjdCByZWdtYXAgKnJlZ21hcDs8L2Rpdj48ZGl2PsKgIMKgIMKg
IMKgIMKgIMKgc3RydWN0IHBvd2VyX3N1cHBseSAqc3VwcGx5OzwvZGl2PjxkaXY+QEAgLTE2NCw2
ICsxNzcsOTMgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwb3dlcl9zdXBwbHlfZGVzYyBheDwvZGl2
PjxkaXY+wqAgwqAgwqAgwqAgwqAgwqAuZ2V0X3Byb3BlcnR5ID0gYXhwMjB4X3VzYl9wb3dlcl9n
ZXRfcHJvcGVydHksPC9kaXY+PGRpdj59OzwvZGl2PjxkaXY+KzwvZGl2PjxkaXY+K3N0YXRpYyBp
bnQgYXhwMjB4X3VzYl9wb3dlcl9yZWFkX3BhcmFtcyhjb25zdCBzdHJ1Y3QgZGV2aWNlX25vZGUg
Km5vZGUsPC9kaXY+PGRpdj4rIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RydWN0
IGF4cDIweF91c2JfcG93ZXIgKnBvd2VyLCBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KTwv
ZGl2PjxkaXY+K3s8L2Rpdj48ZGl2PisgwqAgwqAgwqAgwqAgwqBjb25zdCB1MzIgKnByb3A7PC9k
aXY+PGRpdj4rIMKgIMKgIMKgIMKgIMKgaW50IHJldDs8L2Rpdj48ZGl2Pis8L2Rpdj48ZGl2Pisg
wqAgwqAgwqAgwqAgwqAvKjwvZGl2PjxkaXY+KyDCoCDCoCDCoCDCoCDCoCogY29uZmlndXJhYmxl
IHBhcmFtZXRlcnMgYXJlOjwvZGl2PjxkaXY+KyDCoCDCoCDCoCDCoCDCoCogcmVnaXN0ZXIgVkJV
Uy1JUFNPVVQ8L2Rpdj48ZGl2PisgwqAgwqAgwqAgwqAgwqAqIGJpdCA2OiBWQlVTIFZIT0xEIHZv
bHRhZ2UgbGltaXRpbmcgY29udHJvbDwvZGl2PjxkaXY+KyDCoCDCoCDCoCDCoCDCoCogwqAgwqAg
wqAgwqAgwqAgMDogTm8gdm9sdGFnZSBkcm9wIGxpbWl0PC9kaXY+PGRpdj4rIMKgIMKgIMKgIMKg
IMKgKiDCoCDCoCDCoCDCoCDCoCAxOiBMaW1pdCB0aGUgdm9sdGFnZSBkcm9wPC9kaXY+PGRpdj4r
IMKgIMKgIMKgIMKgIMKgKiBiaXQgNS0zIFZIT0xEIFNldCBWSE9MRCA9IFs0LjArIChCaXQ1LTMp
ICogMC4xXSBWPC9kaXY+PGRpdj4rIMKgIMKgIMKgIMKgIMKgKiBiaXQgMS0wIFZCVVMgY3VycmVu
dC1saW1pdCBzZWxlY3Rpb248L2Rpdj48ZGl2PisgwqAgwqAgwqAgwqAgwqAqIMKgIMKgIMKgIMKg
IMKgIDAwOjkwMG1BPC9kaXY+PGRpdj4rIMKgIMKgIMKgIMKgIMKgKiDCoCDCoCDCoCDCoCDCoCAw
MTo1MDBtQTwvZGl2PjxkaXY+KyDCoCDCoCDCoCDCoCDCoCogwqAgwqAgwqAgwqAgwqAgMTA6MTAw
bUE8L2Rpdj48ZGl2PisgwqAgwqAgwqAgwqAgwqAqIMKgIMKgIMKgIMKgIMKgIDExOm5vIGxpbWl0
PC9kaXY+PGRpdj4rIMKgIMKgIMKgIMKgIMKgKi88L2Rpdj48ZGl2Pis8L2Rpdj48ZGl2PisgwqAg
wqAgwqAgwqAgwqBwcm9wID0gb2ZfZ2V0X3Byb3BlcnR5KG5vZGUsICZxdW90O3Zob2xkLWVuYWJs
ZSZxdW90OywgTlVMTCk7PC9kaXY+PGRpdj4rIMKgIMKgIMKgIMKgIMKgaWYgKHByb3ApIHs8L2Rp
dj48ZGl2PisgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAvKiBlaXRoZXIgMSBvciAw
ICovPC9kaXY+PGRpdj4rI2lmZGVmIERFQlVHPC9kaXY+PGRpdj4rIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgZGV2X2luZm8oJmFtcDtwZGV2LSZndDtkZXYsICZxdW90O3NldCB2aG9s
ZC1lbmFibGUgcHJvcGVydHkgdG8gJWQmcXVvdDssPC9kaXY+PGRpdj4rIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgISEoKnByb3ApKTs8L2Rpdj48ZGl2
PisjZW5kaWY8L2Rpdj48ZGl2PisgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAo
ISEoKnByb3ApKSB7PC9kaXY+PGRpdj4rIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgcmV0ID0gcmVnbWFwX3VwZGF0ZV9iaXRzKHBvd2VyLSZndDtyZWdt
YXAsPC9kaXY+PGRpdj4rIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgQVhQMjBYX1ZCVVNf
SVBTT1VUX01HTVQsPC9kaXY+PGRpdj4rIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgQVhQ
MjBYX1ZCVVNfSVBTT1VUX01HTVRfVkhPTEQsPC9kaXY+PGRpdj4rIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgQVhQMjBYX1ZCVVNfSVBTT1VUX01HTVRfVkhPTERfRU5BKTs8L2Rpdj48ZGl2
PisgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9IGVsc2UgezwvZGl2PjxkaXY+KyDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldCA9IHJl
Z21hcF91cGRhdGVfYml0cyhwb3dlci0mZ3Q7cmVnbWFwLDwvZGl2PjxkaXY+KyDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoEFYUDIwWF9WQlVTX0lQU09VVF9NR01ULDwvZGl2PjxkaXY+KyDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoEFYUDIwWF9WQlVTX0lQU09VVF9NR01UX1ZIT0xE
LDwvZGl2PjxkaXY+KyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoEFYUDIwWF9WQlVTX0lQ
U09VVF9NR01UX1ZIT0xEX0RJUyk7PC9kaXY+PGRpdj4rIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgfTwvZGl2PjxkaXY+KyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlm
IChyZXQpPC9kaXY+PGRpdj4rIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgcmV0dXJuIHJldDs8L2Rpdj48ZGl2PisgwqAgwqAgwqAgwqAgwqB9IGVsc2Ug
ezwvZGl2PjxkaXY+KyNpZmRlZiBERUJVRzwvZGl2PjxkaXY+KyDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoGRldl9pbmZvKCZhbXA7cGRldi0mZ3Q7ZGV2LCAmcXVvdDtubyB2aG9sZC1l
bmFibGUgcHJvcGVydHkgZm91bmQmcXVvdDspOzwvZGl2PjxkaXY+KyNlbmRpZjwvZGl2PjxkaXY+
KyDCoCDCoCDCoCDCoCDCoH08L2Rpdj48ZGl2Pis8L2Rpdj48ZGl2PisgwqAgwqAgwqAgwqAgwqBw
cm9wID0gb2ZfZ2V0X3Byb3BlcnR5KG5vZGUsICZxdW90O3Zob2xkLXNldCZxdW90OywgTlVMTCk7
PC9kaXY+PGRpdj4rIMKgIMKgIMKgIMKgIMKgaWYgKHByb3ApIHs8L2Rpdj48ZGl2PisgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAvKiBmcm9tIDBiMDAwIHRvIDBiMTExICovPC9kaXY+
PGRpdj4rI2lmZGVmIERFQlVHPC9kaXY+PGRpdj4rIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgZGV2X2luZm8oJmFtcDtwZGV2LSZndDtkZXYsICZxdW90O3NldCB2aG9sZC1zZXQgcHJv
cGVydHkgdG8gJTAyWCZxdW90Oyw8L2Rpdj48ZGl2PisgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAoKCpwcm9wKSZndDsmZ3Q7MjQpKTs8L2Rpdj48ZGl2
PisjZW5kaWY8L2Rpdj48ZGl2PisgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXQg
PSByZWdtYXBfdXBkYXRlX2JpdHMocG93ZXItJmd0O3JlZ21hcCw8L2Rpdj48ZGl2PisgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBBWFAyMFhfVkJVU19JUFNPVVRfTUdNVCw8L2Rpdj48ZGl2PisgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBBWFAy
MFhfVkJVU19JUFNPVVRfTUdNVF9WSE9MRF9TRVRfTUFTSyw8L2Rpdj48ZGl2PisgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAoKCpwcm9wKSZndDsmZ3Q7MjQpICZsdDsmbHQ7IEFYUDIwWF9WQlVTX0lQU09VVF9NR01UX1ZI
T0xEX1NFVF9TSElGVCk7PC9kaXY+PGRpdj4rIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgaWYgKHJldCk8L2Rpdj48ZGl2PisgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqByZXR1cm4gcmV0OzwvZGl2PjxkaXY+KyDCoCDCoCDCoCDCoCDCoH0g
ZWxzZSB7PC9kaXY+PGRpdj4rI2lmZGVmIERFQlVHPC9kaXY+PGRpdj4rIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgZGV2X2luZm8oJmFtcDtwZGV2LSZndDtkZXYsICZxdW90O25vIHZo
b2xkLXNldCBwcm9wZXJ0eSBmb3VuZCZxdW90Oyk7PC9kaXY+PGRpdj4rI2VuZGlmPC9kaXY+PGRp
dj4rIMKgIMKgIMKgIMKgIMKgfTwvZGl2PjxkaXY+KzwvZGl2PjxkaXY+KyDCoCDCoCDCoCDCoCDC
oHByb3AgPSBvZl9nZXRfcHJvcGVydHkobm9kZSwgJnF1b3Q7aWJ1cy1saW1pdCZxdW90OywgTlVM
TCk7PC9kaXY+PGRpdj4rIMKgIMKgIMKgIMKgIMKgaWYgKHByb3ApIHs8L2Rpdj48ZGl2PisgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAvKiBmcm9tIDBiMCB0byAwYjExICovPC9kaXY+
PGRpdj4rI2lmZGVmIERFQlVHPC9kaXY+PGRpdj4rIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgZGV2X2luZm8oJmFtcDtwZGV2LSZndDtkZXYsICZxdW90O3NldCBpYnVzLWxpbWl0IHBy
b3BlcnR5IHRvICUwMlgmcXVvdDssPC9kaXY+PGRpdj4rIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKCgqcHJvcCkmZ3Q7Jmd0OzI0KSk7PC9kaXY+PGRp
dj4rI2VuZGlmPC9kaXY+PGRpdj4rIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0
ID0gcmVnbWFwX3VwZGF0ZV9iaXRzKHBvd2VyLSZndDtyZWdtYXAsIEFYUDIwWF9WQlVTX0lQU09V
VF9NR01ULDwvZGl2PjxkaXY+KyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoEFYUDIwWF9W
QlVTX0lQU09VVF9NR01UX0lCVVNfTUFTSyw8L2Rpdj48ZGl2PisgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAoKCpwcm9wKSZndDsmZ3Q7MjQpKTs8L2Rpdj48ZGl2PisgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAocmV0KTwvZGl2PjxkaXY+KyDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybiByZXQ7PC9kaXY+PGRpdj4r
IMKgIMKgIMKgIMKgIMKgfSBlbHNlIHs8L2Rpdj48ZGl2PisjaWZkZWYgREVCVUc8L2Rpdj48ZGl2
PisgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBkZXZfaW5mbygmYW1wO3BkZXYtJmd0
O2RldiwgJnF1b3Q7bm8gaWJ1cy1saW1pdCBwcm9wZXJ0eSBmb3VuZCZxdW90Oyk7PC9kaXY+PGRp
dj4rI2VuZGlmPC9kaXY+PGRpdj4rIMKgIMKgIMKgIMKgIMKgfTwvZGl2PjxkaXY+KzwvZGl2Pjxk
aXY+KyDCoCDCoCDCoCDCoCDCoHJldHVybiAwOzwvZGl2PjxkaXY+K308L2Rpdj48ZGl2Pis8L2Rp
dj48ZGl2PnN0YXRpYyBpbnQgYXhwMjB4X3VzYl9wb3dlcl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KTwvZGl2PjxkaXY+ezwvZGl2PjxkaXY+wqAgwqAgwqAgwqAgwqAgwqBzdHJ1
Y3QgYXhwMjB4X2RldiAqYXhwMjB4ID0gZGV2X2dldF9kcnZkYXRhKHBkZXYtJmd0O2Rldi5wYXJl
bnQpOzwvZGl2PjxkaXY+QEAgLTE3Miw2ICsyNzIsNyBAQCBzdGF0aWMgaW50IGF4cDIweF91c2Jf
cG93ZXJfcHJvYmUoc3RydWN0PC9kaXY+PGRpdj7CoCDCoCDCoCDCoCDCoCDCoHN0YXRpYyBjb25z
dCBjaGFyICogY29uc3QgaXJxX25hbWVzW10gPSB7ICZxdW90O1ZCVVNfUExVR0lOJnF1b3Q7LDwv
ZGl2PjxkaXY+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmcXVvdDtWQlVTX1JF
TU9WQUwmcXVvdDssICZxdW90O1ZCVVNfVkFMSUQmcXVvdDssICZxdW90O1ZCVVNfTk9UX1ZBTElE
JnF1b3Q7IH07PC9kaXY+PGRpdj7CoCDCoCDCoCDCoCDCoCDCoGludCBpLCBpcnEsIHJldDs8L2Rp
dj48ZGl2PisgwqAgwqAgwqAgwqAgwqBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGU7PC9kaXY+PGRp
dj7CoCDCoCDCoCDCoCDCoCDCoCBpZiAoIW9mX2RldmljZV9pc19hdmFpbGFibGUocGRldi0mZ3Q7
ZGV2Lm9mX25vZGUpKTwvZGl2PjxkaXY+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqByZXR1cm4gLUVOT0RFVjs8L2Rpdj48ZGl2PkBAIC0yMDgsNiArMzA5LDExIEBAIHN0YXRpYyBp
bnQgYXhwMjB4X3VzYl9wb3dlcl9wcm9iZShzdHJ1Y3Q8L2Rpdj48ZGl2PsKgIMKgIMKgIMKgIMKg
IMKgaWYgKElTX0VSUihwb3dlci0mZ3Q7c3VwcGx5KSk8L2Rpdj48ZGl2PsKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJuIFBUUl9FUlIocG93ZXItJmd0O3N1cHBseSk7PC9k
aXY+PGRpdj4rPC9kaXY+PGRpdj4rIMKgIMKgIMKgIMKgIMKgLyogcmVhZCBEVCBjb25maWd1cmF0
aW9ucyBwYXJhbWV0ZXJzLCBpZiBhdmFpbGFibGUgKi88L2Rpdj48ZGl2PisgwqAgwqAgwqAgwqAg
wqBmb3JfZWFjaF9jb21wYXRpYmxlX25vZGUobm9kZSwgTlVMTCwgJnF1b3Q7eC1wb3dlcnMsYXhw
MjAyLXVzYi1wb3dlci1zdXBwbHkmcXVvdDspPC9kaXY+PGRpdj4rIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYXhwMjB4X3VzYl9wb3dlcl9yZWFkX3Bh
cmFtcyhub2RlLCBwb3dlciwgcGRldik7PC9kaXY+PGRpdj4rPC9kaXY+PGRpdj7CoCDCoCDCoCDC
oCDCoCDCoC8qIFJlcXVlc3QgaXJxcyBhZnRlciByZWdpc3RlcmluZywgYXMgaXJxcyBtYXkgdHJp
Z2dlciBpbW1lZGlhdGVseSAqLzwvZGl2PjxkaXY+wqAgwqAgwqAgwqAgwqAgwqBmb3IgKGkgPSAw
OyBpICZsdDsgQVJSQVlfU0laRShpcnFfbmFtZXMpOyBpKyspIHs8L2Rpdj48ZGl2PsKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaXJxID0gcGxhdGZvcm1fZ2V0X2lycV9ieW5hbWUo
cGRldiwgaXJxX25hbWVzW2ldKTs8L2Rpdj48L2Rpdj48ZGl2Pi0tLTwvZGl2PjwvZGl2Pg0KDQo8
cD48L3A+CgotLSA8YnIgLz4KWW91IHJlY2VpdmVkIHRoaXMgbWVzc2FnZSBiZWNhdXNlIHlvdSBh
cmUgc3Vic2NyaWJlZCB0byB0aGUgR29vZ2xlIEdyb3VwcyAmcXVvdDtsaW51eC1zdW54aSZxdW90
OyBncm91cC48YnIgLz4KVG8gdW5zdWJzY3JpYmUgZnJvbSB0aGlzIGdyb3VwIGFuZCBzdG9wIHJl
Y2VpdmluZyBlbWFpbHMgZnJvbSBpdCwgc2VuZCBhbiBlbWFpbCB0byA8YSBocmVmPSJtYWlsdG86
bGludXgtc3VueGkrdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbSI+bGludXgtc3VueGkrdW5z
dWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT4uPGJyIC8+CkZvciBtb3JlIG9wdGlvbnMsIHZp
c2l0IDxhIGhyZWY9Imh0dHBzOi8vZ3JvdXBzLmdvb2dsZS5jb20vZC9vcHRvdXQiPmh0dHBzOi8v
Z3JvdXBzLmdvb2dsZS5jb20vZC9vcHRvdXQ8L2E+LjxiciAvPgo=
------=_Part_802_1108009033.1463507260916--

------=_Part_801_1555850365.1463507260916--
