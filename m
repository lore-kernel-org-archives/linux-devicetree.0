From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [RFC][PATCH] Revert "ARM: dts: bcm2837: Fix polarity of wifi
 reset GPIOs"
Date: Sun, 27 Jan 2019 22:02:33 +0100
Message-ID: <20190127210233.GA31748@kroah.com>
References: <20190127202813.29493-1-adi@adirat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190127202813.29493-1-adi@adirat.com>
Sender: stable-owner@vger.kernel.org
To: Ioan-Adrian Ratiu <adi@adirat.com>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, Jan 27, 2019 at 10:28:13PM +0200, Ioan-Adrian Ratiu wrote:
> This reverts commit bea8a160c621d19f7f78b13e14e03f4b8e44cd4b.
> 
> Contrary to what the commit message says, on my rpi 3 b v1.2 changing
> the polarity causes the exact behaviour this commit intends to fix, as
> described at the referenced link below (wlan0 disapears).
> 
> With reset-gpios = ... GPIO_ACTIVE_HIGH, brcmfmac errors in dmesg:
> 
> [    7.977512] brcmfmac: brcmf_sdio_bus_sleep: error while changing bus sleep state -110
> [    7.977623] brcmfmac: brcmf_sdio_txfail: sdio error, abort command and terminate frame
> [    7.978007] brcmfmac: brcmf_sdio_txfail: sdio error, abort command and terminate frame
> [    7.978377] brcmfmac: brcmf_sdio_txfail: sdio error, abort command and terminate frame
> [    7.978724] brcmfmac: brcmf_sdio_dpc: failed backplane access over SDIO, halting operation
> [    7.978734] brcmfmac: brcmf_proto_bcdc_query_dcmd: brcmf_proto_bcdc_msg failed w/status -110
> [    7.978747] brcmfmac: brcmf_cfg80211_get_channel: chanspec failed (-110)
> [    7.982817] brcmfmac: brcmf_sdio_bus_sleep: error while changing bus sleep state -110
> [    7.982880] brcmfmac: brcmf_sdio_txfail: sdio error, abort command and terminate frame
> [    7.983255] brcmfmac: brcmf_sdio_txfail: sdio error, abort command and terminate frame
> 
> The only solution I currently have is to revert and everything works
> as expected and as before changing the polarity.
> 
> Link: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=911443
> Signed-off-by: Ioan-Adrian Ratiu <adi@adirat.com>
> ---
>  arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts | 2 +-
>  arch/arm/boot/dts/bcm2837-rpi-3-b.dts      | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>
