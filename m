From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/3] dt-bindings: Add doc for the ingenic-drm driver
Date: Fri, 01 Mar 2019 19:40:42 -0300
Message-ID: <1551480042.1526.0@crapouillou.net>
References: <20190228220756.20262-1-paul@crapouillou.net>
        <20190228220756.20262-2-paul@crapouillou.net>
        <20190301201624.GA22317@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190301201624.GA22317@ravnborg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sam Ravnborg <sam@ravnborg.org>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org, linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Sam, thanks for the feedback.

Le ven. 1 mars 2019 =E0 17:16, Sam Ravnborg <sam@ravnborg.org> a =E9crit :
> Hi Paul.
>=20
> Good to see work migrating fbdev =3D> drm.
>=20
> Following comments is based on experience while working on migrating
> another driver from fbdev =3D> drm.
>=20
> On Thu, Feb 28, 2019 at 07:07:54PM -0300, Paul Cercueil wrote:
>>  Add documentation for the devicetree bindings of the DRM driver for=20
>> the
>>  JZ47xx family of SoCs from Ingenic.
>>=20
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  Tested-by: Artur Rojek <contact@artur-rojek.eu>
>>  ---
>>   .../devicetree/bindings/display/ingenic,drm.txt    | 30=20
>> ++++++++++++++++++++++
>>   1 file changed, 30 insertions(+)
>>   create mode 100644=20
>> Documentation/devicetree/bindings/display/ingenic,drm.txt
>>=20
>>  diff --git=20
>> a/Documentation/devicetree/bindings/display/ingenic,drm.txt=20
>> b/Documentation/devicetree/bindings/display/ingenic,drm.txt
>>  new file mode 100644
>>  index 000000000000..52a368ec35cd
>>  --- /dev/null
>>  +++ b/Documentation/devicetree/bindings/display/ingenic,drm.txt
>>  @@ -0,0 +1,30 @@
>>  +Ingenic JZ47xx DRM driver
>>  +
>>  +Required properties:
>>  +- compatible: one of:
>>  +  * ingenic,jz4740-drm
>>  +  * ingenic,jz4725b-drm
>>  +- reg: LCD registers location and length
> The fbdev way of doing this was to hardcode register setttings.
> In the drm world we read the configuration of the panel and let
> this decide the actual configuration.
>=20
> Note that no drm drivers supports stn displays and that there
> is really no use for this these days. So you can skip the STN parts.

STN panels aren't really my problem; but I have a board with a Sharp
LS020B1DD01D panel, which requires the LCD IP to be configured for a
"special 2" panel. I also have a board with a "smart" panel (ili9331)
that needs a special configuration in the IP. There is nothing in
the drm_panel interface that tells me what mode I should use for what
panel...

> Also the modern way to specify a panel in the DT is using OF graph=20
> bindings.
> You can find many examples how to do this.

Ok, I was looking at the Tegra driver, which uses a "nvidia,panel" DT
property. I will change it to use the graph thing.

> I was there with the atmel LCDC driver (not in the kernel yet),
> and had some challenges with this.
>=20
> 	Sam

Thanks,
-Paul
=
