From: Jan =?ISO-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>
Subject: Re: [RFC PATCH 3/4] ARM: l2x0: add arm,ecc-enable property for aurora
Date: Fri, 09 Jun 2017 10:58:12 +0200
Message-ID: <1496998692.3536.24.camel@pengutronix.de>
References: <20170608041124.4624-1-chris.packham@alliedtelesis.co.nz>
 <20170608041124.4624-4-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170608041124.4624-4-chris.packham@alliedtelesis.co.nz>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, bp@alien8.de, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Do, 2017-06-08 at 16:11 +1200, Chris Packham wrote:
> +       if (of_property_read_bool(np, "arm,ecc-enable")) {
> +               mask |= L2C_AUX_CTRL_EVTMON_ENABLE;
> +               val |= L2C_AUX_CTRL_EVTMON_ENABLE;
> +       } else if (of_property_read_bool(np, "arm,ecc-disable")) {
> +               mask |= L2C_AUX_CTRL_EVTMON_ENABLE;
> +       }

Unless I misunderstand the code in __l2c_init(), the mask is used to
specify the bits to preserve:
        old_aux = aux = readl_relaxed(l2x0_base + L2X0_AUX_CTRL);
        aux &= aux_mask;
        aux |= aux_val;

        if (old_aux != aux)
                pr_warn("L2C: DT/platform modifies aux control register: 0x%08x -> 0x%08x\n",
                        old_aux, aux);

So the arm,ecc-disable property will have no effect. This probably also
applies to patch 2/4. The existing property *-disable code removes the
corresponding bit from the mask.

Regards,
Jan
-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
