From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2 0/6] ARM: dts: Add MFC support for Exynos4
Date: Wed, 30 Jan 2013 10:00:00 +0100
Message-ID: <5108E110.3040503@samsung.com>
References: <1359529889-26318-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1359529889-26318-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, patches@linaro.org
List-Id: devicetree@vger.kernel.org

On 01/30/2013 08:11 AM, Sachin Kamat wrote:
> Changes since v1:
> Addressed comments from Sylwester
>   - Updated documentation
>   - Added 'status' to the nodes
>   - Updated Kconfig entry
> 
> This series is based on for-next branch of Kukjin Kim's tree.
> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> Sachin Kamat (6):
>   ARM: dts: Update MFC DT binding documentation
>   ARM: dts: Add MFC codec support for Exynos4 DT machines
>   ARM: dts: Add MFC codec support to SMDKV310 DT
>   ARM: dts: Add MFC codec support to Origen DT
>   ARM: dts: Add MFC codec entry to exynos4412-origen DT file
>   ARM: dts: Add MFC codec entry to exynos4412-smdk4412 DT file

Thanks Sachin. For the whole series:

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

I have also tested patch 2/6 on an Exynos4412 based board,
just added the mfc clock entries in the codec node.

--

Regards,
Sylwester
