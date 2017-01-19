From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v5] ARM64: dts: meson-gx: Add firmware reserved memory zones
Date: Wed, 18 Jan 2017 20:36:15 -0800
Message-ID: <m24m0vy8cg.fsf@baylibre.com>
References: <1484758245-9354-1-git-send-email-narmstrong@baylibre.com>
        <2bdb6818-4620-53b1-112d-2d6a29e484d9@suse.de>
        <eca803d3-1a67-cda5-554d-4313ae56635e@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <eca803d3-1a67-cda5-554d-4313ae56635e-l3A5Bk7waGM@public.gmane.org> ("Andreas
        =?utf-8?Q?F=C3=A4rber=22's?= message of "Thu, 19 Jan 2017 02:18:27 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, xypron.glpk-Mmb7MZpHnFY@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org> writes:

> Am 19.01.2017 um 01:20 schrieb Andreas F=C3=A4rber:
>> Hi,
>>=20
>> Am 18.01.2017 um 17:50 schrieb Neil Armstrong:
>>> The Amlogic Meson GXBB/GXL/GXM secure monitor uses part of the memory s=
pace,
>>> this patch adds these reserved zones.
>>>
>>> Without such reserved memory zones, running the following stress comman=
d :
>>> $ stress-ng --vm 16 --vm-bytes 128M --timeout 10s
>>> multiple times:
>>>
>>> Could lead to the following kernel crashes :
>>> [   46.937975] Bad mode in Error handler detected on CPU1, code 0xbf000=
000 -- SError
>>> ...
>>> [   47.058536] Internal error: Attempting to execute userspace memory: =
8600000f [#3] PREEMPT SMP
>>> ...
>>> Instead of the OOM killer.
>>>
>>=20
>> I miss a Fixes: or Cc: here for the backport you desired. To have it
>> fixed back to my very introduction:
>>=20
>> Fixes: 4f24eda8401f ("ARM64: dts: Prepare configs for Amlogic Meson GXBa=
by")
>>=20
>> People backporting it would need to handle the meson-{gx =3D> gxbb}.dtsi
>> transition for 4.9 down to 4.6, which seems fairly straightforward.
>>=20
>>> Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>>> ---
>>>  arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 18 ++++++++++++++++++
>>>  1 file changed, 18 insertions(+)
>>>
>>> Changes since v4 at [5]:
>>> - Move start of ddr memory to reserved-memory node
>>> - Drop memory node move
>>> - Fix typo in sizes
>>>
>>> Changes since resent v2 at [4]:
>>> - Fix invalid comment of useable memory attributes
>>>
>>> Changes since original v2 at [3]:
>>> - Typo in commit 2GiB -> 1GiB, 4GiB -> 2GiB
>>>
>>> Changes since v2 at [2]:
>>> - Moved all memory node out of dtsi
>>> - Added comment about useable memory
>>> - Fixed comment about secmon reserved zone
>>>
>>> Changes since v1 at [1] :
>>> - Renamed reg into linux,usable-memory to ovveride u-boot memory
>>> - only kept secmon memory zone
>>>
>>> [1] http://lkml.kernel.org/r/20161212101801.28491-1-narmstrong@baylibre=
.com
>>> [2] http://lkml.kernel.org/r/1483105232-6242-1-git-send-email-narmstron=
g@baylibre.com
>>> [3] http://lkml.kernel.org/r/1484128128-22454-1-git-send-email-narmstro=
ng-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
>>> [4] http://lkml.kernel.org/r/1484128540-22662-1-git-send-email-narmstro=
ng-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
>>> [5] http://lkml.kernel.org/r/1484129414-23325-1-git-send-email-narmstro=
ng-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
>>>
>>> diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boo=
t/dts/amlogic/meson-gx.dtsi
>>> index eada0b5..63d52b7 100644
>>> --- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
>>> +++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
>>> @@ -55,6 +55,24 @@
>>>  	#address-cells =3D <2>;
>>>  	#size-cells =3D <2>;
>>>=20=20
>>> +	reserved-memory {
>>> +		#address-cells =3D <2>;
>>> +		#size-cells =3D <2>;
>>> +		ranges;
>>> +
>>> +		/* 16 MiB reserved for Hardware ROM Firmware */
>>> +		hwrom: hwrom {
>>=20
>> Both sub-nodes get a label that is unused, but reserved-memory itself
>> does not (my v4 remark). Intentional?
>>=20
>>> +			reg =3D <0x0 0x0 0x0 0x1000000>;
>>> +			no-map;
>>> +		};
>>> +
>>> +		/* 2 MiB reserved for ARM Trusted Firmware (BL31) */
>>> +		secmon: secmon {
>>=20
>> I note that this .dtsi further down has a node /firmware/secure-monitor
>> with label sm.
>> a) Is there any naming convention such as secmon_mem to adopt here to
>> avoid mixups with sm?
>> b) Should this secmon node be referenced in the secure-monitor node via
>> memory-node =3D <&secmon>; to model their connection, thereby giving the
>> label a use? Or should we maybe merge the two nodes by moving the
>> compatible string here?
>>=20
>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree/Do=
cumentation/devicetree/bindings/reserved-memory/reserved-memory.txt
>
> Answering my own question: the example labels use _reserved suffix.
>
>>> +			reg =3D <0x0 0x10000000 0x0 0x200000>;
>
> And since we use a reg property here, the node name should get a unit
> address to avoid future dtc warnings/errors. Ditto for hwrom.

OK, I added Fixes:, your Reviewed-by, added the _reserved suffix and
unit address and applied to v4.10/fixes.

Update patch below for reference.

Other cleanups/fixups (like adding a phandle from secure monitor) can be
done as add-ons, as they are not strictly related to this fix.

Kevin

>From ecb88f3001ed9ee8c53450d971de8c18bcbf7925 Mon Sep 17 00:00:00 2001
From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Date: Wed, 18 Jan 2017 17:50:45 +0100
Subject: [PATCH] ARM64: dts: meson-gx: Add firmware reserved memory zones
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

The Amlogic Meson GXBB/GXL/GXM secure monitor uses part of the memory space,
this patch adds these reserved zones.

Without such reserved memory zones, running the following stress command :
$ stress-ng --vm 16 --vm-bytes 128M --timeout 10s
multiple times:

Could lead to the following kernel crashes :
[   46.937975] Bad mode in Error handler detected on CPU1, code 0xbf000000 =
-- SError
...
[   47.058536] Internal error: Attempting to execute userspace memory: 8600=
000f [#3] PREEMPT SMP
...
Instead of the OOM killer.

Fixes: 4f24eda8401f ("ARM64: dts: Prepare configs for Amlogic Meson GXBaby")
Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Reviewed-by: Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org>
[khilman: added Fixes tag, added _reserved and unit addresses]
Signed-off-by: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dt=
s/amlogic/meson-gx.dtsi
index eada0b58ba1c..0cbe24b49710 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -55,6 +55,24 @@
 	#address-cells =3D <2>;
 	#size-cells =3D <2>;
=20
+	reserved-memory {
+		#address-cells =3D <2>;
+		#size-cells =3D <2>;
+		ranges;
+
+		/* 16 MiB reserved for Hardware ROM Firmware */
+		hwrom_reserved: hwrom@0 {
+			reg =3D <0x0 0x0 0x0 0x1000000>;
+			no-map;
+		};
+
+		/* 2 MiB reserved for ARM Trusted Firmware (BL31) */
+		secmon_reserved: secmon@10000000 {
+			reg =3D <0x0 0x10000000 0x0 0x200000>;
+			no-map;
+		};
+	};
+
 	cpus {
 		#address-cells =3D <0x2>;
 		#size-cells =3D <0x0>;
--=20
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
