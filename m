From: Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM:dts:sun7i:ps2 added nodes for Sun7i
 A20 PS2 controller. added ps2 nodes in lime2 board dts.
Date: Fri, 5 Dec 2014 14:23:39 +0530
Message-ID: <CAEzqOZsY_XUAq1odfzz4bUpOV_eQoupAgyFJoVjFHyJAyWOS8w@mail.gmail.com>
References: <1417647963-28077-1-git-send-email-VishnuPatekar0510@gmail.com>
	<5480BE43.9050308@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary=089e01177a418b5b5f05097436c5
Return-path: <linux-sunxi+bncBD64TFVR3YIBBE7FQWSAKGQEAYTD3OQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <5480BE43.9050308-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, inux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--089e01177a418b5b5f05097436c5
Content-Type: text/plain; charset=UTF-8

On Fri, Dec 5, 2014 at 1:34 AM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:

> Hi,
>
> On 12/04/2014 12:06 AM, vishnupatekar wrote:
>
>> ---
>>   arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts |   10 ++++++++
>>   arch/arm/boot/dts/sun7i-a20.dtsi                |   30
>> ++++++++++++++++++++++-
>>   2 files changed, 39 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts
>> b/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts
>> index ed364d5..374897b 100644
>> --- a/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts
>> +++ b/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts
>> @@ -112,6 +112,16 @@
>>                         pinctrl-0 = <&uart0_pins_a>;
>>                         status = "okay";
>>                 };
>> +               ps20: ps2@0x01c2a000 {
>> +                       pinctrl-names = "default";
>> +                       pinctrl-0 = <&ps2_0_pins>;
>> +                       status = "okay";
>> +               };
>> +               ps21: ps2@0x01c2a400 {
>> +                       pinctrl-names = "default";
>> +                       pinctrl-0 = <&ps2_1_pins>;
>> +                       status = "okay";
>> +               };
>>
>
> I don't think this should be enabled by default, since there
> is no ps2 connector on the board, and the pins can be used
> in a different manner too.
>
I do think it is useful to have it in there as an example for people who
> want to use
> it, but commented out, please also add a comment stating that using ps20
> conflicts
> with using the hdmi connector.
>
> Okie, For lime2 board dts file, I'll comment out these ps20 and ps21 nodes
stating that In case uncommented this will confilt with hdmi connector.

This also will be included in next patch version.



> Regards,
>
> Hans
>
>
>
>>                 i2c0: i2c@01c2ac00 {
>>                         pinctrl-names = "default";
>> diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi
>> b/arch/arm/boot/dts/sun7i-a20.dtsi
>> index 8605f2b..c77635d 100644
>> --- a/arch/arm/boot/dts/sun7i-a20.dtsi
>> +++ b/arch/arm/boot/dts/sun7i-a20.dtsi
>> @@ -357,7 +357,7 @@
>>
>>                 usb_clk: clk@01c200cc {
>>                         #clock-cells = <1>;
>> -                       #reset-cells = <1>;
>> +                       #reset-cells = <1>;
>>                         compatible = "allwinner,sun4i-a10-usb-clk";
>>                         reg = <0x01c200cc 0x4>;
>>                         clocks = <&pll6 1>;
>> @@ -852,6 +852,19 @@
>>                                     allwinner,drive = <0>;
>>                                     allwinner,pull = <0>;
>>                         };
>> +                       ps2_0_pins: ps2_0@0 {
>> +                                   allwinner,pins = "PI20","PI21";
>> +                                   allwinner,function = "ps2";
>> +                                   allwinner,drive = <0>;
>> +                                   allwinner,pull = <0>;
>> +                       };
>> +                       ps2_1_pins: ps2_1@0 {
>> +                                   allwinner,pins = "PH12","PH13";
>> +                                   allwinner,function = "ps2";
>> +                                   allwinner,drive = <0>;
>> +                                   allwinner,pull = <0>;
>> +                       };
>> +
>>                 };
>>
>>                 timer@01c20c00 {
>> @@ -1079,5 +1092,20 @@
>>                         #interrupt-cells = <3>;
>>                         interrupts = <1 9 0xf04>;
>>                 };
>> +               ps20: ps2@0x01c2a000 {
>> +                       compatible = "allwinner,sun7i-a20-ps2";
>> +                       reg = <0x01c2a000 0x400>;
>> +                       interrupts = <0 62 4>;
>> +                       clocks = <&apb1_gates 6>;
>> +                       status = "disabled";
>> +               };
>> +               ps21: ps2@0x01c2a400 {
>> +                       compatible = "allwinner,sun7i-a20-ps2";
>> +                       reg = <0x01c2a400 0x400>;
>> +                       interrupts = <0 63 4>;
>> +                       clocks = <&apb1_gates 7>;
>> +                       status = "disabled";
>> +               };
>> +
>>         };
>>   };
>>
>>

-- 
You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--089e01177a418b5b5f05097436c5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX2V4dHJhIj48YnI+PGRpdiBjbGFz
cz0iZ21haWxfcXVvdGUiPk9uIEZyaSwgRGVjIDUsIDIwMTQgYXQgMTozNCBBTSwgSGFucyBkZSBH
b2VkZSA8c3BhbiBkaXI9Imx0ciI+Jmx0OzxhIGhyZWY9Im1haWx0bzpoZGVnb2VkZUByZWRoYXQu
Y29tIiB0YXJnZXQ9Il9ibGFuayI+aGRlZ29lZGVAcmVkaGF0LmNvbTwvYT4mZ3Q7PC9zcGFuPiB3
cm90ZTo8YnI+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBw
eCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0LXdpZHRoOjFweDtib3JkZXItbGVmdC1jb2xvcjpy
Z2IoMjA0LDIwNCwyMDQpO2JvcmRlci1sZWZ0LXN0eWxlOnNvbGlkO3BhZGRpbmctbGVmdDoxZXgi
PkhpLDxzcGFuIGNsYXNzPSIiPjxicj4NCjxicj4NCk9uIDEyLzA0LzIwMTQgMTI6MDYgQU0sIHZp
c2hudXBhdGVrYXIgd3JvdGU6PGJyPg0KPGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBz
dHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0LXdpZHRoOjFweDtib3Jk
ZXItbGVmdC1jb2xvcjpyZ2IoMjA0LDIwNCwyMDQpO2JvcmRlci1sZWZ0LXN0eWxlOnNvbGlkO3Bh
ZGRpbmctbGVmdDoxZXgiPg0KLS0tPGJyPg0KwqAgYXJjaC9hcm0vYm9vdC9kdHMvc3VuN2ktYTIw
LTx1PjwvdT5vbGludXhpbm8tbGltZTIuZHRzIHzCoCDCoDEwICsrKysrKysrPGJyPg0KwqAgYXJj
aC9hcm0vYm9vdC9kdHMvc3VuN2ktYTIwLjx1PjwvdT5kdHNpwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgfMKgIMKgMzAgKysrKysrKysrKysrKysrKysrKysrKy08YnI+DQrCoCAyIGZpbGVzIGNoYW5n
ZWQsIDM5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSk8YnI+DQo8YnI+DQpkaWZmIC0tZ2l0
IGEvYXJjaC9hcm0vYm9vdC9kdHMvc3VuN2ktYTIwLTx1PjwvdT5vbGludXhpbm8tbGltZTIuZHRz
IGIvYXJjaC9hcm0vYm9vdC9kdHMvc3VuN2ktYTIwLTx1PjwvdT5vbGludXhpbm8tbGltZTIuZHRz
PGJyPg0KaW5kZXggZWQzNjRkNS4uMzc0ODk3YiAxMDA2NDQ8YnI+DQotLS0gYS9hcmNoL2FybS9i
b290L2R0cy9zdW43aS1hMjAtPHU+PC91Pm9saW51eGluby1saW1lMi5kdHM8YnI+DQorKysgYi9h
cmNoL2FybS9ib290L2R0cy9zdW43aS1hMjAtPHU+PC91Pm9saW51eGluby1saW1lMi5kdHM8YnI+
DQpAQCAtMTEyLDYgKzExMiwxNiBAQDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIHBpbmN0cmwtMCA9ICZsdDsmYW1wO3VhcnQwX3BpbnNfYSZndDs7PGJyPg0KwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgc3RhdHVzID0gJnF1b3Q7b2theSZxdW90Ozs8
YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB9Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHBzMjA6IHBzMkAweDAxYzJhMDAwIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBwaW5jdHJsLW5hbWVzID0gJnF1b3Q7ZGVmYXVsdCZxdW90Ozs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5jdHJsLTAgPSAmbHQ7JmFtcDtwczJf
MF9waW5zJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdGF0
dXMgPSAmcXVvdDtva2F5JnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcHMyMTogcHMyQDB4MDFjMmE0MDAgezxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbmN0cmwtbmFtZXMgPSAmcXVvdDtk
ZWZhdWx0JnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBp
bmN0cmwtMCA9ICZsdDsmYW1wO3BzMl8xX3BpbnMmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O29rYXkmcXVvdDs7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQo8L2Jsb2NrcXVvdGU+DQo8YnI+PC9zcGFuPg0KSSBk
b24mIzM5O3QgdGhpbmsgdGhpcyBzaG91bGQgYmUgZW5hYmxlZCBieSBkZWZhdWx0LCBzaW5jZSB0
aGVyZTxicj4NCmlzIG5vIHBzMiBjb25uZWN0b3Igb24gdGhlIGJvYXJkLCBhbmQgdGhlIHBpbnMg
Y2FuIGJlIHVzZWQ8YnI+DQppbiBhIGRpZmZlcmVudCBtYW5uZXIgdG9vLsKgPGJyPjwvYmxvY2tx
dW90ZT48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBw
eCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQtd2lkdGg6MXB4O2JvcmRlci1sZWZ0LWNvbG9yOnJnYigy
MDQsMjA0LDIwNCk7Ym9yZGVyLWxlZnQtc3R5bGU6c29saWQ7cGFkZGluZy1sZWZ0OjFleCI+DQpJ
IGRvIHRoaW5rIGl0IGlzIHVzZWZ1bCB0byBoYXZlIGl0IGluIHRoZXJlIGFzIGFuIGV4YW1wbGUg
Zm9yIHBlb3BsZSB3aG8gd2FudCB0byB1c2U8YnI+DQppdCwgYnV0IGNvbW1lbnRlZCBvdXQsIHBs
ZWFzZSBhbHNvIGFkZCBhIGNvbW1lbnQgc3RhdGluZyB0aGF0IHVzaW5nIHBzMjAgY29uZmxpY3Rz
PGJyPg0Kd2l0aCB1c2luZyB0aGUgaGRtaSBjb25uZWN0b3IuPGJyPg0KPGJyPjwvYmxvY2txdW90
ZT48ZGl2Pk9raWUsIEZvciBsaW1lMiBib2FyZCBkdHMgZmlsZSwgSSYjMzk7bGwgY29tbWVudCBv
dXQgdGhlc2UgcHMyMCBhbmQgcHMyMSBub2RlcyBzdGF0aW5nIHRoYXQgSW4gY2FzZSB1bmNvbW1l
bnRlZCB0aGlzIHdpbGwgY29uZmlsdCB3aXRoIGhkbWkgY29ubmVjdG9yLjwvZGl2PjxkaXY+PGJy
PjwvZGl2PjxkaXY+VGhpcyBhbHNvIHdpbGwgYmUgaW5jbHVkZWQgaW4gbmV4dCBwYXRjaCB2ZXJz
aW9uLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+wqA8L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0i
Z21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQt
d2lkdGg6MXB4O2JvcmRlci1sZWZ0LWNvbG9yOnJnYigyMDQsMjA0LDIwNCk7Ym9yZGVyLWxlZnQt
c3R5bGU6c29saWQ7cGFkZGluZy1sZWZ0OjFleCI+DQpSZWdhcmRzLDxicj4NCjxicj4NCkhhbnM8
ZGl2IGNsYXNzPSIiPjxkaXYgY2xhc3M9Img1Ij48YnI+DQo8YnI+DQo8YmxvY2txdW90ZSBjbGFz
cz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxl
ZnQtd2lkdGg6MXB4O2JvcmRlci1sZWZ0LWNvbG9yOnJnYigyMDQsMjA0LDIwNCk7Ym9yZGVyLWxl
ZnQtc3R5bGU6c29saWQ7cGFkZGluZy1sZWZ0OjFleCI+DQo8YnI+DQrCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCBpMmMwOiBpMmNAMDFjMmFjMDAgezxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIHBpbmN0cmwtbmFtZXMgPSAmcXVvdDtkZWZhdWx0JnF1b3Q7Ozxicj4NCmRp
ZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdW43aS1hMjAuPHU+PC91PmR0c2kgYi9hcmNo
L2FybS9ib290L2R0cy9zdW43aS1hMjAuPHU+PC91PmR0c2k8YnI+DQppbmRleCA4NjA1ZjJiLi5j
Nzc2MzVkIDEwMDY0NDxicj4NCi0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N1bjdpLWEyMC48dT48
L3U+ZHRzaTxicj4NCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N1bjdpLWEyMC48dT48L3U+ZHRz
aTxicj4NCkBAIC0zNTcsNyArMzU3LDcgQEA8YnI+DQo8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCB1c2JfY2xrOiBjbGtAMDFjMjAwY2Mgezxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgICNjbG9jay1jZWxscyA9ICZsdDsxJmd0Ozs8YnI+DQotwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjcmVzZXQtY2VsbHMgPSAmbHQ7MSZndDs7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI3Jlc2V0LWNlbGxzID0gJmx0OzEmZ3Q7
Ozxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGNvbXBhdGlibGUgPSAm
cXVvdDthbGx3aW5uZXIsc3VuNGktYTEwLXVzYi1jbGsmcXVvdDs7PGJyPg0KwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVnID0gJmx0OzB4MDFjMjAwY2MgMHg0Jmd0Ozs8YnI+
DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBjbG9ja3MgPSAmbHQ7JmFtcDtw
bGw2IDEmZ3Q7Ozxicj4NCkBAIC04NTIsNiArODUyLDE5IEBAPGJyPg0KwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgYWxsd2lubmVyLGRyaXZlID0g
Jmx0OzAmZ3Q7Ozxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIGFsbHdpbm5lcixwdWxsID0gJmx0OzAmZ3Q7Ozxicj4NCsKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH07PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgcHMyXzBfcGluczogcHMyXzBAMCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYWxsd2lubmVyLHBpbnMgPSAmcXVv
dDtQSTIwJnF1b3Q7LCZxdW90O1BJMjEmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYWxsd2lubmVyLGZ1bmN0aW9uID0gJnF1
b3Q7cHMyJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGFsbHdpbm5lcixkcml2ZSA9ICZsdDswJmd0Ozs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBhbGx3aW5uZXIs
cHVsbCA9ICZsdDswJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqB9Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBzMl8xX3BpbnM6
IHBzMl8xQDAgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoGFsbHdpbm5lcixwaW5zID0gJnF1b3Q7UEgxMiZxdW90OywmcXVvdDtQSDEz
JnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGFsbHdpbm5lcixmdW5jdGlvbiA9ICZxdW90O3BzMiZxdW90Ozs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBhbGx3aW5u
ZXIsZHJpdmUgPSAmbHQ7MCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYWxsd2lubmVyLHB1bGwgPSAmbHQ7MCZndDs7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgfTs8YnI+DQo8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB0
aW1lckAwMWMyMGMwMCB7PGJyPg0KQEAgLTEwNzksNSArMTA5MiwyMCBAQDxicj4NCsKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICNpbnRlcnJ1cHQtY2VsbHMgPSAmbHQ7MyZndDs7
PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaW50ZXJydXB0cyA9ICZs
dDsxIDkgMHhmMDQmZ3Q7Ozxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH07PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgcHMyMDogcHMyQDB4MDFjMmEwMDAgezxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDthbGx3aW5uZXIs
c3VuN2ktYTIwLXBzMiZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqByZWcgPSAmbHQ7MHgwMWMyYTAwMCAweDQwMCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0cyA9ICZsdDswIDYyIDQmZ3Q7Ozxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrcyA9ICZsdDsmYW1wO2FwYjFf
Z2F0ZXMgNiZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3Rh
dHVzID0gJnF1b3Q7ZGlzYWJsZWQmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
fTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwczIxOiBwczJAMHgwMWMyYTQwMCB7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90
O2FsbHdpbm5lcixzdW43aS1hMjAtcHMyJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDAxYzJhNDAwIDB4NDAwJmd0Ozs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpbnRlcnJ1cHRzID0gJmx0OzAgNjMgNCZn
dDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xvY2tzID0gJmx0
OyZhbXA7YXBiMV9nYXRlcyA3Jmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtkaXNhYmxlZCZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQrCoCDCoCDCoCDCoCB9Ozxicj4NCsKgIH07PGJyPg0K
PGJyPg0KPC9ibG9ja3F1b3RlPg0KPC9kaXY+PC9kaXY+PC9ibG9ja3F1b3RlPjwvZGl2Pjxicj48
L2Rpdj48L2Rpdj4NCg0KPHA+PC9wPg0KDQotLSA8YnIgLz4KWW91IHJlY2VpdmVkIHRoaXMgbWVz
c2FnZSBiZWNhdXNlIHlvdSBhcmUgc3Vic2NyaWJlZCB0byB0aGUgR29vZ2xlIEdyb3VwcyAmcXVv
dDtsaW51eC1zdW54aSZxdW90OyBncm91cC48YnIgLz4KVG8gdW5zdWJzY3JpYmUgZnJvbSB0aGlz
IGdyb3VwIGFuZCBzdG9wIHJlY2VpdmluZyBlbWFpbHMgZnJvbSBpdCwgc2VuZCBhbiBlbWFpbCB0
byA8YSBocmVmPSJtYWlsdG86bGludXgtc3VueGkrdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNv
bSI+bGludXgtc3VueGkrdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT4uPGJyIC8+CkZv
ciBtb3JlIG9wdGlvbnMsIHZpc2l0IDxhIGhyZWY9Imh0dHBzOi8vZ3JvdXBzLmdvb2dsZS5jb20v
ZC9vcHRvdXQiPmh0dHBzOi8vZ3JvdXBzLmdvb2dsZS5jb20vZC9vcHRvdXQ8L2E+LjxiciAvPgo=
--089e01177a418b5b5f05097436c5--
