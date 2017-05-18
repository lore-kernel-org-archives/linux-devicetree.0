From: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH v10 2/3] fpga manager: Add altera-ps-spi driver for
 Altera FPGAs
Date: Thu, 18 May 2017 22:59:35 +0200
Message-ID: <20170518225935.7948d7a5@crub>
References: <1495045422-19183-1-git-send-email-agust@denx.de>
        <1495045422-19183-2-git-send-email-agust@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1495045422-19183-2-git-send-email-agust-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, joshua.clayton-DelKAr4a3LpBDgjK7y7TUQ@public.gmane.org, bst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 17 May 2017 20:23:41 +0200
Anatolij Gustschin agust-ynQEQJNshbs@public.gmane.org wrote:
...
>+	if (!IS_ERR(conf->confd)) {
>+		if (!gpiod_get_raw_value_cansleep(conf->confd)) {
>+			dev_err(&mgr->dev, "CONF_DONE is low!\n");

as we agreed in the another thread, gpiod_get_value_cansleep()
should be used here. Another change: s/low/inactive/

--
Anatolij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
