From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCHv4 2/3] ARM: dts: socfpga: Fix SD card detect
Date: Wed, 22 Oct 2014 16:53:56 -0700
Message-ID: <CAD=FV=VaYzyqYf2Rm7=3Lp6zsYRjgurw+w3Y=D0zP2F6K_zmKQ@mail.gmail.com>
References: <1414004860-17645-1-git-send-email-dinguyen@opensource.altera.com>
	<1414004860-17645-3-git-send-email-dinguyen@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414004860-17645-3-git-send-email-dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, jh80-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org" <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, "s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dinh,

On Wed, Oct 22, 2014 at 12:07 PM,  <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org> wrote:
> From: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
>
> Without this patch, the booting the SOCFPGA platform would hang at the
> SDMMC driver loading. The issue, debugged by Doug Anderson, turned out
> to be that the GPIO bank used by the SD card-detect was not set to
> status="okay".
>
> Also update the cd-gpios to point to portb of the &gpio1 GPIO IP.
>
> Suggested-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Signed-off-by: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> ---
> v4: Use &gpio1 to set status="okay" and update cd-gpio=&portb
> v3: Correctly degugged the issue to be a gpio node not having status="okay"
> ---
>  arch/arm/boot/dts/socfpga_cyclone5_socdk.dts | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
