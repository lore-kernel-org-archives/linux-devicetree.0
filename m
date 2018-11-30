From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] ARM: dts: aspeed: add missing memory unit-address
Date: Fri, 30 Nov 2018 15:20:40 -0800
Message-ID: <20181130232040.z4i4sm5dsycxbmlu@localhost>
References: <20181130015251.20754-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20181130015251.20754-1-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, arm@kernel.org, Joel Stanley <joel@jms.id.au>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 29, 2018 at 07:52:51PM -0600, Rob Herring wrote:
> The base aspeed-g5.dtsi already defines a '/memory@80000000' node, so
> '/memory' in the board files create a duplicate node. We're probably
> getting lucky that the bootloader fixes up the memory node that the
> kernel ends up using. Add the unit-address so it's merged with the base
> node.
> 
> Found with DT json-schema checks.
> 
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-aspeed@lists.ozlabs.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Might be better to just remove the node altogether from the SoC dtsi 
> file. It's only saving the device_type definition.

Since I'm sweeping DT pull requests right now, and this is pretty
straightforward, I've applied it to next/dt directly.


-Olof
