From: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v7 1/4] MAINTAINERS: Add entry for APM X-Gene SoC PMU
 driver
Date: Wed, 06 Jul 2016 17:19:11 -0700
Message-ID: <1467850751.8360.56.camel@perches.com>
References: <1467850045-10584-1-git-send-email-ttnguyen@apm.com>
	 <1467850045-10584-2-git-send-email-ttnguyen@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467850045-10584-2-git-send-email-ttnguyen-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tai Nguyen <ttnguyen-qTEPVZfXA3Y@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2016-07-06 at 17:07 -0700, Tai Nguyen wrote:
> Signed-off-by: Tai Nguyen <ttnguyen-qTEPVZfXA3Y@public.gmane.org>
> ---
> =A0MAINTAINERS | 8 ++++++++
> =A01 file changed, 8 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
[]
> @@ -8593,6 +8593,14 @@ L:	linux-scsi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> =A0S:	Supported
> =A0F:	drivers/scsi/pm8001/
> =A0
> +PMU-XGENE
> +APPLIED MICRO (APM) X-GENE SOC PMU

One line section header please.

> +M:	Tai Nguyen <ttnguyen-qTEPVZfXA3Y@public.gmane.org>
> +S:	Supported
> +F:	drivers/perf/xgene_pmu.c
> +F:	Documentation/perf/xgene-pmu.txt
> +F:	Documentation/devicetree/bindings/perf/apm-xgene-pmu.txt
> +
> =A0POSIX CLOCKS and TIMERS
> =A0M:	Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
> =A0L:	linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
