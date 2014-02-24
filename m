From: Matt Porter <mporter@linaro.org>
Subject: Re: [PATCH v2] ARM: dts: Leave sdio1 as disabled on bcm28155-ap
Date: Mon, 24 Feb 2014 15:11:33 -0500
Message-ID: <20140224201133.GX5038@beef>
References: <1391556460-24218-1-git-send-email-tim.kryger@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1391556460-24218-1-git-send-email-tim.kryger@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tim Kryger <tim.kryger@linaro.org>
Cc: Christian Daudt <bcm@fixthebug.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Broadcom Kernel Feedback List <bcm-kernel-feedback-list@broadcom.com>, Device Tree List <devicetree@vger.kernel.org>, ARM Linux List <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 04, 2014 at 03:27:40PM -0800, Tim Kryger wrote:
> The sdio1 interface pins are routed to an unpopulated daughter card
> connector on the bcm28155-ap board.  Thus there is no need to mark
> this interface as enabled.
> 
> Signed-off-by: Tim Kryger <tim.kryger@linaro.org>
> Reviewed-by: Matt Porter <matt.porter@linaro.org>

Applied to mach-bcm armsoc/for-3.15/dt

-Matt
