From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/4] ARM: STi: add stid127 soc support
Date: Thu, 30 Jan 2014 19:39:08 +0100
Message-ID: <201401301939.08302.arnd@arndb.de>
References: <1391093744-19905-1-git-send-email-patrice.chotard@st.com> <1391093744-19905-2-git-send-email-patrice.chotard@st.com> <201401301935.16463.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201401301935.16463.arnd-r2nGTMty4D4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Patrice CHOTARD <patrice.chotard-qxv4g6HH51o@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stuart Menefy <stuart.menefy-qxv4g6HH51o@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>, maxime.coquelin-qxv4g6HH51o@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 30 January 2014, Arnd Bergmann wrote:
> On Thursday 30 January 2014, Patrice CHOTARD wrote:
> > From: Alexandre TORGUE <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
> > 
> > This patch adds support to STiD127 SoC.
> > The main adaptation is the L2 cache way size compare to STiH41x SoCs.
> > 
> > Signed-off-by: alexandre torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
> > Signed-off-by: Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>
> > ---
> >  arch/arm/mach-sti/board-dt.c |    6 ++++++
> >  1 file changed, 6 insertions(+)
> 
> Wouldn't it be better to read this value from the l2 cache
> controller node? I'd assume there might be more SoCs that
> will need a similar change, so it's better to come up with
> a solution that doesn't involve changing the kernel every
> time.

Actually reading the code in this file shows that the L2 cache
initialization is the only nonstandard thing in there. We should
really find a way to get rid of the entire function.

Sorry if I missed the initial review, but can you explain
why this is needed to start with?

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
