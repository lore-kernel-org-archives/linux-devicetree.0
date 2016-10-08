From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2] ARM64: dts: meson-gxbb-odroidc2: Enable USB Nodes
Date: Sat, 08 Oct 2016 09:12:49 -0700
Message-ID: <7hbmyues5a.fsf@baylibre.com>
References: <1475564803-9616-1-git-send-email-brian.kim@hardkernel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1475564803-9616-1-git-send-email-brian.kim-vC+yAUbXFBlQ0OI7PeSoCw@public.gmane.org>
        (Brian Kim's message of "Tue, 4 Oct 2016 16:06:43 +0900")
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Kim <brian.kim-vC+yAUbXFBlQ0OI7PeSoCw@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, moon.linux-vC+yAUbXFBlQ0OI7PeSoCw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Brian Kim <brian.kim-vC+yAUbXFBlQ0OI7PeSoCw@public.gmane.org> writes:

> Enable both gxbb USB controller and add a 5V regulator for the OTG port
> VBUS
>
> Signed-off-by: Brian Kim <brian.kim-vC+yAUbXFBlQ0OI7PeSoCw@public.gmane.org>
> ---
> This patch was written on Kevin Hilman's repository[1] and branch[2]:
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git
> [2] v4.8/integ

Applied to the v4.10/dt64 branch, and will be included shortly in the
integration branch.

Kevin
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
