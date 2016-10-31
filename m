From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 5/5] irqchip: st: Remove obsolete platforms from dt
 binding doc
Date: Mon, 31 Oct 2016 09:06:38 +0000
Message-ID: <20161031090638.GA16442@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1477065443-10668-1-git-send-email-patrice.chotard@st.com>
 <1477065443-10668-6-git-send-email-patrice.chotard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1477065443-10668-6-git-send-email-patrice.chotard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: patrice.chotard-qxv4g6HH51o@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 21 Oct 2016, patrice.chotard-qxv4g6HH51o@public.gmane.org wrote:

> From: Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>
> 
> STiH415/6 SoC support is being removed from the kernel.
> This patch updates the sti irchip and removes
> references to these obsolete platforms.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>
> Cc: <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
> Cc: <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
> Cc: <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
> ---
>  .../devicetree/bindings/interrupt-controller/st,sti-irq-syscfg.txt  | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Acked-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
