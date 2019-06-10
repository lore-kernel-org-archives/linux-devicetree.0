MIME-Version: 1.0
Date: Mon, 10 Jun 2019 15:39:17 -0600
References: <20190603113250.4115-1-maxime.ripard@bootlin.com>
In-Reply-To: <20190603113250.4115-1-maxime.ripard@bootlin.com>
Message-ID: <CAL_JsqLiEv-buUNTTN8ZqZjHsLN3g=VwHvEBh+8c9D57Ro+A2A@mail.gmail.com>
Subject: Re: [PATCH] media: dt-bindings: Fix vendor-prefixes YAML
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, Linux Media Mailing List <linux-media@vger.kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Michael Tretter <m.tretter@pengutronix.de>
List-ID: <devicetree@vger.kernel.org>

On Mon, Jun 3, 2019 at 5:32 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> Commit 8df39e16877f ("media: dt-bindings: media: Add vendor prefix for
> allegro") introduced a new devicetree binding vendors, however with an
> improper syntax making the resulting YAML impossible to parse. Let's fix
> this.
>
> Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Michael Tretter <m.tretter@pengutronix.de>
> Fixes: 8df39e16877f ("media: dt-bindings: media: Add vendor prefix for allegro")
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>
