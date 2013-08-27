From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] s5p-jpeg: Add initial device tree support for
 S5PV210/Exynos4210 SoCs
Date: Tue, 27 Aug 2013 16:39:32 +0200
Message-ID: <521CBA24.8000703@samsung.com>
References: <1376856867-17771-1-git-send-email-s.nawrocki@samsung.com>
 <5217875F.2030307@samsung.com> <5217E615.9040101@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <5217E615.9040101@wwwdotorg.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Andrzej Pietrasiewicz <andrzej.p@samsung.com>, Pawel Moll <Pawel.Moll@arm.com>, Mark Rutland <Mark.Rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

On 08/24/2013 12:45 AM, Stephen Warren wrote:
> On 08/23/2013 10:01 AM, Sylwester Nawrocki wrote:
>> > On 08/18/2013 10:14 PM, Sylwester Nawrocki wrote:
>>> >> This patch enables the JPEG codec on S5PV210 and Exynos4210 SoCs. There are
>>> >> some differences in newer versions of the JPEG codec IP on SoCs like Exynos4x12
>>> >> and Exynos5 series and support for them will be added in subsequent patches.
>>> >>
>>> >> Cc: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
>>> >> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>> > 
>> > Could a DT maintainer review/Ack the binding in this patch ?
>
> The binding looks reasonable to me, so,
> Acked-by: Stephen Warren <swarren@nvidia.com>

Thanks Stephen, I've queued this for v3.13.

--
Regards,
Sylwester
