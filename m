From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 1/6] dt-bindings: watchdog: Add YAML schemas for the
 generic watchdog bindings
Date: Mon, 19 Aug 2019 14:04:45 -0500
Message-ID: <CAL_Jsq+jb+jVLuXeEDVwu19_4YinZEyD9Q5-=-ZGS7YoCrf=2Q@mail.gmail.com>
References: <20190819182039.24892-1-mripard@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190819182039.24892-1-mripard@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <mripard@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 19, 2019 at 1:20 PM Maxime Ripard <mripard@kernel.org> wrote:
>
> From: Maxime Ripard <maxime.ripard@bootlin.com>
>
> The watchdogs have a bunch of generic properties that are needed in a
> device tree. Add a YAML schemas for those.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>
> ---
>
> Changes from v1:
>   - New patch
> ---
>  .../bindings/watchdog/watchdog.yaml           | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/watchdog.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
