From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH] arm: dts: omap: fix OMAP3 CM-T3x OF graph video connectors
Date: Tue, 15 May 2018 11:11:27 -0700
Message-ID: <20180515181127.GU98604@atomide.com>
References: <20180508135930.5768-1-robh@kernel.org>
 <20180508135930.5768-6-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180508135930.5768-6-robh@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

* Rob Herring <robh@kernel.org> [180508 07:01]:
> The OMAP3 CM-T3x based boards define 2 /connector nodes for S-Video and
> DVI output. However, since they have the same node name, the S-Video
> connector overwritten. This leaves a dangling graph connection which
> gives the following warning:
> 
> arch/arm/boot/dts/omap3-sbc-t3517.dtb: Warning (graph_endpoint): /ocp@68000000/dss@48050000/encoder@48050c00/port/endpoint: graph connection to node '/connector/port/endpoint' is not bidirectional
> 
> Fix this by renaming the nodes to s-video-connector and dvi-connector.

Applying this too into omap-for-v4.18/dt-fixes.

Regards,

Tony
