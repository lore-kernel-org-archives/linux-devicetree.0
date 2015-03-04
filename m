From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 1/3] devicetree: bindings: Document qcom,msm-id and qcom,board-id
Date: Wed, 04 Mar 2015 22:19:22 +0100
Message-ID: <2483237.3YTlNsnOp7@wuerfel>
References: <1425503602-24916-1-git-send-email-galak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1425503602-24916-1-git-send-email-galak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, arm@kernel.org, devicetree@vger.kernel.org, heiko@sntech.de
List-Id: devicetree@vger.kernel.org

On Wednesday 04 March 2015 15:13:20 Kumar Gala wrote:
> The top level qcom,msm-id and qcom,board-id are utilized by bootloaders
> on Qualcomm MSM platforms to determine which device tree should be
> utilized and passed to the kernel.
> 
> Cc: <devicetree@vger.kernel.org>
> Signed-off-by: Kumar Gala <galak@codeaurora.org>

This seems to duplicate the root-node compatible strings for no particular
reason, with a less flexible format. I think it would be better to fix
the boot loader.

	Arnd
