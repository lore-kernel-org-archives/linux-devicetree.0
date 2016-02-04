From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH] arm64: dts: apq8016-sbc: Add DT node for the uSD SDHC interface
Date: Thu, 04 Feb 2016 14:06:19 -0800
Message-ID: <7hmvrgb06c.fsf@baylibre.com>
References: <1454590402-13507-1-git-send-email-georgi.djakov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1454590402-13507-1-git-send-email-georgi.djakov@linaro.org>
	(Georgi Djakov's message of "Thu, 4 Feb 2016 14:53:22 +0200")
Sender: linux-arm-msm-owner@vger.kernel.org
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: andy.gross@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Georgi Djakov <georgi.djakov@linaro.org> writes:

> Add the necessary properties to enable the SD-card on db410c boards.
>
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>

I tried this with 2 different SD cards on my dragonboard 410c but it's
not detecting either card. 

Some relevant stuff from one of the boots, but definitely seems like
some voltage switching not going well:

[    1.450613] sdhci_msm 7864900.sdhci: Got CD GPIO
[    1.460379] sdhci_msm 7864900.sdhci: Failed getting OCR mask: 0
[    1.462862] l11: voltage operation not allowed
[    1.465097] sdhci_msm 7864900.sdhci: could not set regulator OCR (-1)
[    1.469684] mmc0: MAN_BKOPS_EN bit is not set
[    1.476456] l12: voltage operation not allowed
[    1.480527] mmc1: Switching to 3.3V signalling voltage failed
[    1.484909] l12: voltage operation not allowed
[    1.490674] mmc1: Switching to 1.8V signalling voltage failed
[    1.495058] l12: voltage operation not allowed
[    1.500817] mmc1: Switching to 1.2V signalling voltage failed
[    1.507342] mmc0: new HS200 MMC card at address 0001
[    1.515354] mmcblk0: mmc0:0001 DS2008 7.28 GiB 
[    1.520125] mmcblk0boot0: mmc0:0001 DS2008 partition 1 4.00 MiB
[    1.524369] mmcblk0boot1: mmc0:0001 DS2008 partition 2 4.00 MiB
[    1.530288] mmcblk0rpmb: mmc0:0001 DS2008 partition 3 4.00 MiB
[    1.533864] mmc1: SDHCI controller on 7864900.sdhci [7864900.sdhci] using ADMA 64-bit

[...]

[    1.614109] mmc1: error -110 whilst initialising SD card
[    1.716226] mmc1: Reset 0x1 never completed.
[    1.749438] random: udevd urandom read with 2 bits of entropy available
[    1.884756] l11: voltage operation not allowed
[    1.884787] sdhci_msm 7864900.sdhci: could not set regulator OCR (-1)
[    1.892888] l12: voltage operation not allowed
[    1.896335] mmc1: Switching to 3.3V signalling voltage failed
[    1.901712] l12: voltage operation not allowed
[    1.908095] mmc1: Switching to 1.8V signalling voltage failed
[    1.909095] l12: voltage operation not allowed
[    1.921811] mmc1: Switching to 1.2V signalling voltage failed
[    2.005997] mmc1: new high speed SDHC card at address 1234
[    2.014077] mmcblk1: mmc1:1234 SA08G 7.21 GiB 
[    2.021387] mmcblk1: error -110 sending status command, retrying
[    2.023544] mmcblk1: error -110 sending status command, retrying
[    2.028580] mmcblk1: error -110 sending status command, aborting
[    2.137791] mmc1: Reset 0x1 never completed.
[    2.255152] l11: voltage operation not allowed
[    2.255184] sdhci_msm 7864900.sdhci: could not set regulator OCR (-1)
[    2.261830] l12: voltage operation not allowed
[    2.264992] mmc1: Switching to 3.3V signalling voltage failed
[    2.277445] l12: voltage operation not allowed
[    2.277468] mmc1: Switching to 1.8V signalling voltage failed
[    2.284473] l12: voltage operation not allowed
[    2.288964] mmc1: Switching to 1.2V signalling voltage failed
[    2.346835] mmc1: tried to reset card
[    2.351026] mmcblk1: error -110 sending status command, retrying
[    2.353088] mmcblk1: error -110 sending status command, retrying
[    2.359550] mmcblk1: error -110 sending status command, aborting
[    2.362116] blk_update_request: I/O error, dev mmcblk1, sector 0
[    2.374049] Buffer I/O error on dev mmcblk1, logical block 0, async page read
[    2.381316] mmcblk1: error -110 sending status command, retrying
[    2.383455] mmcblk1: error -110 sending status command, retrying
[    2.391444] mmcblk1: error -110 sending status command, aborting
[    2.393162] blk_update_request: I/O error, dev mmcblk1, sector 0
[    2.401488] Buffer I/O error on dev mmcblk1, logical block 0, async page read
[    2.412265]  mmcblk1: unable to read partition table
[    2.420256] mmcblk1: error -110 sending status command, retrying
[    2.422410] mmcblk1: error -110 sending status command, retrying
[    2.427528] mmcblk1: error -110 sending status command, aborting
[    2.440903] blk_update_request: I/O error, dev mmcblk1, sector 15122304
[    2.445257] mmcblk1: error -110 sending status command, retrying
[    2.449248] mmcblk1: error -110 sending status command, retrying
[    2.459827] mmcblk1: error -110 sending status command, aborting
[    2.459863] blk_update_request: I/O error, dev mmcblk1, sector 15122304
[    2.471744] Buffer I/O error on dev mmcblk1, logical block 1890288, async page read


Kevin
