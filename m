From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] arm64: dts: NS2: reserve memory for Nitro firmware
Date: Mon, 12 Dec 2016 18:15:45 -0800
Message-ID: <20161213021545.15531-1-f.fainelli@gmail.com>
References: <1480979542-26871-1-git-send-email-jon.mason@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1480979542-26871-2-git-send-email-jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 5 Dec 2016 18:12:21 -0500, Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:
> Nitro firmware is loaded into memory by the bootloader at a specific
> location. Set this memory range aside to prevent the kernel from using
> it.
>
> Signed-off-by: Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> ---

Applied, thanks!
--
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
