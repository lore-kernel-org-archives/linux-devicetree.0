From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Subject: Re: [PATCH v2 0/5] USB: dwc2: Allow wakeup from suspend; enable for
 rk3288-veyron
Date: Thu, 18 Apr 2019 16:40:51 +0400
Message-ID: <e4b3cd69-1c91-dfbe-bea7-bbca89ca1348@synopsys.com>
References: <20190418001356.124334-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190418001356.124334-1-dianders@chromium.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Douglas Anderson <dianders@chromium.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, "heiko@sntech.de" <heiko@sntech.de>
Cc: Mark Rutland <mark.rutland@arm.com>, Amelie Delaunay <amelie.delaunay@st.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kai-Heng Feng <kai.heng.feng@canonical.com>, "zyw@rock-chips.com" <zyw@rock-chips.com>, Stefan Wahren <stefan.wahren@i2se.com>, Nicolas Boichat <drinkcat@chromium.org>, "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, "mka@chromium.org" <mka@chromium.org>, Alan Stern <stern@rowland.harvard.edu>, Jon Flatley <jflat@chromium.org>, Artur Petrosyan <Arthur.Petrosyan@synopsys.com>, Elaine Zhang <zhangqing@rock-chips.com>, "amstan@chromium.org" <amstan@chromium.org>, Randy Li <ayaka@soulik.info>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mathias Nyman <mathias.nyman@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb
List-Id: devicetree@vger.kernel.org

Hi Douglas,

On 4/18/2019 4:15 AM, Douglas Anderson wrote:
> This re-hashes two older series I posted a long time ago, re-basing
> them to mainline.  ...well, technically, atop another dwc2 series I
> recently posted:
> 
> * usb: dwc2: Another attempt handling rk3288's remote wake quirk
>    https://urldefense.proofpoint.com/v2/url?u=https-3A__lkml.kernel.org_r_20190416215351.242246-2D1-2Ddianders-40chromium.org&d=DwIDAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=cQBKt4q-qzNVC53rNAwuwplH23V61rHQhhULvdLA0U8&m=tZD-jhA4bSymns9pwqhaT0Ico1SVCYevQaaQclHX8jY&s=b-IYjc3cgFyZYC_B9zSA_xbSLE2ODwAZX0Png-G4SwA&e=
>    https://urldefense.proofpoint.com/v2/url?u=https-3A__lore.kernel.org_patchwork_cover_1062972_&d=DwIDAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=cQBKt4q-qzNVC53rNAwuwplH23V61rHQhhULvdLA0U8&m=tZD-jhA4bSymns9pwqhaT0Ico1SVCYevQaaQclHX8jY&s=VCNBuDGf2VeFFWUUyE3wUdn-sDnUu0nFipeNpyWPXts&e=
> 
> In general I've tried to add links to each patch pointing to relevant
> older discussion.  Here are overall links to the cover letters though.
> Note that for the previous "allow wakeup" series the discussion was
> scattered a bit between the original post and the repost.
> 
> * usb: dwc2: bus suspend/resume that's not hibernate
>    https://urldefense.proofpoint.com/v2/url?u=https-3A__lkml.kernel.org_r_1446237173-2D15263-2D1-2Dgit-2Dsend-2Demail-2Ddianders-40chromium.org&d=DwIDAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=cQBKt4q-qzNVC53rNAwuwplH23V61rHQhhULvdLA0U8&m=tZD-jhA4bSymns9pwqhaT0Ico1SVCYevQaaQclHX8jY&s=FSVMrPFuSM--uXrAZN9GzCEXP60Li7miMsC4ydv6oDQ&e=
>    https://urldefense.proofpoint.com/v2/url?u=https-3A__lore.kernel.org_patchwork_patch_613761_&d=DwIDAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=cQBKt4q-qzNVC53rNAwuwplH23V61rHQhhULvdLA0U8&m=tZD-jhA4bSymns9pwqhaT0Ico1SVCYevQaaQclHX8jY&s=omRYPw4XVgY8Rq2UgJhApk2poeKXWCBc5QsYMlQkqk4&e=
> 
> * dwc2 patches to allow wakeup on Rockchip rk3288
>    https://urldefense.proofpoint.com/v2/url?u=https-3A__lkml.kernel.org_r_1435017144-2D2971-2D1-2Dgit-2Dsend-2Demail-2Ddianders-40chromium.org&d=DwIDAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=cQBKt4q-qzNVC53rNAwuwplH23V61rHQhhULvdLA0U8&m=tZD-jhA4bSymns9pwqhaT0Ico1SVCYevQaaQclHX8jY&s=ep7GoHZcPlQbiOkXlwy9xXZEKdbd4o2erhLSblDL5Rg&e=
>    https://urldefense.proofpoint.com/v2/url?u=https-3A__lore.kernel.org_patchwork_cover_572944_&d=DwIDAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=cQBKt4q-qzNVC53rNAwuwplH23V61rHQhhULvdLA0U8&m=tZD-jhA4bSymns9pwqhaT0Ico1SVCYevQaaQclHX8jY&s=hq4errAA9YvVpHJaVoWGTIHnlwiq1iuadWW1WJavtCI&e=
> 
> * dwc2 patches to allow wakeup on Rockchip rk3288 (REPOST)
>    https://urldefense.proofpoint.com/v2/url?u=https-3A__lkml.kernel.org_r_1436207224-2D21849-2D1-2Dgit-2Dsend-2Demail-2Ddianders-40chromium.org&d=DwIDAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=cQBKt4q-qzNVC53rNAwuwplH23V61rHQhhULvdLA0U8&m=tZD-jhA4bSymns9pwqhaT0Ico1SVCYevQaaQclHX8jY&s=n-nD8EdqtgTyPdPPJ06t2pxyjC1M65g5aXLT1OiuouY&e=
>    https://urldefense.proofpoint.com/v2/url?u=https-3A__lore.kernel.org_patchwork_cover_576120_&d=DwIDAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=cQBKt4q-qzNVC53rNAwuwplH23V61rHQhhULvdLA0U8&m=tZD-jhA4bSymns9pwqhaT0Ico1SVCYevQaaQclHX8jY&s=YkisA-u9q0yewqaRoOWWpps9E2QFh1asgnwkbM1B7mc&e=
> 
> I'm hoping there's a better chance of these things landing this time
> around, but I guess we'll see.  ;-)
> 
> In case it's helpful I've put what I tested (which is based on Heiko's
> for-next branch and includes patches to enable deep suspend plus two
> other s2r fixes) at:
> 
> https://urldefense.proofpoint.com/v2/url?u=https-3A__chromium.googlesource.com_chromiumos_third-5Fparty_kernel_-2Blog_refs_sandbox_dianders_190417-2Dtesting-2Ddwc2-2Dwakeup&d=DwIDAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=cQBKt4q-qzNVC53rNAwuwplH23V61rHQhhULvdLA0U8&m=tZD-jhA4bSymns9pwqhaT0Ico1SVCYevQaaQclHX8jY&s=ws6kQVDDGxYJnhR693pQP9fYL-PH_TUGzSVmD4u-S9Q&e=
> 
> Changes in v2:
> - Rebased to mainline atop rk3288 remote wake quirk series.
> - rk3288-veyron dts patch new for v2.
> 
> Douglas Anderson (5):
>    usb: dwc2: bus suspend/resume for hosts with
>      DWC2_POWER_DOWN_PARAM_NONE
>    USB: Export usb_wakeup_enabled_descendants()
>    Documentation: dt-bindings: Add snps,need-phy-for-wake for dwc2 USB
>    USB: dwc2: Don't turn off the usbphy in suspend if wakeup is enabled
>    ARM: dts: rockchip: Allow wakeup from rk3288-veyron's dwc2 USB ports
> 
>   .../devicetree/bindings/usb/dwc2.txt          |  3 +
>   arch/arm/boot/dts/rk3288-veyron.dtsi          |  2 +
>   drivers/usb/core/hub.c                        |  7 +-
>   drivers/usb/dwc2/core.h                       |  5 ++
>   drivers/usb/dwc2/hcd.c                        | 84 ++++++++++++-------
>   drivers/usb/dwc2/platform.c                   | 43 +++++++++-
>   include/linux/usb/hcd.h                       |  5 ++
>   7 files changed, 113 insertions(+), 36 deletions(-)
> 

Did you consider/reviewed patch series from Artur Petrosyan "[PATCH 
00/14] usb: dwc2: Fix and improve power saving modes" (submitted on 
April 12) which fixing partial power down and hibernation flows for both 
modes: host and device?
I suspect that this both patch series can be in conflict.

Thanks,
Minas
