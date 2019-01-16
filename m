From: Maxime Jourdan <mjourdan@baylibre.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: meson: add specific simplefb bindings
Date: Wed, 16 Jan 2019 13:27:48 +0100
Message-ID: <CAMO6nazpZmr7sNNc4HL_f7Sovv3xAfDmOAc=_NTyFFH7F2y__Q@mail.gmail.com>
References: <20190107095307.15233-1-mjourdan@baylibre.com> <20190107095307.15233-2-mjourdan@baylibre.com>
 <20190111222509.GA14462@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190111222509.GA14462@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 11, 2019 at 11:25 PM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Jan 07, 2019 at 10:53:06AM +0100, Maxime Jourdan wrote:
> > Similar to simple-framebuffer-sunxi, we support different display pipelines
> > that the firmware is free to choose from.
> >
> > This documents the "amlogic,simple-framebuffer" compatible and the
> > "amlogic,pipeline" extension.
> >
> > Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
> > ---
> >  .../display/simple-framebuffer-meson.txt      | 33 +++++++++++++++++++
>
> Use the compatible string for the file name:
> amlogic,simple-framebuffer.txt
>
> With that,
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks for the review, will send a v3.
