From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: meson: Add drive-strength property
Date: Thu, 4 Apr 2019 10:42:03 +0700
Message-ID: <CACRpkdahO0rQ+qLuWOqeMTECsH6JwRL7Eh+hb2iNH4JwgzJkOQ@mail.gmail.com>
References: <20190314163725.7918-1-jbrunet@baylibre.com> <20190314163725.7918-2-jbrunet@baylibre.com>
 <20190330212830.GA28281@bogus> <722ef39685fb3b519d09c00a3444708abd685f9d.camel@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <722ef39685fb3b519d09c00a3444708abd685f9d.camel@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Guillaume La Roque <glaroque@baylibre.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sun, Mar 31, 2019 at 2:04 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
> On Sun, 2019-03-31 at 01:40 -0500, Rob Herring wrote:
> > On Thu, Mar 14, 2019 at 05:37:24PM +0100, Jerome Brunet wrote:
> > > From: Guillaume La Roque <glaroque@baylibre.com>

> > > +Optional properties :
> > > + - drive-strength: Drive strength for the specified pins in uA.
> >
> > The standard definition says this is in mA.
>
> Yes, the problem we have and the solutions we are thinking about are explained
> in detail in the cover letter of this patchset. Could you share your opinion
> on it ?

I like your idea with drive-strength-uA but I need the second opinion from the
device tree people.

Yours,
Linus Walleij
