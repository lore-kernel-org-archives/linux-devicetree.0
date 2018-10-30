Return-Path: <SRS0=GFjx=NK=gmail.com=alcooperx@kernel.org>
MIME-Version: 1.0
From: Alan Cooper <alcooperx@gmail.com>
Date: Tue, 30 Oct 2018 18:30:59 -0400
Message-ID: <CAOGqxeWBmAahswHp+b_PzkyGs-9sOx3COpJnFVsbKhx14KLuUw@mail.gmail.com>
Subject: Re: [PATCH V2 2/6] usb: core: Add ability to skip phy exit on suspend
 and init on resume
Content-Type: multipart/alternative; boundary="0000000000007df073057979bf56"
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: ": Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>, Alan Stern <stern@rowland.harvard.edu>, Alban Bedel <albeu@free.fr>, Alex Elder <elder@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Avi Fishman <avifishman70@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Bjorn Andersson <bjorn.andersson@linaro.org>, "David S. Miller" <davem@davemloft.net>, DTML <devicetree@vger.kernel.org>, Dmitry Osipenko <digetx@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Hans de Goede <hdegoede@redhat.com>, James Hogan <jhogan@kernel.org>, Jianguo Sun <sunjianguo1@huawei.com>, Johan Hovold <johan@kernel.org>, Kees Cook <keescook@chromium.org>, USB list <linux-usb@vger.kernel.org>, Lu Baolu <baolu.lu@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Mathias Nyman <mathias.nyman@intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Rishabh Bhatnagar <rishabhb@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Roger Quadros <rogerq@ti.com>
List-ID: <devicetree@vger.kernel.org>

--0000000000007df073057979bf56
Content-Type: text/plain; charset="UTF-8"

On 10/17/18 9:46 PM, Chunfeng Yun wrote:> hi,
>
> On Wed, 2018-10-17 at 18:29 -0400, Al Cooper wrote:
>> Add the ability to skip calling the PHY's exit routine on suspend
>> and the PHY's init routine on resume. This is to handle a USB PHY
>> that should have it's power_off function called on suspend but cannot
>> have it's exit function called because on exit it will disable the
>> PHY to the point where register accesses to the Host Controllers
>> using the PHY will be disabled and the host drivers will crash.
>>
>> This is enabled with the HCD flag "suspend_without_phy_exit" which
>> can be set from any HCD driver.
>>
>> Signed-off-by: Al Cooper<alcooperx@gmail.com>
>> ---
>>   drivers/usb/core/hcd.c  |  8 ++++----
>>   drivers/usb/core/phy.c  | 18 ++++++++++++------
>>   drivers/usb/core/phy.h  |  9 ++++++---
>>   include/linux/usb/hcd.h |  3 +++
>>   4 files changed, 25 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
>> index 1c21955fe7c0..e67e4d6b3d21 100644
>> --- a/drivers/usb/core/hcd.c
>> +++ b/drivers/usb/core/hcd.c
>> @@ -2263,7 +2263,7 @@ int hcd_bus_suspend(struct usb_device *rhdev,
pm_message_t msg)
>>           hcd->state = HC_STATE_SUSPENDED;
>>
>>           if (!PMSG_IS_AUTO(msg))
>> -            usb_phy_roothub_suspend(hcd->self.sysdev,
>> +            usb_phy_roothub_suspend(hcd,
>>                           hcd->phy_roothub);
>>
>>           /* Did we race with a root-hub wakeup event? */
>> @@ -2304,7 +2304,7 @@ int hcd_bus_resume(struct usb_device *rhdev,
pm_message_t msg)
>>       }
>>
>>       if (!PMSG_IS_AUTO(msg)) {
>> -        status = usb_phy_roothub_resume(hcd->self.sysdev,
>> +        status = usb_phy_roothub_resume(hcd,
>>                           hcd->phy_roothub);
>>           if (status)
>>               return status;
>> @@ -2347,7 +2347,7 @@ int hcd_bus_resume(struct usb_device *rhdev,
pm_message_t msg)
>>           }
>>       } else {
>>           hcd->state = old_state;
>> -        usb_phy_roothub_suspend(hcd->self.sysdev, hcd->phy_roothub);
>> +        usb_phy_roothub_suspend(hcd, hcd->phy_roothub);
>>           dev_dbg(&rhdev->dev, "bus %s fail, err %d\n",
>>                   "resume", status);
>>           if (status != -ESHUTDOWN)
>> @@ -2744,7 +2744,7 @@ int usb_add_hcd(struct usb_hcd *hcd,
>>       struct usb_device *rhdev;
>>
>>       if (!hcd->skip_phy_initialization && usb_hcd_is_primary_hcd(hcd)) {
>> -        hcd->phy_roothub = usb_phy_roothub_alloc(hcd->self.sysdev);
>> +        hcd->phy_roothub = usb_phy_roothub_alloc(hcd);
>>           if (IS_ERR(hcd->phy_roothub))
>>               return PTR_ERR(hcd->phy_roothub);
>>
>> diff --git a/drivers/usb/core/phy.c b/drivers/usb/core/phy.c
>> index 9879767452a2..b54db39eee4c 100644
>> --- a/drivers/usb/core/phy.c
>> +++ b/drivers/usb/core/phy.c
>> @@ -45,10 +45,11 @@ static int usb_phy_roothub_add_phy(struct device
*dev, int index,
>>       return 0;
>>   }
>>
>> -struct usb_phy_roothub *usb_phy_roothub_alloc(struct device *dev)
>> +struct usb_phy_roothub *usb_phy_roothub_alloc(struct usb_hcd *hcd)
>>   {
>>       struct usb_phy_roothub *phy_roothub;
>>       int i, num_phys, err;
>> +    struct device *dev = hcd->self.sysdev;
>>
>>       if (!IS_ENABLED(CONFIG_GENERIC_PHY))
>>           return NULL;
>> @@ -161,26 +162,30 @@ void usb_phy_roothub_power_off(struct
usb_phy_roothub *phy_roothub)
>>   }
>>   EXPORT_SYMBOL_GPL(usb_phy_roothub_power_off);
>>
>> -int usb_phy_roothub_suspend(struct device *controller_dev,
>> +int usb_phy_roothub_suspend(struct usb_hcd *hcd,
>>                   struct usb_phy_roothub *phy_roothub)
>>   {
>> +    struct device *controller_dev = hcd->self.sysdev;
>> +
>>       usb_phy_roothub_power_off(phy_roothub);
>>
>>       /* keep the PHYs initialized so the device can wake up the system
*/
>> -    if (device_may_wakeup(controller_dev))
>> +    if (device_may_wakeup(controller_dev) ||
hcd->suspend_without_phy_exit)
>>           return 0;
>>
>>       return usb_phy_roothub_exit(phy_roothub);
>>   }
>>   EXPORT_SYMBOL_GPL(usb_phy_roothub_suspend);
>>
>> -int usb_phy_roothub_resume(struct device *controller_dev,
>> +int usb_phy_roothub_resume(struct usb_hcd *hcd,
>>                  struct usb_phy_roothub *phy_roothub)
>>   {
>> +    struct device *controller_dev = hcd->self.sysdev;
>>       int err;
>>
>>       /* if the device can't wake up the system _exit was called */
>> -    if (!device_may_wakeup(controller_dev)) {
>> +    if (!device_may_wakeup(controller_dev) &&
>> +        !hcd->suspend_without_phy_exit) {
>>           err = usb_phy_roothub_init(phy_roothub);
>>           if (err)
>>               return err;
>> @@ -189,7 +194,8 @@ int usb_phy_roothub_resume(struct device
*controller_dev,
>>       err = usb_phy_roothub_power_on(phy_roothub);
>>
>>       /* undo _init if _power_on failed */
>> -    if (err && !device_may_wakeup(controller_dev))
>> +    if (err && !device_may_wakeup(controller_dev)
>> +        && !hcd->suspend_without_phy_exit)
>>           usb_phy_roothub_exit(phy_roothub);
>>
>>       return err;
>> diff --git a/drivers/usb/core/phy.h b/drivers/usb/core/phy.h
>> index 88a3c037e9df..34293e11a917 100644
>> --- a/drivers/usb/core/phy.h
>> +++ b/drivers/usb/core/phy.h
>> @@ -5,13 +5,16 @@
>>    * Copyright (C) 2018 Martin Blumenstingl<
martin.blumenstingl@googlemail.com>
>>    */
>>
>> +#include <linux/usb.h>
>> +#include <linux/usb/hcd.h>
>> +
>>   #ifndef __USB_CORE_PHY_H_
>>   #define __USB_CORE_PHY_H_
>>
>>   struct device;
>>   struct usb_phy_roothub;
>>
>> -struct usb_phy_roothub *usb_phy_roothub_alloc(struct device *dev);
>> +struct usb_phy_roothub *usb_phy_roothub_alloc(struct usb_hcd *hcd);
>>
>>   int usb_phy_roothub_init(struct usb_phy_roothub *phy_roothub);
>>   int usb_phy_roothub_exit(struct usb_phy_roothub *phy_roothub);
>> @@ -19,9 +22,9 @@
>>   int usb_phy_roothub_power_on(struct usb_phy_roothub *phy_roothub);
>>   void usb_phy_roothub_power_off(struct usb_phy_roothub *phy_roothub);
>>
>> -int usb_phy_roothub_suspend(struct device *controller_dev,
>> +int usb_phy_roothub_suspend(struct usb_hcd *hcd,
>>                   struct usb_phy_roothub *phy_roothub);
>> -int usb_phy_roothub_resume(struct device *controller_dev,
>> +int usb_phy_roothub_resume(struct usb_hcd *hcd,
>>                  struct usb_phy_roothub *phy_roothub);
>>
>>   #endif /* __USB_CORE_PHY_H_ */
>> diff --git a/include/linux/usb/hcd.h b/include/linux/usb/hcd.h
>> index 97e2ddec18b1..87a104055b5e 100644
>> --- a/include/linux/usb/hcd.h
>> +++ b/include/linux/usb/hcd.h
>> @@ -157,6 +157,9 @@ struct usb_hcd {
>>        */
>>       unsigned        skip_phy_initialization:1;
>>
>> +    /* Some phys don't want the phy's exit/init called on
suspend/resume */
>> +    unsigned        suspend_without_phy_exit:1;
> As suggested before, you can skip phy's exit/init during suspend/resume
> by enabling wakeup of hcd, so needn't add a new variable for it.

I still need to be able to enable and disable wakeup for this driver.

>
>> +
>>       /* The next flag is a stopgap, to be removed when all the HCDs
>>        * support the new root-hub polling mechanism. */
>>       unsigned        uses_new_polling:1;
>

--0000000000007df073057979bf56
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 10/17/18 9:46 PM, Chunfeng Yun wrote:&gt; hi,<br>&gt;<b=
r>&gt; On Wed, 2018-10-17 at 18:29 -0400, Al Cooper wrote:<br>&gt;&gt; Add =
the ability to skip calling the PHY&#39;s exit routine on suspend<br>&gt;&g=
t; and the PHY&#39;s init routine on resume. This is to handle a USB PHY<br=
>&gt;&gt; that should have it&#39;s power_off function called on suspend bu=
t cannot<br>&gt;&gt; have it&#39;s exit function called because on exit it =
will disable the<br>&gt;&gt; PHY to the point where register accesses to th=
e Host Controllers<br>&gt;&gt; using the PHY will be disabled and the host =
drivers will crash.<br>&gt;&gt;<br>&gt;&gt; This is enabled with the HCD fl=
ag &quot;suspend_without_phy_exit&quot; which<br>&gt;&gt; can be set from a=
ny HCD driver.<br>&gt;&gt;<br>&gt;&gt; Signed-off-by: Al Cooper&lt;<a href=
=3D"mailto:alcooperx@gmail.com">alcooperx@gmail.com</a>&gt;<br>&gt;&gt; ---=
<br>&gt;&gt; =C2=A0 drivers/usb/core/hcd.c =C2=A0| =C2=A08 ++++----<br>&gt;=
&gt; =C2=A0 drivers/usb/core/phy.c =C2=A0| 18 ++++++++++++------<br>&gt;&gt=
; =C2=A0 drivers/usb/core/phy.h =C2=A0| =C2=A09 ++++++---<br>&gt;&gt; =C2=
=A0 include/linux/usb/hcd.h | =C2=A03 +++<br>&gt;&gt; =C2=A0 4 files change=
d, 25 insertions(+), 13 deletions(-)<br>&gt;&gt;<br>&gt;&gt; diff --git a/d=
rivers/usb/core/hcd.c b/drivers/usb/core/hcd.c<br>&gt;&gt; index 1c21955fe7=
c0..e67e4d6b3d21 100644<br>&gt;&gt; --- a/drivers/usb/core/hcd.c<br>&gt;&gt=
; +++ b/drivers/usb/core/hcd.c<br>&gt;&gt; @@ -2263,7 +2263,7 @@ int hcd_bu=
s_suspend(struct usb_device *rhdev, pm_message_t msg)<br>&gt;&gt; =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 hcd-&gt;state =3D HC_STATE_SUSPENDED;<br>&gt;&g=
t; =C2=A0<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!PMSG_IS_AUTO(=
msg))<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usb_phy_roothu=
b_suspend(hcd-&gt;self.sysdev,<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0usb_phy_roothub_suspend(hcd,<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hcd-&=
gt;phy_roothub);<br>&gt;&gt; =C2=A0<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 /* Did we race with a root-hub wakeup event? */<br>&gt;&gt; @@ -230=
4,7 +2304,7 @@ int hcd_bus_resume(struct usb_device *rhdev, pm_message_t ms=
g)<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 }<br>&gt;&gt; =C2=A0<br>&gt;&gt; =C2=A0=
 =C2=A0 =C2=A0 if (!PMSG_IS_AUTO(msg)) {<br>&gt;&gt; - =C2=A0 =C2=A0 =C2=A0=
 =C2=A0status =3D usb_phy_roothub_resume(hcd-&gt;self.sysdev,<br>&gt;&gt; +=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D usb_phy_roothub_resume(hcd,<br>&gt;&=
gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 hcd-&gt;phy_roothub);<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 if (status)<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 return status;<br>&gt;&gt; @@ -2347,7 +2347,7 @@ int hcd_bus_=
resume(struct usb_device *rhdev, pm_message_t msg)<br>&gt;&gt; =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 }<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 } else {<br>&gt=
;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hcd-&gt;state =3D old_state;<br>&g=
t;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0usb_phy_roothub_suspend(hcd-&gt;self.sy=
sdev, hcd-&gt;phy_roothub);<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0usb_ph=
y_roothub_suspend(hcd, hcd-&gt;phy_roothub);<br>&gt;&gt; =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 dev_dbg(&amp;rhdev-&gt;dev, &quot;bus %s fail, err %d\n&q=
uot;,<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;resume&quot;, status);<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if (status !=3D -ESHUTDOWN)<br>&gt;&gt; @@ -2744,7 +2744,7 @@ int u=
sb_add_hcd(struct usb_hcd *hcd,<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 struct usb=
_device *rhdev;<br>&gt;&gt; =C2=A0<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 if (!hc=
d-&gt;skip_phy_initialization &amp;&amp; usb_hcd_is_primary_hcd(hcd)) {<br>=
&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0hcd-&gt;phy_roothub =3D usb_phy_rooth=
ub_alloc(hcd-&gt;self.sysdev);<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0hcd=
-&gt;phy_roothub =3D usb_phy_roothub_alloc(hcd);<br>&gt;&gt; =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 if (IS_ERR(hcd-&gt;phy_roothub))<br>&gt;&gt; =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return PTR_ERR(hcd-&gt;phy_roothu=
b);<br>&gt;&gt; =C2=A0<br>&gt;&gt; diff --git a/drivers/usb/core/phy.c b/dr=
ivers/usb/core/phy.c<br>&gt;&gt; index 9879767452a2..b54db39eee4c 100644<br=
>&gt;&gt; --- a/drivers/usb/core/phy.c<br>&gt;&gt; +++ b/drivers/usb/core/p=
hy.c<br>&gt;&gt; @@ -45,10 +45,11 @@ static int usb_phy_roothub_add_phy(str=
uct device *dev, int index,<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 return 0;<br>&=
gt;&gt; =C2=A0 }<br>&gt;&gt; =C2=A0<br>&gt;&gt; -struct usb_phy_roothub *us=
b_phy_roothub_alloc(struct device *dev)<br>&gt;&gt; +struct usb_phy_roothub=
 *usb_phy_roothub_alloc(struct usb_hcd *hcd)<br>&gt;&gt; =C2=A0 {<br>&gt;&g=
t; =C2=A0 =C2=A0 =C2=A0 struct usb_phy_roothub *phy_roothub;<br>&gt;&gt; =
=C2=A0 =C2=A0 =C2=A0 int i, num_phys, err;<br>&gt;&gt; + =C2=A0 =C2=A0struc=
t device *dev =3D hcd-&gt;self.sysdev;<br>&gt;&gt; =C2=A0<br>&gt;&gt; =C2=
=A0 =C2=A0 =C2=A0 if (!IS_ENABLED(CONFIG_GENERIC_PHY))<br>&gt;&gt; =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>&gt;&gt; @@ -161,26 +162,30 @@ =
void usb_phy_roothub_power_off(struct usb_phy_roothub *phy_roothub)<br>&gt;=
&gt; =C2=A0 }<br>&gt;&gt; =C2=A0 EXPORT_SYMBOL_GPL(usb_phy_roothub_power_of=
f);<br>&gt;&gt; =C2=A0<br>&gt;&gt; -int usb_phy_roothub_suspend(struct devi=
ce *controller_dev,<br>&gt;&gt; +int usb_phy_roothub_suspend(struct usb_hcd=
 *hcd,<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 struct usb_phy_roothub *phy_roothub)<br>&gt;&gt; =C2=A0 {<br>&gt;&gt=
; + =C2=A0 =C2=A0struct device *controller_dev =3D hcd-&gt;self.sysdev;<br>=
&gt;&gt; +<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 usb_phy_roothub_power_off(phy_r=
oothub);<br>&gt;&gt; =C2=A0<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 /* keep the PH=
Ys initialized so the device can wake up the system */<br>&gt;&gt; - =C2=A0=
 =C2=A0if (device_may_wakeup(controller_dev))<br>&gt;&gt; + =C2=A0 =C2=A0if=
 (device_may_wakeup(controller_dev) || hcd-&gt;suspend_without_phy_exit)<br=
>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>&gt;&gt; =C2=A0<b=
r>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 return usb_phy_roothub_exit(phy_roothub);<b=
r>&gt;&gt; =C2=A0 }<br>&gt;&gt; =C2=A0 EXPORT_SYMBOL_GPL(usb_phy_roothub_su=
spend);<br>&gt;&gt; =C2=A0<br>&gt;&gt; -int usb_phy_roothub_resume(struct d=
evice *controller_dev,<br>&gt;&gt; +int usb_phy_roothub_resume(struct usb_h=
cd *hcd,<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0struct usb_phy_roothub *phy_roothub)<br>&gt;&gt; =C2=A0 {<br>&gt;=
&gt; + =C2=A0 =C2=A0struct device *controller_dev =3D hcd-&gt;self.sysdev;<=
br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 int err;<br>&gt;&gt; =C2=A0<br>&gt;&gt; =
=C2=A0 =C2=A0 =C2=A0 /* if the device can&#39;t wake up the system _exit wa=
s called */<br>&gt;&gt; - =C2=A0 =C2=A0if (!device_may_wakeup(controller_de=
v)) {<br>&gt;&gt; + =C2=A0 =C2=A0if (!device_may_wakeup(controller_dev) &am=
p;&amp;<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0!hcd-&gt;suspend_without_p=
hy_exit) {<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D usb_phy_r=
oothub_init(phy_roothub);<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if=
 (err)<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return =
err;<br>&gt;&gt; @@ -189,7 +194,8 @@ int usb_phy_roothub_resume(struct devi=
ce *controller_dev,<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 err =3D usb_phy_roothu=
b_power_on(phy_roothub);<br>&gt;&gt; =C2=A0<br>&gt;&gt; =C2=A0 =C2=A0 =C2=
=A0 /* undo _init if _power_on failed */<br>&gt;&gt; - =C2=A0 =C2=A0if (err=
 &amp;&amp; !device_may_wakeup(controller_dev))<br>&gt;&gt; + =C2=A0 =C2=A0=
if (err &amp;&amp; !device_may_wakeup(controller_dev)<br>&gt;&gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&amp;&amp; !hcd-&gt;suspend_without_phy_exit)<br>&gt;&g=
t; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 usb_phy_roothub_exit(phy_roothub);<br=
>&gt;&gt; =C2=A0<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 return err;<br>&gt;&gt; d=
iff --git a/drivers/usb/core/phy.h b/drivers/usb/core/phy.h<br>&gt;&gt; ind=
ex 88a3c037e9df..34293e11a917 100644<br>&gt;&gt; --- a/drivers/usb/core/phy=
.h<br>&gt;&gt; +++ b/drivers/usb/core/phy.h<br>&gt;&gt; @@ -5,13 +5,16 @@<b=
r>&gt;&gt; =C2=A0 =C2=A0* Copyright (C) 2018 Martin Blumenstingl&lt;<a href=
=3D"mailto:martin.blumenstingl@googlemail.com">martin.blumenstingl@googlema=
il.com</a>&gt;<br>&gt;&gt; =C2=A0 =C2=A0*/<br>&gt;&gt; =C2=A0<br>&gt;&gt; +=
#include &lt;linux/usb.h&gt;<br>&gt;&gt; +#include &lt;linux/usb/hcd.h&gt;<=
br>&gt;&gt; +<br>&gt;&gt; =C2=A0 #ifndef __USB_CORE_PHY_H_<br>&gt;&gt; =C2=
=A0 #define __USB_CORE_PHY_H_<br>&gt;&gt; =C2=A0<br>&gt;&gt; =C2=A0 struct =
device;<br>&gt;&gt; =C2=A0 struct usb_phy_roothub;<br>&gt;&gt; =C2=A0<br>&g=
t;&gt; -struct usb_phy_roothub *usb_phy_roothub_alloc(struct device *dev);<=
br>&gt;&gt; +struct usb_phy_roothub *usb_phy_roothub_alloc(struct usb_hcd *=
hcd);<br>&gt;&gt; =C2=A0<br>&gt;&gt; =C2=A0 int usb_phy_roothub_init(struct=
 usb_phy_roothub *phy_roothub);<br>&gt;&gt; =C2=A0 int usb_phy_roothub_exit=
(struct usb_phy_roothub *phy_roothub);<br>&gt;&gt; @@ -19,9 +22,9 @@<br>&gt=
;&gt; =C2=A0 int usb_phy_roothub_power_on(struct usb_phy_roothub *phy_rooth=
ub);<br>&gt;&gt; =C2=A0 void usb_phy_roothub_power_off(struct usb_phy_rooth=
ub *phy_roothub);<br>&gt;&gt; =C2=A0<br>&gt;&gt; -int usb_phy_roothub_suspe=
nd(struct device *controller_dev,<br>&gt;&gt; +int usb_phy_roothub_suspend(=
struct usb_hcd *hcd,<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 struct usb_phy_roothub *phy_roothub);<br>&gt;&gt; -int=
 usb_phy_roothub_resume(struct device *controller_dev,<br>&gt;&gt; +int usb=
_phy_roothub_resume(struct usb_hcd *hcd,<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct usb_phy_roothub *phy_roothu=
b);<br>&gt;&gt; =C2=A0<br>&gt;&gt; =C2=A0 #endif /* __USB_CORE_PHY_H_ */<br=
>&gt;&gt; diff --git a/include/linux/usb/hcd.h b/include/linux/usb/hcd.h<br=
>&gt;&gt; index 97e2ddec18b1..87a104055b5e 100644<br>&gt;&gt; --- a/include=
/linux/usb/hcd.h<br>&gt;&gt; +++ b/include/linux/usb/hcd.h<br>&gt;&gt; @@ -=
157,6 +157,9 @@ struct usb_hcd {<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<=
br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 unsigned =C2=A0 =C2=A0 =C2=A0 =C2=A0skip_p=
hy_initialization:1;<br>&gt;&gt; =C2=A0<br>&gt;&gt; + =C2=A0 =C2=A0/* Some =
phys don&#39;t want the phy&#39;s exit/init called on suspend/resume */<br>=
&gt;&gt; + =C2=A0 =C2=A0unsigned =C2=A0 =C2=A0 =C2=A0 =C2=A0suspend_without=
_phy_exit:1;<br>&gt; As suggested before, you can skip phy&#39;s exit/init =
during suspend/resume<br>&gt; by enabling wakeup of hcd, so needn&#39;t add=
 a new variable for it.<br><br>I still need to be able to enable and disabl=
e wakeup for this driver.<br><br>&gt;<br>&gt;&gt; +<br>&gt;&gt; =C2=A0 =C2=
=A0 =C2=A0 /* The next flag is a stopgap, to be removed when all the HCDs<b=
r>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0* support the new root-hub polling me=
chanism. */<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 unsigned =C2=A0 =C2=A0 =C2=A0 =
=C2=A0uses_new_polling:1;<br>&gt;</div>

--0000000000007df073057979bf56--
