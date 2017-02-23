From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v2 2/2] mfd: axp20x: Add support for dts property "xpowers,master-mode"
Date: Thu, 23 Feb 2017 11:57:54 +0800
Message-ID: <CAGb2v66=fipED2pDkHJWZG4RPVML+h8h7=n=M2y-5oW9xgu+uQ@mail.gmail.com>
References: <cover.1487791328.git.rask@formelder.dk> <ef82cd5bbea5a5eedcafd3f57e7b7409dd9b4b5e.1487791329.git.rask@formelder.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <ef82cd5bbea5a5eedcafd3f57e7b7409dd9b4b5e.1487791329.git.rask-SivP7zSAdNDZaaYASwVUlg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rask Ingemann Lambertsen <rask-SivP7zSAdNDZaaYASwVUlg@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 23, 2017 at 3:42 AM, Rask Ingemann Lambertsen
<rask-SivP7zSAdNDZaaYASwVUlg@public.gmane.org> wrote:
> commit b101829a029a ("mfd: axp20x: Fix AXP806 access errors on cold boot")
> was intended to fix the case where a board uses an AXP806 in slave mode,
> but the boot loader leaves it in master mode for lack of AXP806 support.
> But now the driver breaks on boards where the PMIC is operating in master
> mode. This patch lets the driver use the new device tree property
> "xpowers,master-mode" to set the correct operating mode for the board.
>
> Fixes: 8824ee857348 ("mfd: axp20x: Add support for AXP806 PMIC")
> Signed-off-by: Rask Ingemann Lambertsen <rask-SivP7zSAdNDZaaYASwVUlg@public.gmane.org>

Acked-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
