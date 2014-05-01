From: "Priit Laes" <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Subject: Re: [PATCH v5 0/3] ARM: sunxi: Add support for consumer
 infrared devices
Date: Thu, 01 May 2014 09:00:19 +0300
Message-ID: <1398924019.8330.11.camel@chi.lan>
References: <1398871010-30681-1-git-send-email-bay@hackerdom.ru>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDJLTBEBXENBBNODQ6NQKGQE7YKVG6A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1398871010-30681-1-git-send-email-bay-d8LqKIyZzER6k2ZkT/Rh8A@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: david-0WFrdVpeebksCylrc8G9yg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sean-hENCXIMQXOg@public.gmane.org, srinivas.kandagatla-qxv4g6HH51o@public.gmane.org, wingrime-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexander Bersenev <bay-d8LqKIyZzER6k2ZkT/Rh8A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

=C3=9Chel kenal p=C3=A4eval, K, 30.04.2014 kell 21:16, kirjutas Alexander
Bersenev:
> This patch introduces Consumer IR(CIR) support for sunxi boards.
>=20
> This is based on Alexsey Shestacov's work based on the original driver=20
> supplied by Allwinner.
>=20
> Signed-off-by: Alexander Bersenev <bay-d8LqKIyZzER6k2ZkT/Rh8A@public.gmane.org>
> Signed-off-by: Alexsey Shestacov <wingrime-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org>

> ---
> Changes since version 1:=20
>  - Fix timer memory leaks=20
>  - Fix race condition when driver unloads while interrupt handler is acti=
ve
>  - Support Cubieboard 2(need testing)
>=20
> Changes since version 2:
> - More reliable keydown events
> - Documentation fixes
> - Rename registers accurding to A20 user manual
> - Remove some includes, order includes alphabetically
> - Use BIT macro
> - Typo fixes
>=20
> Changes since version 3:
> - Split the patch on smaller parts
> - More documentation fixes
> - Add clock-names in DT
> - Use devm_clk_get function to get the clocks
> - Removed gpios property from ir's DT
> - Changed compatible from allwinner,sunxi-ir to allwinner,sun7i-a20-ir in=
 DT
> - Use spin_lock_irq instead spin_lock_irqsave in interrupt handler
> - Add myself in the copyright ;)
> - Coding style and indentation fixes
>=20
> Changes since version 4:
> - Try to fix indentation errors by sending patches with git send-mail

git am still complains due to mixed tabs-spaces used for indentation
> Alexander Bersenev (3):
>   ARM: sunxi: Add documentation for sunxi consumer infrared devices
Applying: ARM: sunxi: Add documentation for sunxi consumer infrared devices
/usr/src/linux/.git/rebase-apply/patch:28: space before tab in indent.
       	compatible =3D "allwinner,sun7i-a20-ir";
/usr/src/linux/.git/rebase-apply/patch:29: space before tab in indent.
       	clocks =3D <&apb0_gates 6>, <&ir0_clk>;
/usr/src/linux/.git/rebase-apply/patch:30: space before tab in indent.
       	clock-names =3D "apb0_ir0", "ir0";
/usr/src/linux/.git/rebase-apply/patch:31: space before tab in indent.
       	interrupts =3D <0 5 1>;
/usr/src/linux/.git/rebase-apply/patch:32: space before tab in indent.
       	reg =3D <0x01C21800 0x40>;
>   ARM: sunxi: Add driver for sunxi IR controller
OK
>   ARM: sunxi: Add IR controller support in DT on A20
Applying: ARM: sunxi: Add IR controller support in DT on A20
/usr/src/linux/.git/rebase-apply/patch:70: space before tab in indent.
       		ir0: ir@01c21800 {
/usr/src/linux/.git/rebase-apply/patch:71: space before tab in indent.
	     		compatible =3D "allwinner,sun7i-a20-ir";
/usr/src/linux/.git/rebase-apply/patch:79: space before tab in indent.
       		ir1: ir@01c21c00 {
/usr/src/linux/.git/rebase-apply/patch:80: space before tab in indent.
	     		compatible =3D "allwinner,sun7i-a20-ir";

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
