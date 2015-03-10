From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 4/5] arm-cci: Split the code for PMU vs driver support
Date: Tue, 10 Mar 2015 16:24:50 +0000
Message-ID: <54FF1AD2.8090105@arm.com>
References: <1426000735-14375-1-git-send-email-suzuki.poulose@arm.com> <1426000735-14375-5-git-send-email-suzuki.poulose@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426000735-14375-5-git-send-email-suzuki.poulose-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Suzuki K. Poulose" <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Nicolas Pitre <nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Punit Agrawal <Punit.Agrawal-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, "nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 10/03/15 15:18, Suzuki K. Poulose wrote:
> From: "Suzuki K. Poulose" <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>
>
> This patch separates the PMU driver code from the low level
> CCI driver code and enables the PMU driver for ARM64.
>
> Introduces config options for both.
>
>   ARM_CCI400_PORT_CTRL	- controls the low level driver code for
> 			  CCI400 ports.
>   ARM_CCI400_PMU 	- controls the PMU driver code
>   ARM_CCI400_COMMON 	- Common defintions for CCI400
>
> This patch also changes:
>   ARM_CCI - common code for probing the CCI devices. This can be
>     used for adding support for newer CCI versions(e.g, CCI-500).
>
> Changes since V2:
>    - Make ARM_CCI400_PMU default y (Suggested-by: Sudeep Holla)
> Changes since V1 (Suggestions-by: Nicolas Pitre):
>    - Renames
> 	CONFIG_ARM_CCI400_MCPM => CONFIG_ARM_CCI400_PORT_CTRL
> 	CCI400_MCPM_PORTS_DATA => CCI400_PORTS_DATA
>    - Select ARM_CCI400_COMMON for ARM_CCI400_PORT_CTRL
>    - Better documentation in the git commit log about the ARM_CCI config.
>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
> Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>

For vexpress changes,
Acked-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>

Regards,
Sudeep

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
