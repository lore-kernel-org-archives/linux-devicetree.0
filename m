From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Subject: Re: [RFC][PATCH 0/3] SRAM reboot mode driver
Date: Wed, 27 Jan 2016 10:50:01 +0200
Message-ID: <56A884B9.5020201@mentor.com>
References: <1453855080-17760-1-git-send-email-john.stultz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453855080-17760-1-git-send-email-john.stultz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: John Stultz <john.stultz@linaro.org>, lkml <linux-kernel@vger.kernel.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Rob Herring <robh@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Thierry Reding <treding@nvidia.com>, =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>, Caesar Wang <wxt@rock-chips.com>, Kees Cook <keescook@chromium.org>, Guodong Xu <guodong.xu@linaro.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, Vishal Bhoj <vishal.bhoj@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, Android Kernel Team <kernel-team@android.com>
List-Id: devicetree@vger.kernel.org

Hi John,

On 27.01.2016 02:37, John Stultz wrote:
> This patchset extends on Andy Yan's reboot mode driver
> work from here: https://lkml.org/lkml/2016/1/12/315
>=20
> It adds reboot mode/reason support for devices that use
> an SRAM location to communicate with the bootloader.
>=20
> Doing this via an SRAM subnode was a suggestion from
> Arnd, but I worry this implementation isn't yet ideal,
> since I spent quite a bit of time futzing with getting
> the sram dts entry to work properly. So I suspect there
> will be a number of suggestions for improvements.

sorry, I missed that discussion, what are the problems you've
encountered?
Probably SRAM driver is ready to serve your purposes?

I believe I'm screwing up some HiSilicon specifics, but here
is a rough draft, which you may find helpful:

1. Add SRAM node with defined reboot-reason area:

---8<---
diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
index 8185251..c35f5ed 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
@@ -31,6 +31,20 @@
 		device_type =3D "memory";
 		reg =3D <0x0 0x0 0x0 0x40000000>;
 	};
+
+	sram@5f01000 {
+		compatible =3D "mmio-sram";
+		reg =3D <0x0 0x05f01000 0x0 0x00001000>;
+		ranges =3D <0x0 0x0 0x05f01000 0x00001000>;
+
+		#address-cells =3D <1>;
+		#size-cells =3D <1>;
+
+		reboot-reason: reboot-reason {
+			reg =3D <0x0 0x4>;
+			pool;
+		};
+	};
 };

 &uart2 {
---8<---

2. Reference reboot-reason node from reboot mode driver's node,
probably you need to add an optional property (here "reason-storage") t=
o its
binding:

---8<---
		reboot-mode {
			compatible =3D "syscon-reboot-mode";
[snip]
			reason-storage =3D <&reboot-reason>;
		}
---8<---

3. In reboot-mode driver read or write to that SRAM partition:

---8<---
	storage =3D of_gen_pool_get(reboot_mode_np, "reason-storage", 0);
	if (!storage)
		goto no_storage;

	size =3D gen_pool_size(storage);
        base =3D gen_pool_alloc(storage, pool_size);
	if (!base)
		return -EINVAL;

	writel(0x77665501, base);
	gen_pool_free(storage, base, size);

no_storage:
	return 0;
---8<---

There is one noticeable benefit of this approach - you don't need
to write another driver and you don't need to add another DT binding.

With best wishes,
Vladimir

> Again, this series dependson Andy's patch set above,
> but also was developed & tested against the 4.1 based
> hikey tree, so at least the hikey dts patch won't apply.
> I'm mostly sending this out for just a rough initial
> review of the dts and conceptual usage of sram subnodes.
>=20
> Also, it was pointed out that the hikey dts entry for
> this really should be added by the UEFI firmware, since
> alternative bootloaders may be used which do not support
> this feature. So the hikey dts patch isn't likely to ever
> go upstream, but its a useful illustration for how other
> devices might use this driver.
>=20
> Cc: Andy Yan <andy.yan@rock-chips.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Thierry Reding <treding@nvidia.com>
> Cc: Heiko St=C3=BCbner <heiko@sntech.de>
> Cc: Caesar Wang <wxt@rock-chips.com>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Guodong Xu <guodong.xu@linaro.org>
> Cc: Haojian Zhuang <haojian.zhuang@linaro.org>
> Cc: Vishal Bhoj <vishal.bhoj@linaro.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: devicetree@vger.kernel.org
> Cc: Android Kernel Team <kernel-team@android.com>
>=20
> John Stultz (3):
>   dt-bindings: power: reset: Add document for sram-reboot-mode driver
>   power: reset: Add sram-reboot-mode driver
>   dts: hikey: Add hikey support for sram-reboot-mode
>=20
>  .../bindings/power/reset/sram-reboot-mode.txt      | 47 ++++++++++++=
+++
>  arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts     | 36 ++++++++++++
>  arch/arm64/configs/hikey_defconfig                 |  3 +
>  drivers/power/reset/Kconfig                        |  9 +++
>  drivers/power/reset/Makefile                       |  1 +
>  drivers/power/reset/sram-reboot-mode.c             | 66 ++++++++++++=
++++++++++
>  6 files changed, 162 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/reset/sra=
m-reboot-mode.txt
>  create mode 100644 drivers/power/reset/sram-reboot-mode.c
>=20
