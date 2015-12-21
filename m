From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/2] ARM: dts: TS-4800: drop uart rts/cts pin reservations
Date: Mon, 21 Dec 2015 20:59:02 +0800
Message-ID: <20151221125902.GJ4703@tiger>
References: <1450387013-3532-1-git-send-email-damien.riegel@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1450387013-3532-1-git-send-email-damien.riegel@savoirfairelinux.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Damien Riegel <damien.riegel@savoirfairelinux.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, kernel@savoirfairelinux.com
List-Id: devicetree@vger.kernel.org

On Thu, Dec 17, 2015 at 04:16:52PM -0500, Damien Riegel wrote:
> These pins are actually not routed for UARTs, they should not be
> reserved.
> 
> Signed-off-by: Damien Riegel <damien.riegel@savoirfairelinux.com>

Applied both, thanks.
