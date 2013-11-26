From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] of: Add simple panel device tree binding
Date: Tue, 26 Nov 2013 02:54:41 +0100
Message-ID: <2120855.5UlavpPp2J@avalon>
References: <1385145714-3022-1-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1385145714-3022-1-git-send-email-treding@nvidia.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <rob.herring@calxeda.com>, Hans de Goede <hdegoede@redhat.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

Hi Thierry,

Thank you for the patch.

On Friday 22 November 2013 19:41:54 Thierry Reding wrote:
> This binding specifies a set of common properties for display panels. It
> can be used as a basis by bindings for specific panels.
> 
> Bindings for three specific panels are provided to show how the simple
> panel binding can be used.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> This binding has already been discussed earlier. Both Laurent and Tomi
> seemed to be generally fine with this.

That's correct, I'm generally fine with your approach, but there's still one 
point I'd like to see addressed.

As I mentioned previously, I would like to avoid adding zillions of compatible 
properties to the driver, when we could use a single property in the DT 
bindings that would specify the timings instead. This would lower the amount 
of changes made to the simple panel driver, while keeping DT simple enough (at 
least in my opinion).

Specifying the full timings in every DT source file would be pretty verbose 
and could be error-prone. However, using a single property to specify one of 
the standard display timings, as orinally proposed by Hans de Goede (CC'ed) 
during a chat at the kernel summit would in my opinion be a good middle-ground 
solution.

Would you consider adding such a property to the simple panel bindings, and 
define a common compatible string ? Each panel should of course list its own 
compatibility string in addition to the common compatible string in case the 
need for extensions arises in the future.

> The fact that the binding targets simple (dumb) panels only and the reduced
> set of properties make it easy to be extended in backwards-compatible ways
> should the need arise, while at the same time allowing to support a wide
> variety of panels out there.
> 
>  .../devicetree/bindings/panel/auo,b101aw03.txt      |  7 +++++++
>  .../bindings/panel/chunghwa,claa101wb03.txt         |  7 +++++++
>  .../bindings/panel/panasonic,vvx10f004b00.txt       |  7 +++++++
>  .../devicetree/bindings/panel/simple-panel.txt      | 21 ++++++++++++++++++
>  4 files changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/panel/auo,b101aw03.txt
> create mode 100644
> Documentation/devicetree/bindings/panel/chunghwa,claa101wb03.txt create
> mode 100644
> Documentation/devicetree/bindings/panel/panasonic,vvx10f004b00.txt create
> mode 100644 Documentation/devicetree/bindings/panel/simple-panel.txt
> 
> diff --git a/Documentation/devicetree/bindings/panel/auo,b101aw03.txt
> b/Documentation/devicetree/bindings/panel/auo,b101aw03.txt new file mode
> 100644
> index 000000000000..72e088a4fb3a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/panel/auo,b101aw03.txt
> @@ -0,0 +1,7 @@
> +AU Optronics Corporation 10.1" WSVGA TFT LCD panel
> +
> +Required properties:
> +- compatible: should be "auo,b101aw03"
> +
> +This binding is compatible with the simple-panel binding, which is
> specified +in simple-panel.txt in this directory.
> diff --git
> a/Documentation/devicetree/bindings/panel/chunghwa,claa101wb03.txt
> b/Documentation/devicetree/bindings/panel/chunghwa,claa101wb03.txt new file
> mode 100644
> index 000000000000..0ab2c05a4c22
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/panel/chunghwa,claa101wb03.txt
> @@ -0,0 +1,7 @@
> +Chunghwa Picture Tubes Ltd. 10.1" WXGA TFT LCD panel
> +
> +Required properties:
> +- compatible: should be "chunghwa,claa101wb03"
> +
> +This binding is compatible with the simple-panel binding, which is
> specified +in simple-panel.txt in this directory.
> diff --git
> a/Documentation/devicetree/bindings/panel/panasonic,vvx10f004b00.txt
> b/Documentation/devicetree/bindings/panel/panasonic,vvx10f004b00.txt new
> file mode 100644
> index 000000000000..d328b0341bf4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/panel/panasonic,vvx10f004b00.txt
> @@ -0,0 +1,7 @@
> +Panasonic Corporation 10.1" WUXGA TFT LCD panel
> +
> +Required properties:
> +- compatible: should be "panasonic,vvx10f004b00"
> +
> +This binding is compatible with the simple-panel binding, which is
> specified +in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/panel/simple-panel.txt
> b/Documentation/devicetree/bindings/panel/simple-panel.txt new file mode
> 100644
> index 000000000000..1341bbf4aa3d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/panel/simple-panel.txt
> @@ -0,0 +1,21 @@
> +Simple display panel
> +
> +Required properties:
> +- power-supply: regulator to provide the supply voltage
> +
> +Optional properties:
> +- ddc-i2c-bus: phandle of an I2C controller used for DDC EDID probing
> +- enable-gpios: GPIO pin to enable or disable the panel
> +- backlight: phandle of the backlight device attached to the panel
> +
> +Example:
> +
> +	panel: panel {
> +		compatible = "cptt,claa101wb01";
> +		ddc-i2c-bus = <&panelddc>;
> +
> +		power-supply = <&vdd_pnl_reg>;
> +		enable-gpios = <&gpio 90 0>;
> +
> +		backlight = <&backlight>;
> +	};
-- 
Regards,

Laurent Pinchart
