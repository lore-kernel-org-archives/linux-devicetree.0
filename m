From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2] arm64: dts: ls1028a: Fix CPU idle fail.
Date: Wed, 12 Jun 2019 13:58:53 +0800
Message-ID: <20190612054716.GA11086@dragon>
References: <20190517045753.3709-1-ran.wang_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190517045753.3709-1-ran.wang_1@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ran Wang <ran.wang_1@nxp.com>
Cc: Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, May 17, 2019 at 12:57:53PM +0800, Ran Wang wrote:
> PSCI spec define 1st parameter's bit 16 of function CPU_SUSPEND to
> indicate CPU State Type: 0 for standby, 1 for power down. In this
> case, we want to select standby for CPU idle feature. But current
> setting wrongly select power down and cause CPU SUSPEND fail every
> time. Need this fix.
> 
> Fixes: 8897f3255c9c ("arm64: dts: Add support for NXP LS1028A SoC")
> Signed-off-by: Ran Wang <ran.wang_1@nxp.com>

Applied, thanks.
