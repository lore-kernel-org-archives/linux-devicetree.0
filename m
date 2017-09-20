From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH v2] arm64: dts: foundation-v8: Enable PSCI mode
Date: Wed, 20 Sep 2017 10:42:52 +0100
Message-ID: <da8a0cf5-3c1e-1398-b5c3-ac489ae955fa@arm.com>
References: <20170918153832.16356-1-daniel.thompson@linaro.org>
 <20170919183204.12751-1-daniel.thompson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170919183204.12751-1-daniel.thompson@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Thompson <daniel.thompson@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Mark Rutland <mark.rutland@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@linaro.org
List-Id: devicetree@vger.kernel.org



On 19/09/17 19:32, Daniel Thompson wrote:
> Currently if the Foundation model is running ARM Trusted Firmware then
> the kernel, which is configured to use spin tables, cannot start secondary
> processors or "power off" the simulation.
> 
> After adding a couple of labels to the include file and splitting out the
> spin-table configuration into a header, we add a couple of new headers
> together with two new DTs (GICv2+PSCI and GICv3+PSCI).
> 
> The new GICv3+PSCI DT has been boot tested, the remaining three (two of
> which existed prior to this patch) have been "tested" by decompiling the
> blobs and comparing them against a reference.
> 

How different are these from the ones hosted in [1] ?

On argument is that we want to take the DTS out of device tree as
firmware is responsible for generating them. Alternatively, we may be
duplicating resulting in discrepancies over time by coping it into kernel.

Since users of ARM TF must be able to access these, I am not sure if it
makes sense to merge these. Or we remove it from ARM TF to avoid any
conflicts/discrepancies.

Thoughts ?

--
Regards,
Sudeep

[1] https://github.com/ARM-software/arm-trusted-firmware/tree/master/fdts
