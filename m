From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v3] arm64: dts: renesas: v3msk: add DU/LVDS/HDMI support
Date: Tue, 1 May 2018 08:00:05 +0200
Message-ID: <20180501060005.sgzgdfqt6t4smco2@verge.net.au>
References: <23a6ac28-134b-b5dd-69a7-910774c4b8c1@cogentembedded.com>
 <d18c4314-e6ad-1558-30fb-1a32397494b6@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <d18c4314-e6ad-1558-30fb-1a32397494b6@cogentembedded.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 23, 2018 at 11:45:49PM +0300, Sergei Shtylyov wrote:
> Define the V3M Starter Kit board dependent part of the DU and LVDS device
> nodes. Also add the device nodes for Thine THC63LVD1024 LVDS decoder and
> Analog Devices ADV7511W HDMI transmitter...
> 
> Based on the original (and large) patch by Vladimir Barinov.
> 
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> This patch is against the 'renesas-devel-20180423-v4.17-rc2' tag of Simon
> Horman's 'renesas.git' repo. It requires the Thine THC63LVD1024 driver in
> order to work (the same as the Eagle HDMI patch by Jacopo/Niklas).
> 
> Changes in version 3:
> - added  Thine THC63LVD1024 device node, updating the respected endpoints;
> - merged the I2C pins subnode to the main PFC device node;
> - renamed the regulators;

Thanks, applied.
