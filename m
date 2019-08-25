From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 0/7] arm64: dts: meson: ir keymap updates
Date: Sun, 25 Aug 2019 21:38:37 +0200
Message-ID: <CAFBinCD0uhE9Fj1we2MkaTbk7RwtmKh7Fn1C-2nn9wiWqCoNfg@mail.gmail.com>
References: <1566705688-18442-1-git-send-email-christianshewitt@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1566705688-18442-1-git-send-email-christianshewitt@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, Aug 25, 2019 at 6:03 AM Christian Hewitt
<christianshewitt@gmail.com> wrote:
>
> This series adds keymaps for several box/board vendor IR remote devices
> to respective device-tree files. The keymaps were submitted in [0] and
> have been queued for inclusion in Linux 5.4.
>
> The Khadas remote change swaps the rc-geekbox keymap for rc-khadas. The
> Geekbox branded remote was only sold for a brief period when VIM(1) was
> a new device. The Khadas branded remote that replaced it exchanged the
> Geekbox full-screen key for an Android mouse button using a different IR
> keycode. The rc-khadas keymap supports the mouse button keycode and maps
> it to KEY_MUTE.
>
> [0] https://patchwork.kernel.org/project/linux-media/list/?series=160309
>
> Christian Hewitt (7):
>   arm64: dts: meson-g12b-odroid-n2: add rc-odroid keymap
>   arm64: dts: meson-g12a-x96-max: add rc-x96max keymap
>   arm64: dts: meson-gxbb-wetek-hub: add rc-wetek-hub keymap
>   arm64: dts: meson-gxbb-wetek-play2: add rc-wetek-play2 keymap
>   arm64: dts: meson-gxl-s905x-khadas-vim: use rc-khadas keymap
>   arm64: dts: meson-gxl-s905w-tx3-mini: add rc-tx3mini keymap
>   arm64: dts: meson-gxm-khadas-vim2: use rc-khadas keymap
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
