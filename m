From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v7 2/2] mfd: syscon: Add hardware spinlock support
Date: Thu, 11 Jan 2018 15:22:19 +0000
Message-ID: <20180111152219.yzit67dzdshi3cxs@dell>
References: <29fa88f883dae4c1f8a3acb2656cbd7c5a539d40.1514180039.git.baolin.wang@linaro.org>
 <a878ad35d9f38c58d34dac0b331dca029b61a9b8.1514180039.git.baolin.wang@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <a878ad35d9f38c58d34dac0b331dca029b61a9b8.1514180039.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>
Cc: arnd@arndb.de, robh+dt@kernel.org, mark.rutland@arm.com, broonie@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 25 Dec 2017, Baolin Wang wrote:

> Some system control registers need hardware spinlock to synchronize
> between the multiple subsystems, so we should add hardware spinlock
> support for syscon.
> 
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
> Changes since v6:
>  - Treat hwlock id 0 as valid for regmap.
> 
> Changes since v5:
>  - Fix the case that hwspinlock is not enabled.
> 
> Changes since v4:
>  - Add one exapmle to show how to add hwlock.
>  - Fix the coding style issue.
> 
> Changes since v3:
>  - Add error handling for of_hwspin_lock_get_id()
> 
> Changes since v2:
>  - Add acked tag from Rob.
> 
> Changes since v1:
>  - Remove timeout configuration.
>  - Modify the binding file to add hwlocks.
> ---
>  Documentation/devicetree/bindings/mfd/syscon.txt |    8 ++++++++
>  drivers/mfd/syscon.c                             |   19 +++++++++++++++++++
>  2 files changed, 27 insertions(+)

Applied, thanks.

-- 
Lee Jones
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
