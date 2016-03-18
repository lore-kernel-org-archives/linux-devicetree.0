From: Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v5 1/4] dt-bindings: power: reset: add document for
 reboot-mode driver
Date: Fri, 18 Mar 2016 16:43:29 +0800
Message-ID: <56EBBFB1.6000808@rock-chips.com>
References: <1457439716-8084-1-git-send-email-andy.yan@rock-chips.com>
 <1457439785-8133-1-git-send-email-andy.yan@rock-chips.com>
 <20160317155212.GA19171@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160317155212.GA19171@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: john.stultz@linaro.org, arnd@arndb.de, heiko@sntech.de, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com, olof@lixom.net, alexandre.belloni@free-electrons.com, dbaryshkov@gmail.com, sre@kernel.org, jun.nie@linaro.org, edubezval@gmail.com, f.fainelli@gmail.com, will.deacon@arm.com, linux-rockchip@lists.infradead.org, wxt@rock-chips.com, matthias.bgg@gmail.com, linux@arm.linux.org.uk, lorenzo.pieralisi@arm.com, moritz.fischer@ettus.com, richard@nod.at, dwmw2@infradead.org, jwerner@google.com
List-Id: devicetree@vger.kernel.org

Hi Rob:


On 2016=E5=B9=B403=E6=9C=8817=E6=97=A5 23:52, Rob Herring wrote:
> On Tue, Mar 08, 2016 at 08:23:05PM +0800, Andy Yan wrote:
>> add device tree bindings document for reboot-mode driver
>>
>> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
>>
>> ---
>>
>> Changes in v5:
>> - delete a unnecessary blank line in syscon-reboot-mode.txt
>> - rename macro BOOT_LOADER to BOOT_BL_DOWNLOAD, which gives a more c=
lear mean
>>
>> Changes in v4:
>> - remove mode-maskrom
>> - rename mode-fastboot to mode-bootloader to keep compatible with th=
e exiting Android device
>>
>> Changes in v3:
>> - descirbe all reboot mode as properity instead of subnode
>>
>> Changes in v2: None
>> Changes in v1: None
>>
>>   .../bindings/power/reset/reboot-mode.txt           | 24 ++++++++++=
+++++
>>   .../bindings/power/reset/syscon-reboot-mode.txt    | 34 ++++++++++=
++++++++++++
>>   2 files changed, 58 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/power/reset/r=
eboot-mode.txt
>>   create mode 100644 Documentation/devicetree/bindings/power/reset/s=
yscon-reboot-mode.txt
>>
>> diff --git a/Documentation/devicetree/bindings/power/reset/reboot-mo=
de.txt b/Documentation/devicetree/bindings/power/reset/reboot-mode.txt
>> new file mode 100644
>> index 0000000..3457949
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/power/reset/reboot-mode.txt
>> @@ -0,0 +1,24 @@
>> +Generic reboot mode core map driver
>> +
>> +This driver get reboot mode arguments and call the write
>> +interface to stores the magic value in special register
>> +or ram . Then the bootloader can read it and take different
>> +action according the argument stored.
>> +
>> +All mode properties are vendor specific, it is a indication to tell
>> +the bootloder what to do when the system reboot, and should be name=
d
>> +as mode-xxx =3D <magic> (xxx is mode name).
>> +
>> +- mode-normal: Normal reboot mode, system reboot with command "rebo=
ot".
>> +- mode-recovery: Android Recovery mode, it is a mode to format the =
device or update a new image.
>> +- mode-bootloader: Android fastboot mode, it's a mode to re-flash p=
artitions on the Android based device.
>> +- mode-loader: A bootloader mode, it's a mode used to download imag=
e on Rockchip platform,
>> +	       usually used in development.
>> +
>> +Example:
>> +	reboot-mode {
>> +		mode-normal =3D <BOOT_NORMAL>;
>> +		mode-recovery =3D <BOOT_RECOVERY>;
>> +		mode-bootloader =3D <BOOT_FASTBOOT>;
>> +		mode-loader =3D <BOOT_BL_DOWNLOAD>;
>> +	}
>> diff --git a/Documentation/devicetree/bindings/power/reset/syscon-re=
boot-mode.txt b/Documentation/devicetree/bindings/power/reset/syscon-re=
boot-mode.txt
>> new file mode 100644
>> index 0000000..d03cb52
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/power/reset/syscon-reboot-mo=
de.txt
>> @@ -0,0 +1,34 @@
>> +SYSCON reboot mode driver
>> +
>> +This driver get reboot mode magic value form reboot-mode driver
>> +and stores it in a SYSCON mapped register. Then the bootloader
>> +can read it and take different action according to the magic
>> +value stored.
>> +
>> +This DT node should be represented as a sub-node of a "syscon", "si=
mple-mfd"
>> +node.
>> +
>> +Required properties:
>> +- compatible: should be "syscon-reboot-mode"
>> +- offset: offset in the register map for the storage register (in b=
ytes)
>> +
>> +Optional properity:
>> +- mask: the mask bits of the mode magic value, default set to 0xfff=
fffff if missing.
> I can't see how this is used. I would drop it for now.
>
> With that change:
>
> Acked-by: Rob Herring <robh@kernel.org>

The mask is suggested by Moritz Fischer in V2[0]. And I found Tegra did=
=20
indeed only use some bits of one register to store the reboot mode[1].

@Heiko: It seems that this patch series can land now, but the dts parts=
=20
belong to  two different branch(arm32 and arm64) . And these
two parts both depends on one head file rockchip_boot-mode.h, So I hope=
=20
some suggestions from you how to deal with it.

    [0] https://lkml.org/lkml/2016/1/27/225
    [1] drivers/soc/tegra/pmc.c  (tegra_pmc_restart_notify)
>> +
>> +The rest of the properties should follow the generic reboot-mode di=
scription
>> +found in reboot-mode.txt
>> +
>> +Example:
>> +	pmu: pmu@20004000 {
>> +		compatible =3D "rockchip,rk3066-pmu", "syscon", "simple-mfd";
>> +		reg =3D <0x20004000 0x100>;
>> +
>> +		reboot-mode {
>> +			compatible =3D "syscon-reboot-mode";
>> +			offset =3D <0x40>;
>> +			mode-normal =3D <BOOT_NORMAL>;
>> +			mode-recovery =3D <BOOT_RECOVERY>;
>> +			mode-bootloader =3D <BOOT_FASTBOOT>;
>> +			mode-loader =3D <BOOT_BL_DOWNLOAD>;
>> +		};
>> +	};
>> --=20
>> 1.9.1
>>
>>
>>
>
>
