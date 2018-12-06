From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/2] arm64: dts: ls1088a: Move fsl-mc node
Date: Thu, 6 Dec 2018 11:20:30 +0800
Message-ID: <20181206032028.GF3987@dragon>
References: <1543941180-5147-1-git-send-email-ruxandra.radulescu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1543941180-5147-1-git-send-email-ruxandra.radulescu@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ioana Ciocoi Radulescu <ruxandra.radulescu@nxp.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 04, 2018 at 04:33:06PM +0000, Ioana Ciocoi Radulescu wrote:
> The fsl-mc node should sit under the soc node, so move it to
> its proper location.
> 
> Fixes: ac7c9ff741fb ("arm64: dts: ls1088a: add fsl-mc hardware resource manager node")
> 
> Signed-off-by: Ioana Radulescu <ruxandra.radulescu@nxp.com>

Applied both, thanks.
