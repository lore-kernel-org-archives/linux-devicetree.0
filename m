From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 4/6] ARM: dts: mvebu: Add binding for mv98dx3236-soc-id
Date: Mon, 27 Feb 2017 09:00:25 -0600
Message-ID: <20170227150025.hpdwjhg2hollew2m@rob-hp-laptop>
References: <20170216085041.28337-1-chris.packham@alliedtelesis.co.nz>
 <20170216085041.28337-5-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170216085041.28337-5-chris.packham@alliedtelesis.co.nz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Gregory Clement <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 16, 2017 at 09:50:38PM +1300, Chris Packham wrote:
> The DFX server on the 98dx3236 and compatible SoCs has an ID register.
> Add documentation and a binding for this.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> 
> Notes:
>     Changes in v3:
>     - new, split from driver
> 
>  .../devicetree/bindings/arm/marvell/mv98dx3236-soc-id.txt  | 14 ++++++++++++++
>  arch/arm/boot/dts/armada-xp-98dx3236.dtsi                  |  5 +++++
>  2 files changed, 19 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/marvell/mv98dx3236-soc-id.txt

Acked-by: Rob Herring <robh@kernel.org>
