From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] dt-bindings: Add doc for the ingenic-drm driver
Date: Fri, 8 Mar 2019 23:23:33 +0100
Message-ID: <CACRpkdbtnuHC6Ob-soewxKbH_AR+ijg-zkc_w2ZTBg8qBPkoZw@mail.gmail.com>
References: <20190228220756.20262-1-paul@crapouillou.net> <20190228220756.20262-2-paul@crapouillou.net>
 <20190301201624.GA22317@ravnborg.org> <1551480042.1526.0@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551480042.1526.0@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-mips@vger.kernel.org, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 1, 2019 at 11:41 PM Paul Cercueil <paul@crapouillou.net> wrote:

> I also have a board with a "smart" panel (ili9331)
> that needs a special configuration in the IP. There is nothing in
> the drm_panel interface that tells me what mode I should use for what
> panel...

Is the ILI9331 anything similar to ILI9322 that I have a driver
for in drivers/gpu/drm/panel/panel-ilitek-ili9322.c?
I was hoping they would be similar and we =E1=BA=83ould be able
to just reuse that driver for more of them but I might be
mistaken.

Yours,
Linus Walleij
