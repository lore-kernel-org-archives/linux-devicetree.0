From: Punit Agrawal <punit.agrawal-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCHv3 0/5] arm-cci400: PMU monitoring support on ARM64
Date: Wed, 11 Mar 2015 11:40:16 +0000
Message-ID: <9hhsidbyd7j.fsf@e105922-lin.cambridge.arm.com>
References: <1426000735-14375-1-git-send-email-suzuki.poulose@arm.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426000735-14375-1-git-send-email-suzuki.poulose-5wv7dgnIgG8@public.gmane.org>
	(Suzuki K. Poulose's message of "Tue, 10 Mar 2015 15:18:50 +0000")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Suzuki K. Poulose" <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Nicolas Pitre <nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

"Suzuki K. Poulose" <suzuki.poulose-5wv7dgnIgG8@public.gmane.org> writes:

> From: "Suzuki K. Poulose" <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>
>
> This series enables the PMU monitoring support for CCI400 on ARM64.
> The existing CCI400 driver code is a mix of PMU driver and the MCPM
> driver code. The MCPM driver is only used on ARM(32) and contains
> arm32 assembly and hence can't be built on ARM64. This patch splits
> the code to
>
>  - ARM_CCI400_PORT_CTRL driver - depends on ARM && V7
>  - ARM_CCI400_PMU driver
>
> Accessing the Peripheral ID2 register(PID2) on CCI-400, to detect
> the revision of the chipset, is a secure operation. Hence, it prevents
> us from running this on non-secure platforms. The issue is overcome by
> explicitly mentioning the revision number of the CCI PMU in the device tree
> binding. The device-tree binding has been updated with the new bindings.
>
> i.e,	arm-cci-400-pmu,r0 => revision 0
> 	arm-cci-400-pmu,r1 => revision 1
> 	arm-cci-400-pmu => (old) DEPRECATED
>
> The old binding has been DEPRECATED and must be used only on ARM32
> system with secure access. We don't have a reliable dynamic way to detect
> if the system is running secure. This series tries to use the best safe
> method by relying on the availability of MCPM(as it was prior to the series).
> It is upto the MCPM platform driver to decide, if the system is secure before
> it goes ahead and registers its drivers and pokes the CCI. This series doesn't
> address/solve the problem of MCPM. I will be happy to use a better approach,
> if there is any.
>
> Tested on (non-secure)TC2 and A53x2.
>

For the series,

Acked-by: Punit Agrawal <punit.agrawal-5wv7dgnIgG8@public.gmane.org>

Cheers,
Punit

[...]

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
