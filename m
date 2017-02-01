From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v7 1/2] dt-bindings: document renesas-ostm timer
Date: Wed, 1 Feb 2017 09:45:28 -0600
Message-ID: <20170201154528.r6r3walhou24wlpf@rob-hp-laptop>
References: <20170127200215.4894-1-chris.brandt@renesas.com>
 <20170127200215.4894-2-chris.brandt@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170127200215.4894-2-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 27, 2017 at 03:02:14PM -0500, Chris Brandt wrote:
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3:
> * changed ostm@fcfec000 to timer@fcfec000 in example
> * added power-domains in example
> v2:
> * remove sw implementation specific portions
> ---
>  .../devicetree/bindings/timer/renesas,ostm.txt     | 30 ++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/renesas,ostm.txt

I see this is already applied, but for the record:

Acked-by: Rob Herring <robh@kernel.org>
