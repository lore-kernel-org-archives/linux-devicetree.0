From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: meson: add specific simplefb bindings
Date: Fri, 11 Jan 2019 16:25:09 -0600
Message-ID: <20190111222509.GA14462@bogus>
References: <20190107095307.15233-1-mjourdan@baylibre.com>
 <20190107095307.15233-2-mjourdan@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190107095307.15233-2-mjourdan@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Jourdan <mjourdan@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 07, 2019 at 10:53:06AM +0100, Maxime Jourdan wrote:
> Similar to simple-framebuffer-sunxi, we support different display pipelines
> that the firmware is free to choose from.
> 
> This documents the "amlogic,simple-framebuffer" compatible and the
> "amlogic,pipeline" extension.
> 
> Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
> ---
>  .../display/simple-framebuffer-meson.txt      | 33 +++++++++++++++++++

Use the compatible string for the file name: 
amlogic,simple-framebuffer.txt

With that,

Reviewed-by: Rob Herring <robh@kernel.org>
