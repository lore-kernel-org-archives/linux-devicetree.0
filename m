From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3] ARM: shmobile: silk: initial device tree
Date: Mon, 3 Aug 2015 15:00:32 +0200
Message-ID: <CAMuHMdWT=nzsFuM-vfe5GoAtDE-AtW4LAZoEnBGGVZm54-mAzg@mail.gmail.com>
References: <201404250239.39150.sergei.shtylyov@cogentembedded.com>
	<2360526.88foRQAOiM@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <2360526.88foRQAOiM@wasted.cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>, Linux-sh list <linux-sh@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On Wed, Jul 29, 2015 at 12:14 AM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> --- /dev/null
> +++ renesas/arch/arm/boot/dts/r8a7794-silk.dts
> @@ -0,0 +1,51 @@

> +/ {
> +       model = "SILK";
> +       compatible = "renesas,silk", "renesas,r8a7794";

WARNING: DT compatible string "renesas,silk" appears un-documented --
check ./Documentation/devicetree/bindings/

Do you plan to update Documentation/devicetree/bindings/arm/shmobile.txt?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
