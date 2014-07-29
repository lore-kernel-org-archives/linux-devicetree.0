From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 0/3] ARM: dts: Add TMU dt node and missing data for Exynos3250
Date: Wed, 30 Jul 2014 08:02:27 +0900
Message-ID: <53D82803.9060804@samsung.com>
References: <1406600232-31033-1-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1406600232-31033-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: kgene.kim@samsung.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux@arm.linux.org.uk, linux-doc@vger.kernel.org, t.figa@samsung.com, linux-kernel@vger.kernel.org, kyungmin.park@samsung.com, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 07/29/14 11:17, Chanwoo Choi wrote:
> This patchset add TMU (Thermal Management Unit) dt node and missing pinctrl
> property of uart0/1. Also, this patchset remove duplcate 'interrupt-parent'
> property for code clean.
>
> Chanwoo Choi (3):
>    ARM: dts: Add TMU dt node to monitor the temperature for Exynos3250
>    ARM: dts: Remove duplicate 'interrput-parent' property for Exynos3250
>    ARM: dts: Add missing pinctrl for uart0/1 for Exynos3250
>
>   arch/arm/boot/dts/exynos3250.dtsi | 15 +++++++++++++--
>   1 file changed, 13 insertions(+), 2 deletions(-)
>
Applied this whole series, thanks.

- Kukjin
