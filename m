From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 1/2] of: base: add support to get the number of cache
 levels
Date: Tue, 10 Jan 2017 11:56:54 +0000
Message-ID: <bd0ced47-8d29-b6f6-f818-4e6d191ce383@arm.com>
References: <1484048479-19767-1-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1484048479-19767-1-git-send-email-sudeep.holla@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@arm.com>, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Tan Xiaojun <tanxiaojun@huawei.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org



On 10/01/17 11:41, Sudeep Holla wrote:
> It is useful to have helper function just to get the number of cache
> levels for a given logical cpu. This patch adds the support for the
> same.
> 
> It will be used on ARM64 platform where the device tree provides the
> information for the additional non-architected/transparent/external
> last level caches that are not integrated with the processors.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  drivers/of/base.c  | 22 ++++++++++++++++++++++
>  include/linux/of.h |  1 +
>  2 files changed, 23 insertions(+)
> 

I seem to have missed to generate patch after I fixed the build error.
I will send updated version of this patch.

-- 
Regards,
Sudeep
