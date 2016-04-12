From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/3] ARM: dts: vf-colibri: alias the primary FEC as
 ethernet0
Date: Tue, 12 Apr 2016 13:55:41 +0800
Message-ID: <20160412055541.GB23166@tiger>
References: <1459577621-3160-1-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1459577621-3160-1-git-send-email-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: kernel@pengutronix.de, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Apr 01, 2016 at 11:13:39PM -0700, Stefan Agner wrote:
> The Vybrid based Colibri modules provide a on-module PHY which is
> connected to the second FEC instance FEC1. Since the on-module
> Ethernet port is considered as primary ethernet interface, alias
> fec1 as ethernet0. This also makes sure that the first MAC address
> provided by the boot loader gets assigned to the FEC instance used
> for the on-module PHY.
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>

Applied all, thanks.
