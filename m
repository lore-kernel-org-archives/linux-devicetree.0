From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: media: Convert Allwinner A10 IR to a schema
Date: Tue, 13 Aug 2019 15:25:55 -0600
Message-ID: <CAL_JsqJKw=UaZPzXZu7jCvzeVO7zNcb4mCC-eVmn8DMxsm5cXA@mail.gmail.com>
References: <20190813124513.31413-1-mripard@kernel.org> <20190813124513.31413-2-mripard@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190813124513.31413-2-mripard@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <mripard@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Young <sean@mess.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 13, 2019 at 6:45 AM Maxime Ripard <mripard@kernel.org> wrote:
>
> From: Maxime Ripard <maxime.ripard@bootlin.com>
>
> The older Allwinner SoCs have a IR receiver supported in Linux, with a
> matching Device Tree binding.
>
> Now that we have the DT validation in place, let's convert the device tree
> bindings for that controller over to a YAML schemas.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  .../media/allwinner,sun4i-a10-ir.yaml         | 80 +++++++++++++++++++
>  .../devicetree/bindings/media/sunxi-ir.txt    | 35 --------
>  2 files changed, 80 insertions(+), 35 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/sunxi-ir.txt

Reviewed-by: Rob Herring <robh@kernel.org>
