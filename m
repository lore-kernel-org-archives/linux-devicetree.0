From: Arun Kumar K <arunkk.samsung@gmail.com>
Subject: Re: [PATCH v5] ARM: EXYNOS: Add MFC device tree support
Date: Tue, 23 Oct 2012 15:42:21 +0530
Message-ID: <CALt3h79k5XsAGM21oOOy0jDh47N8is7LF-bAGcH-PtjK6ekhUw@mail.gmail.com>
References: <1348765784-7508-1-git-send-email-arun.kk@samsung.com>
	<1348765784-7508-2-git-send-email-arun.kk@samsung.com>
	<50864174.3020508@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <50864174.3020508@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: sw0312.kim@samsung.com
Cc: Arun Kumar K <arun.kk@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, k.debski@samsung.com, jtp.park@samsung.com, thomas.abraham@linaro.org, k.lewandowsk@samsung.com, s.nawrocki@samsung.com, ch.naveen@samsung.com, joshi@samsung.com
List-Id: devicetree@vger.kernel.org

Hi Seungwoo Kim,

Thank you for the review.

>> +
>> +     /* Reserve memory for MFC only if it's available */
>> +     mfc_mem.compatible = "samsung,mfc-v6";
>> +     if (of_scan_flat_dt(s5p_fdt_find_mfc_mem, &mfc_mem))
>
> of_scan_flat_dt() is called but it does not have __init on its
> definition. So this causes section mismatch.
>

The function of_scan_flat_dt is having __init in its definition.
I hope you meant the function s5p_fdt_find_mfc_mem which is not
defined with __init and causing section mismatch.
I will correct this and post an updated patch.

Regards
Arun
