From: Andy Gross <andy.gross@linaro.org>
Subject: Re: [PATCH v2] ARM: dts: msm8974: castor: Fix typo and add startup
 delay in touchscreen node
Date: Thu, 15 Mar 2018 00:21:02 -0500
Message-ID: <20180315051936.GC5910@hector.attlocal.net>
References: <20180312160734.5606-1-ctatlor97@gmail.com>
 <20180313164638.7211-1-ctatlor97@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180313164638.7211-1-ctatlor97@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Craig Tatlor <ctatlor97@gmail.com>
Cc: David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 13, 2018 at 04:46:38PM +0000, Craig Tatlor wrote:
> The compatible string was mistakenly pulled from the downstream tree and the
> startup delay property is needed to prevent io errors on initial page select.
> 
> Signed-off-by: Craig Tatlor <ctatlor97@gmail.com>

Thanks for the patch.  I'll add Bjorn's reviewed-by and apply it.

Regards,
Andy
