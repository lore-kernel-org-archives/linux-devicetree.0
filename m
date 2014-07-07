From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/2] devicetree: Add Zynq GPIO devicetree bindings documentation
Date: Mon, 7 Jul 2014 16:53:19 +0200
Message-ID: <CACRpkdYZ8gQ_-z3Ue3WZZ4FiV8dhw_BZez2-PLpeiBTs-UnNFQ@mail.gmail.com>
References: <1403091577-10232-1-git-send-email-harinik@xilinx.com>
	<1403091577-10232-2-git-send-email-harinik@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1403091577-10232-2-git-send-email-harinik@xilinx.com>
Sender: linux-doc-owner@vger.kernel.org
To: Harini Katakam <harinik@xilinx.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, Michal Simek <michal.simek@xilinx.com>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Harini Katakam <harinikatakamlinux@gmail.com>, Harini Katakam <harini.katakam@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 18, 2014 at 1:39 PM, Harini Katakam <harinik@xilinx.com> wrote:

> From: Harini Katakam <harini.katakam@xilinx.com>
>
> Add gpio-zynq bindings documentation.
>
> Signed-off-by: Harini Katakam <harinik@xilinx.com>
> Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
> ---
>
> v2 changes:
> Improve description.
(...)
> +- #gpio-cells          : Should be two. First cell is used to mention
> +                         pin number.

Don't call this "pin number", call it "GPIO line number".

Yours,
Linus Walleij
