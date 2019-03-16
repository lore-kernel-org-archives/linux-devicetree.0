From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 1/3] dt-bindings: Add doc for the ingenic-drm driver
Date: Sat, 16 Mar 2019 22:56:35 +0100
Message-ID: <1552773395.1562.1@crapouillou.net>
References: <20190315170701.29670-1-paul@crapouillou.net>
        <20190316205945.GA11309@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190316205945.GA11309@ravnborg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

Hi Sam,

Le sam. 16 mars 2019 =E0 21:59, Sam Ravnborg <sam@ravnborg.org> a =E9crit=20
:
> Hi Paul.
>=20
> On Fri, Mar 15, 2019 at 06:06:59PM +0100, Paul Cercueil wrote:
>>  Add documentation for the devicetree bindings of the DRM driver for=20
>> the
>>  JZ47xx family of SoCs from Ingenic.
>>=20
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  Tested-by: Artur Rojek <contact@artur-rojek.eu>
>>  ---
>>=20
>>  Notes:
>>      v2: Remove ingenic,panel property.
>>=20
>>   .../devicetree/bindings/display/ingenic,drm.txt    | 29=20
>> ++++++++++++++++++++++
>>   1 file changed, 29 insertions(+)
>>   create mode 100644=20
>> Documentation/devicetree/bindings/display/ingenic,drm.txt
>>=20
>>  diff --git=20
>> a/Documentation/devicetree/bindings/display/ingenic,drm.txt=20
>> b/Documentation/devicetree/bindings/display/ingenic,drm.txt
>>  new file mode 100644
>>  index 000000000000..f57a4ae0f7ac
>>  --- /dev/null
>>  +++ b/Documentation/devicetree/bindings/display/ingenic,drm.txt
>>  @@ -0,0 +1,29 @@
>>  +Ingenic JZ47xx DRM driver
>>  +
>>  +Required properties:
>>  +- compatible: one of:
>>  +  * ingenic,jz4740-drm
>>  +  * ingenic,jz4725b-drm
>>  +- reg: LCD registers location and length
>>  +- clocks: LCD pixclock and device clock specifiers.
>>  +	   The device clock is only required on the JZ4740.
>>  +- clock-names: "lcd_pclk" and "lcd"
>>  +- interrupts: Specifies the interrupt line the LCD controller is=20
>> connected to.
>>  +
>>  +Optional properties:
>>  +- ingenic,lcd-mode: LCD mode to use with the display panel.
>>  +		    See <dt-bindings/display/ingenic,drm.h> for all the
>>  +		    possible values.
>=20
> The value of the ingenic,lcd-mode depends on the panel used.
> So this looks like a panel property and not a display property.
>=20
> The panel should be specified using an OF graph binding
> in a port sub-node.
> The remote-endpoint will specifify the panel properties
> and if the panel requires something special from the display driver,
> the panle should specify this.
> So one can change panel without touching the display node
> in the DT.

Then the 'ingenic,lcd-mode' property would be in the panel node,
even though it's not used by the panel driver but by the DRM driver?
That sounds strange to me.

>>  +
>>  +Example:
>>  +
>>  +lcd: lcd-controller@13050000 {
>>  +	compatible =3D "ingenic,jz4725b-drm";
>>  +	reg =3D <0x13050000 0x1000>;
>>  +
>>  +	interrupt-parent =3D <&intc>;
>>  +	interrupts =3D <31>;
>>  +
>>  +	clocks =3D <&cgu JZ4725B_CLK_LCD>;
>>  +	clock-names =3D "lcd";
>>  +};
>=20
> As hinted above the panel is not specified above and to follow the
> modern way to do so would be to use a OF graph binding.

It's done this way in the DRM driver now, but I didn't update the
example. I will update it in the next version.

-Paul
=
