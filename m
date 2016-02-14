From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/2] ARM: dts: vf610twr: assign Ethernet clock explicitly
Date: Sun, 14 Feb 2016 15:49:16 +0800
Message-ID: <20160214074916.GN6756@tiger>
References: <1455148946-26903-1-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1455148946-26903-1-git-send-email-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: kernel@pengutronix.de, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 10, 2016 at 04:02:25PM -0800, Stefan Agner wrote:
> Assign Ethernet clock parents explicitly. The VF610 Tower Board
> uses the external Ethernet clock input which is connected to
> a 50MHz clock.
> 
> The Vybrid SoC has two ethernet interfaces (fec0 and fec1) which
> use the same clock source (VF610_CLK_ENET). Therefore this parent
> configuration affects multiple consumer devices and need to be
> specified in the clock provider node.
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>

Applied both, thanks.
