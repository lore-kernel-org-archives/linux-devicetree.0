From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH anybus v3 5/6] dt-bindings: anybuss-host: document
 devicetree binding
Date: Thu, 8 Nov 2018 15:11:22 +0100
Message-ID: <CAK8P3a1ZUaxJzfzYoqAK+_ZBazHzF6nG1V2aiZSoiQr6nDhiSQ@mail.gmail.com>
References: <20181104155501.14767-1-TheSven73@googlemail.com> <20181104155501.14767-6-TheSven73@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181104155501.14767-6-TheSven73@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thesven73@gmail.com
Cc: svendev@arcx.com, Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, Mark Rutland <mark.rutland@arm.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Thierry Reding <treding@nvidia.com>, David Lechner <david@lechnology.com>, noralf@tronnes.org, Johan Hovold <johan@kernel.org>, Michal Simek <monstr@monstr.eu>, michal.vokac@ysoft.com, gregkh <gregkh@linuxfoundation.org>, John Garry <john.garry@huawei.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Robin Murphy <robin.murphy@arm.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>, Icenowy Zheng <icenowy@aosc.io>, Stuart Yoder <stuyoder@gmail.com>, Maxime Ripard <maxime.r>
List-Id: devicetree@vger.kernel.org

On Sun, Nov 4, 2018 at 4:55 PM <thesven73@gmail.com> wrote:


> ---
>  .../bindings/bus/arcx,anybuss-host.txt        | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bus/arcx,anybuss-host.txt
>
> diff --git a/Documentation/devicetree/bindings/bus/arcx,anybuss-host.txt b/Documentation/devicetree/bindings/bus/arcx,anybuss-host.txt
> new file mode 100644
> index 000000000000..5c28e4e09bb2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/arcx,anybuss-host.txt
> @@ -0,0 +1,36 @@
> +* Arcx Anybus-S host
> +
> +This host communicates with the SoC over a parallel bus. It is
> +expected that its Device Tree node is specified as the child of a node
> +corresponding to the parallel bus used for communication.
> +
> +Required properties:
> +
> +  - compatible : The following string:
> +        "arcx,anybuss-host"
> +
> +  - reg : bus memory area where the Anybus-S host dpram is located.
> +
> +  - interrupts : interrupt connected to the Anybus-S host interrupt line.
> +       Generic interrupt client node bindings are described in
> +               interrupt-controller/interrupts.txt
> +
> +  - resets : the reset line associated with the Anybus-S host.
> +
> +Example of usage:
> +
> +This example places the Anybus-S host on top of the i.MX WEIM parallel bus, see:
> +Documentation/devicetree/bindings/bus/imx-weim.txt

To allow describing connected devices, I think we need a #address-cells
and #size-cells property here, with fixed values. If a device is attached by
a single 32-bit integer, then

 #address-cells = <1>;
 #size-cells = <0>;

should be enough, otherwise you might need additional address cells.
Actually listing the device(s) can be optional, but we do need the
adress in order
to let the bus code associate a device_node pointer with the child
device structure to let a driver read the properties.

       Arnd
