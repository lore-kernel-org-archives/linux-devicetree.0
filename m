From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH V9 2/2] ARM: dts: Enable ahci sata and sata phy
Date: Tue, 18 Mar 2014 07:50:26 +0900
Message-ID: <53277C32.4050003@samsung.com>
References: <1393824160-27040-1-git-send-email-yuvaraj.cd@samsung.com> <1393824160-27040-3-git-send-email-yuvaraj.cd@samsung.com> <53146E84.7060508@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <53146E84.7060508@ti.com>
Sender: linux-doc-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Yuvaraj Kumar C D <yuvaraj.cd@gmail.com>, kgene.kim@samsung.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, mark.rutland@arm.com, Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>, sander@humilis.net, swarren@wwwdotorg.org, b.zolnierkie@samsung.com, ks.giri@samsung.com, t.figa@samsung.com, jg1.han@samsung.com, joshi@samsung.com, grant.likely@linaro.org, christoffer.dall@linaro.com
List-Id: devicetree@vger.kernel.org

On 03/03/14 20:59, Kishon Vijay Abraham I wrote:
>
>
> On Monday 03 March 2014 10:52 AM, Yuvaraj Kumar C D wrote:
>> This patch adds dt entry for ahci sata controller and its
>> corresponding phy controller.phy node has been added w.r.t
>> new generic phy framework.
>>
>> Signed-off-by: Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>
>
> This should go via exynos dt tree.
>
Applied, thanks.

- Kukjin

> FWIW
> Acked-by: Kishon Vijay Abraham I <kishon@ti.com>
>> ---
>> Changes since V8:
>> 1.sata@122f0000 and sata_phy@12170000 disabled by default in
>> SOC specific dts file and enabled the same in board dts file.
>>
>> Changes since V7:
>> 1.syscon-phandle name updated.
>>
>> Changes since V6:none
>>
>> Changes since V5:none
>>
>> Changes since V4:
>> 1.Used the new phandle "sata_phy_i2c" in the DT entry.
>> 2.Updated binding document.
>>
>> Changes since V3:
>> 1.Moved the binding info to the /bindings/phy/
>>
>> Changes since V2:
>> 1.Used syscon interface to PMU handling.
>> 2.Changed "sata-phy-i2c" to "exynos-sataphy-i2c".
>>
>> Changes since V1:
>> 1.Minor changes to node name convention.
>> 2.Updated binding document.
>>
>>
>> .../devicetree/bindings/ata/exynos-sata-phy.txt | 14 --------
>> .../devicetree/bindings/ata/exynos-sata.txt | 25 +++++++++-----
>> .../devicetree/bindings/phy/samsung-phy.txt | 36 ++++++++++++++++++++
>> arch/arm/boot/dts/exynos5250-arndale.dts | 21 ++++++++++++
>> arch/arm/boot/dts/exynos5250-smdk5250.dts | 17 +++++----
>> arch/arm/boot/dts/exynos5250.dtsi | 18 +++++++---
>> 6 files changed, 98 insertions(+), 33 deletions(-)
>> delete mode 100644
>> Documentation/devicetree/bindings/ata/exynos-sata-phy.txt
