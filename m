From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/2] ARM: dts: imx: Fix incorrect display nodes notation
Date: Thu, 5 Oct 2017 12:56:29 -0300
Message-ID: <CAOMZO5Ct=UTPXVgqk2RajPs-_9VwAa6mMTSO3hJn+54hEb2yjw@mail.gmail.com>
References: <1507213901-1349-1-git-send-email-marco.franchi@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1507213901-1349-1-git-send-email-marco.franchi-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Marco Antonio Franchi <marcofrk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 5, 2017 at 11:31 AM, Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org> wrote:
> The following build warnings are seen with W=1:
>
> Warning (unit_address_vs_reg): Node /display@di0 has a unit name, but no reg property
> Warning (unit_address_vs_reg): Node /display@di1 has a unit name, but no reg property
>
> Fix all these warnings by changing 'display@diX' to 'dispX'.
>
> Signed-off-by: Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>
> Acked-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

This aligns the dts with the binding doc and also fixes the warnings, great!
https://git.pengutronix.de/cgit/pza/linux/commit/?h=imx-drm/next&id=dbfdd153d4aefec13460c97475737e59af92d8e2

Reviewed-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
