From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: renesas: ulcb: sound clock-frequency needs
 descending order
Date: Mon, 10 Jul 2017 10:28:58 +0200
Message-ID: <20170710082857.GD13680@verge.net.au>
References: <1499393373-11514-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <CAMuHMdXVoEHNfq_-JX5dodC4cCQzDx9BFjqR-j1kBF9yJTO8bA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdXVoEHNfq_-JX5dodC4cCQzDx9BFjqR-j1kBF9yJTO8bA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 10, 2017 at 10:08:25AM +0200, Geert Uytterhoeven wrote:
> On Fri, Jul 7, 2017 at 4:09 AM, Vladimir Barinov
> <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org> wrote:
> > From: Vladimir Barinov <vladimir.barinov+renesas-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
> >
> > It will be used ADG clock initial settings, and will be
> > sound codec's initial system clock which needs maximum clock frequency.
> > Thus, descending order is required.
> >
> > Signed-off-by: Vladimir Barinov <vladimir.barinov+renesas-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
> 
> Cfr. commit 5e2feac330953fe7 ("arm64: renesas: salvator-common: sound
> clock-frequency needs descending order")
> 
> Fixes: 9f22774c214ada7b ("arm64: dts: ulcb: add 12288000 for sound ADG")
> Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>

Thanks, I have applied the following as a fix for v4.13.

From: Vladimir Barinov <vladimir.barinov+renesas-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH] arm64: dts: renesas: ulcb: sound clock-frequency needs
 descending order

Correct order of sound clock frequencies for ULCB boards
used with r8a7795 and r8a7796 SoCs.

These sounds clock frequencies are used as the ADG clock (output clocks
for audio module) initial setting and sound codec's initial system clock
which needs the maximum clock frequency. Thus, descending order is
required.

Fixes: 9f22774c214ada7b ("arm64: dts: ulcb: add 12288000 for sound ADG")
Signed-off-by: Vladimir Barinov <vladimir.barinov+renesas-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
[simon: rewrote changelog]
Signed-off-by: Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
---
 arch/arm64/boot/dts/renesas/ulcb.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
index b5c6ee07d7f9..d1a3f3b7a0ab 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -281,7 +281,7 @@
 
 	/* audio_clkout0/1/2/3 */
 	#clock-cells = <1>;
-	clock-frequency = <11289600 12288000>;
+	clock-frequency = <12288000 11289600>;
 
 	status = "okay";
 
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
