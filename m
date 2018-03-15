From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 3/3] arm64: dts: update the cpu idle node
Date: Thu, 15 Mar 2018 15:25:12 +0000
Message-ID: <346ad3d2-04e4-7df3-5187-36124b3c717b@arm.com>
References: <20180208075436.38443-1-ran.wang_1@nxp.com>
 <20180208075436.38443-3-ran.wang_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180208075436.38443-3-ran.wang_1@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ran Wang <ran.wang_1@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Leo Li <leoyang.li@nxp.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Yuantian Tang <andy.tang@nxp.com>
List-Id: devicetree@vger.kernel.org

(sorry for replying so late, just found this by accident when clearing
 old emails)

On 08/02/18 07:54, Ran Wang wrote:
> From: Yuantian Tang <andy.tang@nxp.com>
> 
> According to PSCI standard v0.2, for CPU_SUSPEND call, which is
> used by cpu idle framework, bit[16] of state parameter must be 0.
> So update bit[16] of property 'arm,psci-suspend-param', which is
> used as state parameter, to 0.
> 
This changelog makes zero sense to me.

1. PSCI specification makes no reference to "cpu idle framework".
   It's not a Linux specification to reference anything specific to
   Linux CPUIdle framework.

2. "for CPU_SUSPEND call,...bit[16] of state parameter must be 0."
   Where exactly to you see that ? Specification tells what value of
   0 or 1 in bit[16] means.

3. Is this retention state and doesn't need any save restore ? If not
   this change is wrong and will break if and when we use
   CPU_PM_CPU_IDLE_ENTER_RETENTION if this bit is not set.

-- 
Regards,
Sudeep
