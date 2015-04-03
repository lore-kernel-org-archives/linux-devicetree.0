From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v2] coresight: adding basic support for Spreadtrum SC9836
Date: Fri, 3 Apr 2015 12:51:42 -0700
Message-ID: <20150403195142.GR23023@localhost>
References: <1427287931-9363-1-git-send-email-zhang.chunyan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1427287931-9363-1-git-send-email-zhang.chunyan@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chunyan Zhang <zhang.chunyan@linaro.org>
Cc: arm@kernel.org, arnd@arndb.de, mathieu.poirier@linaro.org, will.deacon@arm.com, mark.rutland@arm.com, robh+dt@kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, catalin.marinas@arm.com, kaixu.xia@linaro.org, zhizhou.zhang@spreadtrum.com, orsonzhai@gmail.com, zhang.lyra@gmail.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 25, 2015 at 08:52:11PM +0800, Chunyan Zhang wrote:
> Support only for ETF, FUNNEL, STM are included currently.
> Support for ETM, TPIU and the replicator linked to it are not included in
> this version patch.
> 
> Signed-off-by: Chunyan Zhang <zhang.chunyan@linaro.org>
> ---
> Change for v2:
>  - Corrected the TMC whose space is wrongly used as ETB in v1.
>  - Removed "coresight-default-sink" from the DT.
> ---

Appled but with subject:

arm64: dts: sprd: adding coresight entries to Spreadtrum SC9836                 



-Olof
