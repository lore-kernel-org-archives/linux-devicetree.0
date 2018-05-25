From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 1/2] arm64: dts: Add GPIO and GPIO keys device nodes
Date: Fri, 25 May 2018 15:29:09 -0700
Message-ID: <20180525222909.sedcwcakptjoetma@localhost>
References: <fcea1874b6e3d0243684c133c7b34f2384341a32.1523846102.git.baolin.wang@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <fcea1874b6e3d0243684c133c7b34f2384341a32.1523846102.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, arnd@arndb.de, orsonzhai@gmail.com, zhang.lyra@gmail.com, devicetree@vger.kernel.org, arm@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, broonie@kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 16, 2018 at 10:40:03AM +0800, Baolin Wang wrote:
> This patch adds device nodes to enable one GPIO controller located on
> digital chip, 2 EIC (external interrupt controller) controllers loacted
> on PMIC and digital chip for Spreadtrum SC9860 platform.
> 
> Moreover this patch adds 3 GPIO keys relied on EIC controller to support
> power key and volume up/down keys.
> 
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>

Applied with "sprd:" added to the subject.


-Olof
