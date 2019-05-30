From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next v2 2/2] net: mscc: ocelot: Hardware ofload for
 tc flower filter
Date: Thu, 30 May 2019 12:52:26 -0700 (PDT)
Message-ID: <20190530.125226.748439790590538564.davem@davemloft.net>
References: <1559125580-6375-1-git-send-email-horatiu.vultur@microchip.com>
        <1559125580-6375-3-git-send-email-horatiu.vultur@microchip.com>
        <20190529151802.19aa82a2@cakuba.netronome.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190529151802.19aa82a2@cakuba.netronome.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jakub.kicinski@netronome.com
Cc: horatiu.vultur@microchip.com, alexandre.belloni@bootlin.com, UNGLinuxDriver@microchip.com, robh+dt@kernel.org, mark.rutland@arm.com, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Jakub Kicinski <jakub.kicinski@netronome.com>
Date: Wed, 29 May 2019 15:18:44 -0700

> On Wed, 29 May 2019 12:26:20 +0200, Horatiu Vultur wrote:
>> +static int ocelot_flower_replace(struct tc_cls_flower_offload *f,
>> +				 struct ocelot_port_block *port_block)
>> +{
>> +	struct ocelot_ace_rule *rule;
>> +	int ret;
>> +
>> +	if (port_block->port->tc.block_shared)
>> +		return -EOPNOTSUPP;
> 
> FWIW since you only support TRAP and DROP actions here (AFAICT) you
> should actually be okay with shared blocks.  The problems with shared
> blocks start when the action is stateful (like act_police), because we
> can't share that state between devices.  But for most actions which just
> maintain statistics, it's fine to allow shared blocks.  HTH

Please update to remove this test Horatiu, thanks.
