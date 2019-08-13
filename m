From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: media: Add YAML schemas for the generic
 RC bindings
Date: Tue, 13 Aug 2019 15:23:56 -0600
Message-ID: <CAL_JsqLUfQdtXZMNTLJX9uMpdCY0NNN=AEDqGiemrdDazB8HeA@mail.gmail.com>
References: <20190813124513.31413-1-mripard@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190813124513.31413-1-mripard@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <mripard@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Young <sean@mess.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 13, 2019 at 6:45 AM Maxime Ripard <mripard@kernel.org> wrote:
>
> From: Maxime Ripard <maxime.ripard@bootlin.com>
>
> The RC controllers have a bunch of generic properties that are needed in a
> device tree. Add a YAML schemas for those.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  .../devicetree/bindings/media/rc.txt          | 118 +--------------
>  .../devicetree/bindings/media/rc.yaml         | 135 ++++++++++++++++++
>  2 files changed, 136 insertions(+), 117 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/rc.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
