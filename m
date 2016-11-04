From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 6/6] ARM: dts: rockchip: add rockchip RK1108 Evaluation board
Date: Fri, 04 Nov 2016 12:17:11 +0100
Message-ID: <2909103.zaARAZdmtv@phil>
References: <1478175975-11779-1-git-send-email-andy.yan@rock-chips.com> <3057904.hZPZRUIUZe@phil> <ce6e9d62-75e5-60bc-2775-507aa326e3a2@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <ce6e9d62-75e5-60bc-2775-507aa326e3a2-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Freitag, 4. November 2016, 18:54:35 CET schrieb Andy Yan:
> Hi Heiko:
> 
> On 2016年11月04日 18:03, Heiko Stuebner wrote:
> > Am Donnerstag, 3. November 2016, 20:43:59 CET schrieb Andy Yan:
> >> RK1108EVB is designed by Rockchip for CVR field.
> >> This patch add basic support for it, which can boot with
> >> initramfs into shell.
> >> 
> >> Signed-off-by: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> > 
> > looks good, the only thing I can also change myself is moving the board in
> > the rockchip.txt to the block of Rockchip boards (i.e. sorting by
> > manufacturer and board name).
> > 
> > 
> > Heiko
> 
>      You mean it's better to put it between "Rockchip RK3368 evb" and
> "Rockchip PX5 Evaluation board"? if so, I will change it in next version.

yep, that is the location I also would've moved it to :-) .

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
