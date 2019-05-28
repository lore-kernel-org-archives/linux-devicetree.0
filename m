From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next 1/2] net: mscc: ocelot: Add support for tcam
Date: Tue, 28 May 2019 10:59:05 -0700 (PDT)
Message-ID: <20190528.105905.1984032479752781822.davem@davemloft.net>
References: <1558944996-23069-1-git-send-email-horatiu.vultur@microchip.com>
        <1558944996-23069-2-git-send-email-horatiu.vultur@microchip.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1558944996-23069-2-git-send-email-horatiu.vultur@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: horatiu.vultur@microchip.com
Cc: alexandre.belloni@bootlin.com, UNGLinuxDriver@microchip.com, robh+dt@kernel.org, mark.rutland@arm.com, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Horatiu Vultur <horatiu.vultur@microchip.com>
Date: Mon, 27 May 2019 10:16:35 +0200

> +/* Calculate offsets for entry */
> +static void is2_data_get(struct vcap_data *data, int ix)
> +{
> +	const struct vcap_props *vcap = &vcap_is2;
> +	u32 i, col, offset, count, cnt, base, width = vcap->tg_width;

Reverse christmas tree please.

> +static void is2_entry_set(struct ocelot *ocelot, int ix,
> +			  struct ocelot_ace_rule *ace)
> +{
> +	u32 val, msk, type, type_mask = 0xf, i, count;
> +	struct ocelot_vcap_u64 payload = { 0 };
> +	struct ocelot_ace_vlan *tag = &ace->vlan;
> +	struct vcap_data data = { 0 };
> +	int row = (ix / 2);

Likewise.

> +static void is2_entry_get(struct ocelot_ace_rule *rule, int ix)
> +{
> +	struct vcap_data data;
> +	struct ocelot *op = rule->port->ocelot;
> +	int row = (ix / 2);
> +	u32 cnt;

Likewise.

> +static void ocelot_ace_rule_add(struct ocelot_acl_block *block,
> +				struct ocelot_ace_rule *rule)
> +{
> +	struct list_head *pos, *n;
> +	struct ocelot_ace_rule *tmp;

Likewise.

And so on and so forth for your entire submission.

Thank you.
