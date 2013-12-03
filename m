From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/1] dt: binding: reword PowerPC 8xxx GPIO documentation
Date: Tue, 3 Dec 2013 00:02:38 -0600
Message-ID: <CAL_JsqL=GNLCv9uY5q5+oLP4WZ0vn5XUt110QAn=GDUZrfXGfw@mail.gmail.com>
References: <1384983293-11002-1-git-send-email-gsi@denx.de>
	<1385023304-15396-1-git-send-email-gsi@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1385023304-15396-1-git-send-email-gsi-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "Rob Herring@" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 21, 2013 at 2:41 AM, Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org> wrote:
> re-format and re-word the device tree binding documentation for MPC8xxx
> and compatibles, reference the common document for interrupt controllers
> and remove outdated duplicate SoC specific information
>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: Rob Herring@ <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> Cc: Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>
> Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Cc: <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
> Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Signed-off-by: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
> ---
>
> changes in v2:
> - s/CHIP/chip/ in 'compatible', s/and/or/ for the
>   list of strings to use in 'compatible'
> - "should be two" and "s/specific/available/ set of
>   trigger conditions" in '#interrupt-cells'
> - IRQ controller properties added to the 'gpio1' example node
>   as it is referenced as one from 'funkyfpga'
> ---
>  .../devicetree/bindings/gpio/8xxx_gpio.txt         |   66 ++++++++++++--------
>  1 file changed, 40 insertions(+), 26 deletions(-)

Applied for 3.13.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
