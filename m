From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH] ARM64: dts: meson-gxl-s905x-khadas-vim enable Bluetooth
Date: Wed, 14 Nov 2018 15:23:48 -0800
Message-ID: <7hpnv7gs57.fsf@eze.i-did-not-set--mail-host-address--so-tickle-me>
References: <1539432427-11779-1-git-send-email-christianshewitt@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1539432427-11779-1-git-send-email-christianshewitt@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: christianshewitt@gmail.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Carlo Caione <carlo@caione.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Christian Hewitt <christianshewitt@gmail.com> writes:

> This enables Bluetooth support for the following models:
>
> - Khadas VIM basic (AP6212) using firmware BCM43438A1.hcd
> - Khadas VIM pro (AP6255) using firmware BCM4345C0.hcd
>
> The AP6212 module used on the VIM basic has an ID clash with another
> device. To get Bluetooth working you either need to apply a kernel
> patch to drivers/bluetooth/btbcm.c so 0x2209 loads BCM43438A1 or the
> BCM43438A1.hcd firmware must be renamed to BCM43430A1.hcd.
>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>

Queued for v4.21 (applied to v4.21/dt64 branch),

Kevin
