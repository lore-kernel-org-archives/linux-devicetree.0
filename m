From: Alexander Bersenev <bay-d8LqKIyZzER6k2ZkT/Rh8A@public.gmane.org>
Subject: Re: [PATCH v5 0/3] ARM: sunxi: Add support for consumer
 infrared devices
Date: Fri, 9 May 2014 15:21:29 +0200
Message-ID: <E54FF549-B53A-406B-9871-E2C3B1ED8157@hackerdom.ru>
References: <1398871010-30681-1-git-send-email-bay@hackerdom.ru> <536B8CDD.7040600@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0 (1.0)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCLIFP6QZ4HRBXNMWONQKGQEZJVSSJA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <536B8CDD.7040600-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "david-0WFrdVpeebksCylrc8G9yg@public.gmane.org" <david-0WFrdVpeebksCylrc8G9yg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org" <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org" <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "sean-hENCXIMQXOg@public.gmane.org" <sean-hENCXIMQXOg@public.gmane.org>, "srinivas.kandagatla-qxv4g6HH51o@public.gmane.org" <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello, I am in Austria/Germany in 1-11 may. I plan to make v6 after returni=
ng back to Russia.

Best,
Alexander Bersenev

> 08 =D0=BC=D0=B0=D1=8F 2014 =D0=B3., =D0=B2 15:55, Hans de Goede <hdegoede=
@redhat.com> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB(=D0=B0):
>=20
> Hi,
>=20
>> On 04/30/2014 05:16 PM, Alexander Bersenev wrote:
>> This patch introduces Consumer IR(CIR) support for sunxi boards.
>>=20
>> This is based on Alexsey Shestacov's work based on the original driver=
=20
>> supplied by Allwinner.
>>=20
>> Signed-off-by: Alexander Bersenev <bay-d8LqKIyZzER6k2ZkT/Rh8A@public.gmane.org>
>> Signed-off-by: Alexsey Shestacov <wingrime-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org>
>=20
> Alexander, v5 still has various issues which need fixing,
> do you plan to do a v6 soon ?
>=20
> Regards,
>=20
> Hans
>=20
>>=20
>> ---
>> Changes since version 1:=20
>> - Fix timer memory leaks=20
>> - Fix race condition when driver unloads while interrupt handler is acti=
ve
>> - Support Cubieboard 2(need testing)
>>=20
>> Changes since version 2:
>> - More reliable keydown events
>> - Documentation fixes
>> - Rename registers accurding to A20 user manual
>> - Remove some includes, order includes alphabetically
>> - Use BIT macro
>> - Typo fixes
>>=20
>> Changes since version 3:
>> - Split the patch on smaller parts
>> - More documentation fixes
>> - Add clock-names in DT
>> - Use devm_clk_get function to get the clocks
>> - Removed gpios property from ir's DT
>> - Changed compatible from allwinner,sunxi-ir to allwinner,sun7i-a20-ir i=
n DT
>> - Use spin_lock_irq instead spin_lock_irqsave in interrupt handler
>> - Add myself in the copyright ;)
>> - Coding style and indentation fixes
>>=20
>> Changes since version 4:
>> - Try to fix indentation errors by sending patches with git send-mail
>>=20
>> Alexander Bersenev (3):
>>  ARM: sunxi: Add documentation for sunxi consumer infrared devices
>>  ARM: sunxi: Add driver for sunxi IR controller
>>  ARM: sunxi: Add IR controller support in DT on A20
>>=20
>> .../devicetree/bindings/media/sunxi-ir.txt         |  23 ++
>> arch/arm/boot/dts/sun7i-a20-cubieboard2.dts        |   6 +
>> arch/arm/boot/dts/sun7i-a20-cubietruck.dts         |   6 +
>> arch/arm/boot/dts/sun7i-a20.dtsi                   |  31 +++
>> drivers/media/rc/Kconfig                           |  10 +
>> drivers/media/rc/Makefile                          |   1 +
>> drivers/media/rc/sunxi-ir.c                        | 303 +++++++++++++++=
++++++
>> 7 files changed, 380 insertions(+)
>> create mode 100644 Documentation/devicetree/bindings/media/sunxi-ir.txt
>> create mode 100644 drivers/media/rc/sunxi-ir.c
>>=20

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
