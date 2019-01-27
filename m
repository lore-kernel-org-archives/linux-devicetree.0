From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [RFC][PATCH] Revert "ARM: dts: bcm2837: Fix polarity of wifi
 reset GPIOs"
Date: Sun, 27 Jan 2019 22:26:33 +0100 (CET)
Message-ID: <1658074547.62977.1548624393424@email.ionos.de>
References: <20190127202813.29493-1-adi@adirat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190127202813.29493-1-adi@adirat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ioan-Adrian Ratiu <adi@adirat.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Ioan-Adrian,

> Ioan-Adrian Ratiu <adi@adirat.com> hat am 27. Januar 2019 um 21:28 geschrieben:
> 
> 
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

reverting this commit will only workaround the real issue. It lies in the sdhci-iproc driver.

Could please try this instead patch [1]?

[1] - https://patchwork.kernel.org/patch/10741809/
