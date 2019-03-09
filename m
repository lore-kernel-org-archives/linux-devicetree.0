From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/3] dt-bindings: Add doc for the ingenic-drm driver
Date: Sat, 09 Mar 2019 13:33:54 +0100
Message-ID: <1552134834.2040.0@crapouillou.net>
References: <20190228220756.20262-1-paul@crapouillou.net>
        <20190228220756.20262-2-paul@crapouillou.net>
        <20190301201624.GA22317@ravnborg.org> <1551480042.1526.0@crapouillou.net>
        <CACRpkdbtnuHC6Ob-soewxKbH_AR+ijg-zkc_w2ZTBg8qBPkoZw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbtnuHC6Ob-soewxKbH_AR+ijg-zkc_w2ZTBg8qBPkoZw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-mips@vger.kernel.org, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Linus,

On Fri, Mar 8, 2019 at 11:23 PM, Linus Walleij=20
<linus.walleij@linaro.org> wrote:
> On Fri, Mar 1, 2019 at 11:41 PM Paul Cercueil <paul@crapouillou.net=20
> <mailto:paul@crapouillou.net>> wrote:
>=20
>>  I also have a board with a "smart" panel (ili9331)
>>  that needs a special configuration in the IP. There is nothing in
>>  the drm_panel interface that tells me what mode I should use for=20
>> what
>>  panel...
>=20
> Is the ILI9331 anything similar to ILI9322 that I have a driver
> for in drivers/gpu/drm/panel/panel-ilitek-ili9322.c?
> I was hoping they would be similar and we =E1=BA=83ould be able
> to just reuse that driver for more of them but I might be
> mistaken.

That's a bit hard to tell right now, but from a quick look at the
datasheet, it looks quite different :(

-Paul

=
