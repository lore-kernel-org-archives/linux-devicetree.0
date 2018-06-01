From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 4/8] dt-bindings: gnss: add u-blox binding
Date: Fri, 1 Jun 2018 09:34:32 -0500
Message-ID: <CAL_JsqJrOysayG5g6cGbvMVmBxkrjkSuAs4qb=DyuoTPwcrWRQ@mail.gmail.com>
References: <20180601082259.17563-1-johan@kernel.org> <20180601082259.17563-5-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180601082259.17563-5-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Andreas Kemnade <andreas@kemnade.info>, Arnd Bergmann <arnd@arndb.de>, "H . Nikolaus Schaller" <hns@goldelico.com>, Pavel Machek <pavel@ucw.cz>, Marcel Holtmann <marcel@holtmann.org>, Sebastian Reichel <sebastian.reichel@collabora.co.uk>, Tony Lindgren <tony@atomide.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 1, 2018 at 3:22 AM, Johan Hovold <johan@kernel.org> wrote:
> Add binding for u-blox GNSS receivers.
>
> Note that the u-blox product names encodes form factor (e.g. "neo"),
> chipset (e.g. "8") and variant (e.g. "q"), but that only formfactor and
> chipset is used for the compatible strings (for now).
>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  .../devicetree/bindings/gnss/u-blox.txt       | 44 +++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.txt   |  1 +
>  2 files changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gnss/u-blox.txt

Reviewed-by: Rob Herring <robh@kernel.org>
