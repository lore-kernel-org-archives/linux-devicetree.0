From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH v2] ARM: dts: vf610: fix missing irqs
Date: Mon, 30 Mar 2015 12:12:23 +0800
Message-ID: <20150330041222.GP28410@dragon>
References: <1427457881-14132-1-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1427457881-14132-1-git-send-email-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: kernel@pengutronix.de, maitysanchayan@gmail.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 27, 2015 at 01:04:41PM +0100, Stefan Agner wrote:
> While adding the MSCM interrupt router, all interrupts have been moved
> to vfxxx.dtsi again. However, some properties got lost. Readd the
> missing interrupt properties.
> 
> Fixes: 97e6466ab9d0 ("ARM: dts: vf610: add Miscellaneous System Control Module (MSCM)")
> Signed-off-by: Stefan Agner <stefan@agner.ch>

Applied, thanks.
