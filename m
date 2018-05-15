From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH] arm: dts: omap: fix OF graph in omap3-devkit8000
Date: Tue, 15 May 2018 11:11:02 -0700
Message-ID: <20180515181102.GT98604@atomide.com>
References: <20180508135930.5768-1-robh@kernel.org>
 <20180508135930.5768-5-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180508135930.5768-5-robh@kernel.org>
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
> omap3-devkit8000-common.dtsi defines a graph connection for DVI, but
> then omap3-devkit8000-lcd-common.dtsi overrides that with a graph
> connection for the LCD as the same output signals are used. This
> leaves an incomplete graph as the TFP410 output has only half a
> connection. The result is the following warning:
> 
> arch/arm/boot/dts/omap3-devkit8000-lcd70.dtb: Warning (graph_endpoint): /encoder0/ports/port@0/endpoint: graph connection to node '/ocp@68000000/dss@48050000/port/endpoint' is not bidirectional
> 
> Fix this by defining multiple endpoints which is the correct way to show
> a 1 to many connection.

Applying into omap-for-v4.18/dt-fixes thanks.

Tony
