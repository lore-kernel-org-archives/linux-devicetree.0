From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: da850: move spi0_cs3_pin pinconf node
Date: Thu, 30 Mar 2017 17:22:41 +0530
Message-ID: <7416fb5e-d949-fdb6-1ce0-2c3033d3bc76@ti.com>
References: <1490663566-23062-1-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1490663566-23062-1-git-send-email-david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 28 March 2017 06:42 AM, David Lechner wrote:
> This moves the spi0_cs3_pin pinconf node from the LEGO EV3 file to the
> common DA850 include file. This node is applicable to any board, and
> therefore belongs in the common file.
> 
> Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>

Applied for v4.12

Thanks,
Sekhar

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
