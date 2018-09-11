From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH] dts: juno: Enable coresight tmc scatter gather in ETR
Date: Tue, 11 Sep 2018 11:35:09 +0100
Message-ID: <20180911103509.GA770@e107155-lin>
References: <1536655641-26192-1-git-send-email-suzuki.poulose@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1536655641-26192-1-git-send-email-suzuki.poulose@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Suzuki K Poulose <suzuki.poulose@arm.com>, linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@arm.com>, linux-kernel@vger.kernel.org, mathieu.poirier@linaro.org, coresight@lists.linaro.org, robert.walker@arm.com, devicetree@vger.kernel.org, robh@kernel.org, Mike Leach <mike.leach@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>, Lorenzo Pierlisi <lorenzo.pieralisi@arm.com>
List-Id: devicetree@vger.kernel.org

On 11/09/18 09:47, Suzuki K Poulose wrote:
> We do not enable scatter-gather mode in the TMC-ETR by default
> to prevent malfunctioning of systems where the ETR may not be
> properly connected to the memory subsystem to allow for simultaneous
> READ/WRITE transactions when used in SG mode. Instead we whitelist
> the platforms where we know that it is safe to use the mode.
>
> All revisions of Juno have a proper ETR connection and hence
> white list them.
>

Applied conditionally, this conflicts with the patch Mathieu has in his
branch. He needs to drop that so that I can take both of them via ARM SoC.

--
Regards,
Sudeep
