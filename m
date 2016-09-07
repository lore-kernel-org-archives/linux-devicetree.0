From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 2/3] hwmon: xgene: Add hwmon driver
Date: Wed, 07 Sep 2016 23:41:44 +0200
Message-ID: <13081573.BbD3TmEU5Y@wuerfel>
References: <1469134557-26869-1-git-send-email-hotran@apm.com> <1469134557-26869-3-git-send-email-hotran@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1469134557-26869-3-git-send-email-hotran-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hoan Tran <hotran-qTEPVZfXA3Y@public.gmane.org>
Cc: Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Duc Dang <dhdang-qTEPVZfXA3Y@public.gmane.org>, lho-qTEPVZfXA3Y@public.gmane.org, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday, July 21, 2016 1:55:56 PM CEST Hoan Tran wrote:
> +               ctx->comm_base_addr = cppc_ss->base_address;
> +               if (ctx->comm_base_addr) {
> +                       ctx->pcc_comm_addr =
> +                                       acpi_os_ioremap(ctx->comm_base_addr,
> +                                                       cppc_ss->length);
> 

This causes the arm64 allmodconfig build to fail now, according to
kernelci:

      1  ERROR: "memblock_is_memory" [drivers/hwmon/xgene-hwmon.ko] undefined!

Should this perhaps call ioremap() or memremap() instead?

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
