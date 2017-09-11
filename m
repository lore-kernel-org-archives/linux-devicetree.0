From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH v2 0/2] Renesas R8A77970 CPG/MSSR clock support
Date: Mon, 11 Sep 2017 16:38:43 +0200
Message-ID: <CAMuHMdUy_UGZsa87e-=SuYutt5sXd4ZTiZKLfLGfD2css3RPcw@mail.gmail.com>
References: <20170908213418.823028011@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170908213418.823028011-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On Fri, Sep 8, 2017 at 11:34 PM, Sergei Shtylyov
<sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org> wrote:
>    Here's the set of 2 patches against the 'clk-next' branch of CLK group's
> 'linux.git' repo.

Thank you, looks good!

> As the DT patches in the R8A77970/Eagle board support series
> depend on the patch #1 of this series, it might make sense to merge this patch
> to the 'renesas.git' repo as well...
>
> [1/2] dt-bindings: clock: add R8A77970 CPG core clock definitions

The modern way to avoid this dependency is to use hardcoded numbers in
the initial submission of the DTS, cfr.
https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git/commit/?h=arm64-dt-for-v4.15&id=d917e0b24811eadeba419ba7318b967ee15933b3

After the definitions have hit upstream, you can replace the hardcoded
numbers by symbols, cfr.
https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/commit/?h=topic/r8a77995-integration&id=d3f6987db28a4657bf3304eeeb8e2cd8dd510ad0
https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/commit/?h=topic/r8a77995-integration&id=81426223583d5575767c77684be28c40034785bd

So I don't think Simon will merge the core clock definitions patch, unless
you plan to submit a full DTS describing the whole SoC in the initial
submissiong.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
