From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v5 3/3] ARM: bcm2835: Add DT for the firmware clocks driver.
Date: Fri, 14 Aug 2015 22:13:31 -0600
Message-ID: <55CEBC6B.9070001@wwwdotorg.org>
References: <1439507142-2965-1-git-send-email-eric@anholt.net> <1439507142-2965-4-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1439507142-2965-4-git-send-email-eric@anholt.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Eric Anholt <eric@anholt.net>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@linaro.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 08/13/2015 05:05 PM, Eric Anholt wrote:
> Signed-off-by: Eric Anholt <eric@anholt.net>
> Acked-by: Lee Jones <lee@kernel.org>

A patch description might be nice, although admittedly the subject seems
clear enough.

> diff --git a/arch/arm/boot/dts/bcm2835-rpi.dtsi b/arch/arm/boot/dts/bcm2835-rpi.dtsi

> +		firmware_clocks: firmware-clocks {
> +			compatible = "raspberrypi,bcm2835-firmware-clocks";
> +			#clock-cells = <1>;
> +			raspberrypi,firmware = <&firmware>;
> +		};

No need to resend for this, but just a background note: DT node names
usually contain a device type not a device identity, so "clocks" not
"firmware-clocks" would be typical.

This patch,
Acked-by: Stephen Warren <swarren@wwwdotorg.org>
