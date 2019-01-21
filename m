From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 4/6] dt-bindings: display: armada: Add display subsystem binding
Date: Mon, 21 Jan 2019 09:35:02 -0600
Message-ID: <CAL_JsqLT7jEdwi7o7RR_3OcbMTxeNXmSzif8Ez2psjhu24No5Q@mail.gmail.com>
References: <20190120172534.24617-1-lkundrak@v3.sk> <20190120172534.24617-5-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190120172534.24617-5-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Lubomir Rintel <lkundrak@v3.sk>
Cc: Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, dri-devel <dri-devel@lists.freedesktop.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jan 20, 2019 at 11:26 AM Lubomir Rintel <lkundrak@v3.sk> wrote:
>
> The Marvell Armada DRM master device is a virtual device needed to list all
> nodes that comprise the graphics subsystem.
>
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---
>  .../display/armada/marvell-armada-drm.txt     | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/armada/marvell-armada-drm.txt b/Documentation/devicetree/bindings/display/armada/marvell-armada-drm.txt
> index de4cca9432c8..3dbfa8047f0b 100644
> --- a/Documentation/devicetree/bindings/display/armada/marvell-armada-drm.txt
> +++ b/Documentation/devicetree/bindings/display/armada/marvell-armada-drm.txt
> @@ -1,3 +1,27 @@
> +Marvell Armada DRM master device
> +================================
> +
> +The Marvell Armada DRM master device is a virtual device needed to list all
> +nodes that comprise the graphics subsystem.
> +
> +Required properties:
> +
> + - compatible: value should be "marvell,dove-display-subsystem",
> +   "marvell,armada-display-subsystem"
> + - ports: a list of phandles pointing to display interface ports of CRTC
> +   devices
> + - memory-region: phandle to a node describing memory to be used for the
> +   framebuffer
> +
> +Example:
> +
> +       display-subsystem {
> +               compatible = "marvell,dove-display-subsystem",
> +                            "marvell,armada-display-subsystem";
> +               memory-region = <&display_reserved>;
> +               ports = <&lcd0_port>;

If there is only one device, you don't need this virtual node.


> +       };
> +
>  Marvell Armada LCD controller
>  =============================
>
> --
> 2.20.1
>
