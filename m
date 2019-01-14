From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PatchV2 2/2] ARM64: dts: meson-gxbb-odroidc2: Fix usb phy reset warning
Date: Mon, 14 Jan 2019 08:22:08 -0800
Message-ID: <7hy37nky4v.fsf@baylibre.com>
References: <20190113153022.5040-1-linux.amoon@gmail.com> <20190113153022.5040-2-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190113153022.5040-2-linux.amoon@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org

Hi Anand,

Anand Moon <linux.amoon@gmail.com> writes:

> Add missing vin-supply node 5.0V regulator setting to power
> to usb ports, changes help fix the usb reset warning.
>
> [  795.380156] usb 1-1.2: reset high-speed USB device number 3 using dwc2
> [  798.356073] usb 1-1.2: reset high-speed USB device number 3 using dwc2
> [  801.331999] usb 1-1.2: reset high-speed USB device number 3 using dwc2
> [  804.307919] usb 1-1.2: reset high-speed USB device number 3 using dwc2
> [  807.283844] usb 1-1.2: reset high-speed USB device number 3 using dwc2
>
> Fixes: 5a0803bd5ae (ARM64: dts: meson-gxbb-odroidc2: Enable USB Nodes)
> Tested-by: Kevin Hilman <khilman@baylibre.com>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> Rebased on Kevin's amlogic/v5.0/fixes branch
> Changes from patch v1 [0] https://lore.kernel.org/patchwork/patch/1031243/
> - Split the patch into two part: new patch
> - Fix the commit message
> - Added Tested by Kevin Hilman

Queued as fixes for v5.0-rc (branch: v5.0/fixes) with Neil's reviewed-by tags.

Thanks for breaking up into two patches, and as Neil said, please add a
cover letter to multi-patch series in the future.

Thanks,

Kevin
