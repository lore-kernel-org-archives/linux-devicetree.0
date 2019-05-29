From: Jakub Kicinski <jakub.kicinski@netronome.com>
Subject: Re: [PATCH net-next v2 2/2] net: mscc: ocelot: Hardware ofload for
 tc flower filter
Date: Wed, 29 May 2019 15:18:44 -0700
Message-ID: <20190529151802.19aa82a2@cakuba.netronome.com>
References: <1559125580-6375-1-git-send-email-horatiu.vultur@microchip.com>
 <1559125580-6375-3-git-send-email-horatiu.vultur@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559125580-6375-3-git-send-email-horatiu.vultur@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Horatiu Vultur <horatiu.vultur@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, "David S. Miller" <davem@davemloft.net>, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 29 May 2019 12:26:20 +0200, Horatiu Vultur wrote:
> +static int ocelot_flower_replace(struct tc_cls_flower_offload *f,
> +				 struct ocelot_port_block *port_block)
> +{
> +	struct ocelot_ace_rule *rule;
> +	int ret;
> +
> +	if (port_block->port->tc.block_shared)
> +		return -EOPNOTSUPP;

FWIW since you only support TRAP and DROP actions here (AFAICT) you
should actually be okay with shared blocks.  The problems with shared
blocks start when the action is stateful (like act_police), because we
can't share that state between devices.  But for most actions which just
maintain statistics, it's fine to allow shared blocks.  HTH
