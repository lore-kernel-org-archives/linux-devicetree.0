From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH v4 2/2] Add documentation for tca6507 devicetree bindings.
Date: Mon, 3 Dec 2012 11:29:35 -0800
Message-ID: <CAK5ve-K3aEd57xV_pL36V5sL0FEhp4cWh0DX9zO1j9s1C+j_zg@mail.gmail.com>
References: <1354312850-29264-1-git-send-email-marek.belisko@open-nandra.com> <1354312850-29264-2-git-send-email-marek.belisko@open-nandra.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1354312850-29264-2-git-send-email-marek.belisko@open-nandra.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Belisko <marek.belisko@open-nandra.com>
Cc: rpurdie@rpsys.net, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 30, 2012 at 2:00 PM, Marek Belisko
<marek.belisko@open-nandra.com> wrote:
> Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
> ---
>  Documentation/devicetree/bindings/leds/tca6507.txt |   33 ++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/tca6507.txt
>
> diff --git a/Documentation/devicetree/bindings/leds/tca6507.txt b/Documentation/devicetree/bindings/leds/tca6507.txt
> new file mode 100644
> index 0000000..2b6693b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/tca6507.txt
> @@ -0,0 +1,33 @@
> +LEDs conected to tca6507
> +
> +Required properties:
> +- compatible : should be : "ti,tca6507".
> +
> +Each led is represented as a sub-node of the ti,tca6507 device.
> +
> +LED sub-node properties:
> +- label : (optional) see Documentation/devicetree/bindings/leds/common.txt
> +- reg : number of LED line (could be from 0 to 6)
> +- linux,default-trigger : (optional)
> +   see Documentation/devicetree/bindings/leds/common.txt

Did you post patch to add this file? I failed to find it and overall
this patchset looks fine with me.

-Bryan

> +
> +Examples:
> +
> +tca6507@45 {
> +       compatible = "ti,tca6507";
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +       reg = <0x45>;
> +
> +       led0: red-aux@0 {
> +               label = "red:aux";
> +               reg = <0x0>;
> +       };
> +
> +       led1: green-aux@1 {
> +               label = "green:aux";
> +               reg = <0x5>;
> +               linux,default-trigger = "default-on";
> +       };
> +};
> +
> --
> 1.7.10.4
>
