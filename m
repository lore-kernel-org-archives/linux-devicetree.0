From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v3 1/3] ARM: dts: imx: Pass empty memory size on board dts
Date: Mon, 5 Feb 2018 15:31:57 +0800
Message-ID: <20180205073156.GK31354@dragon>
References: <1516800134-5018-1-git-send-email-marcofrk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1516800134-5018-1-git-send-email-marcofrk@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marco Franchi <marcofrk@gmail.com>
Cc: robh+dt@kernel.org, LW@karo-electronics.de, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, festevam@gmail.com, Marco Franchi <marco.franchi@nxp.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 24, 2018 at 11:22:12AM -0200, Marco Franchi wrote:
> In preparation for removing 'reg = <0 0>;' from the dtsi SoC files, pass
> 'reg = <0 0 >;' to the dts/dtsi board files that do not pass the memory
> size.
> 
> Signed-off-by: Marco Franchi <marco.franchi@nxp.com>

Applied all, thanks.
