From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 1/2] dt-bindings: Add doc for the Ingenic JZ47xx LCD
 controller driver
Date: Wed, 12 Jun 2019 10:49:52 +0200
Message-ID: <1560329392.1823.1@crapouillou.net>
References: <20190603152331.23160-1-paul@crapouillou.net>
        <20190611215554.GA23791@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190611215554.GA23791@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>, Mark Rutland <mark.rutland@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, od@zcrc.me, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Artur Rojek <contact@artur-rojek.eu>
List-Id: devicetree@vger.kernel.org



Le mar. 11 juin 2019 =E0 23:55, Rob Herring <robh@kernel.org> a =E9crit :
> On Mon,  3 Jun 2019 17:23:30 +0200, Paul Cercueil wrote:
>>  Add documentation for the devicetree bindings of the LCD controller=20
>> present in
>>  the JZ47xx family of SoCs from Ingenic.
>>=20
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  Tested-by: Artur Rojek <contact@artur-rojek.eu>
>>  ---
>>=20
>>  Notes:
>>      v2: Remove ingenic,panel property.
>>=20
>>      v3: - Rename compatible strings from ingenic,jz47XX-drm to=20
>> ingenic,jz47XX-lcd
>>          - The ingenic,lcd-mode property is now read from the panel=20
>> node instead
>>      	  of from the driver node
>>=20
>>      v4: Remove ingenic,lcd-mode property completely.
>>=20
>>      v5: No change
>>=20
>>   .../bindings/display/ingenic,lcd.txt          | 44=20
>> +++++++++++++++++++
>>   1 file changed, 44 insertions(+)
>>   create mode 100644=20
>> Documentation/devicetree/bindings/display/ingenic,lcd.txt
>>=20
>=20
> Please add Acked-by/Reviewed-by tags when posting new versions.=20
> However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
>=20
> If a tag was not added on purpose, please state why and what changed.

Sorry Rob, my mistake. I simply forgot that you ever reviewed that=20
patch.

=
