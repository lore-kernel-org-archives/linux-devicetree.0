From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: NSP: GPIO reboot open-source
Date: Thu, 16 Mar 2017 14:04:25 -0700
Message-ID: <20170316210425.3683-1-f.fainelli@gmail.com>
References: <1488409348-6371-1-git-send-email-jon.mason@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1488409348-6371-1-git-send-email-jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 1 Mar 2017 18:02:28 -0500, Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:
> The libgpio code pre-sets the GPIO values for the gpio-reset in the
> device tree. This results in the device being reset during bringup.
> To prevent this pre-setting, use the "open-source" flag in the device
> tree.
>
> Signed-off-by: Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Fixes: b1aaf88 ("ARM: dts: NSP: Add GPIO reboot method to bcm958625hr DTS file")
> Fixes: 10baed1 ("ARM: dts: NSP: Add GPIO reboot method to bcm958625xmc DTS file")
> Fixes: 088e3148 ("ARM: dts: NSP: Add new DT file for bcm958522er")
> Fixes: e3227c1 ("ARM: dts: NSP: Add new DT file for bcm958525er")
> Fixes: 2f8bc00 ("ARM: dts: NSP: Add new DT file for bcm958622hr")
> Fixes: d454c37 ("ARM: dts: NSP: Add new DT file for bcm958623hr")
> Fixes: f27eacf ("ARM: dts: NSP: Add new DT file for bcm988312hr")
> ---

Applied, thanks!
--
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
