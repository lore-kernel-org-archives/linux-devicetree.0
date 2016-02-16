From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 02/06] devicetree: bindings: R-Car Gen2 CMT0 and CMT1 bindings
Date: Tue, 16 Feb 2016 14:11:52 +0100
Message-ID: <CAMuHMdVEPeEd3cTWWd-a_6k7MgtcGiiHdyMLZ1yXoWQpsH_URg@mail.gmail.com>
References: <20160216071722.25461.61862.sendpatchset@little-apple>
	<20160216071741.25461.54191.sendpatchset@little-apple>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20160216071741.25461.54191.sendpatchset@little-apple>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Magnus Damm <magnus.damm@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-renesas-soc@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>, Thomas Gleixner <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 16, 2016 at 8:17 AM, Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> Add documentation for new separate CMT0 and CMT1 DT compatible strings
> for R-Car Gen2. These compat strings allow us to enable CMT1-specific
> features in the driver. The old compat strings will be deprecated in
> the not so distant future.
>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>
>  Changes since V2:
>  - Added Acked-by from Rob
>  - Removed Tested-by tag from DT binding patch - duh!
>
>  Changes since V1:
>  - Added Acked-by and Tested-by from Geert
>  - Added Acked-by from Laurent
>
>  Documentation/devicetree/bindings/timer/renesas,cmt.txt |    3 +++
>  1 file changed, 3 insertions(+)
>
> --- 0002/Documentation/devicetree/bindings/timer/renesas,cmt.txt
> +++ work/Documentation/devicetree/bindings/timer/renesas,cmt.txt        2015-09-17 17:26:57.440513000 +0900
> @@ -36,6 +36,9 @@ Required Properties:
>                 (CMT1 on sh73a0 and r8a7740)
>                 This is a fallback for the above renesas,cmt-48-* entries.
>
> +    - "renesas,cmt0-rcar-gen2" for 32-bit CMT0 devices included in R-Car Gen2.
> +    - "renesas,cmt1-rcar-gen2" for 48-bit CMT1 devices included in R-Car Gen2.

(advancing a few months always means more comments ;-)

I'm wondering whether we should use e.g. "renesas,rcar-gen2-cmt0" instead?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
