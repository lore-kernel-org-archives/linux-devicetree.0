From: Andrea Galbusera <gizero@gmail.com>
Subject: Re: [PATCH v16 6/6] ARM: socfpga: fpga bridge driver support
Date: Thu, 28 Jul 2016 12:28:17 +0200
Message-ID: <CAC+thW3U_vEre0DovmK7t_oiK5v1evZCBPqpahf+e6aCvmhqLA@mail.gmail.com>
References: <1454707803-27947-1-git-send-email-atull@opensource.altera.com>
 <1454707803-27947-7-git-send-email-atull@opensource.altera.com> <1465525089.15779.203.camel@rtred1test09.kymeta.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1465525089.15779.203.camel@rtred1test09.kymeta.local>
Sender: linux-doc-owner@vger.kernel.org
To: Trent Piepho <tpiepho@kymetacorp.com>
Cc: "atull@opensource.altera.com" <atull@opensource.altera.com>, Rob Herring <robh+dt@kernel.org>, "pantelis.antoniou@konsulko.com" <pantelis.antoniou@konsulko.com>, Moritz Fischer <moritz.fischer@ettus.com>, Josh Cartwright <joshc@ni.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "monstr@monstr.eu" <monstr@monstr.eu>, "michal.simek@xilinx.com" <michal.simek@xilinx.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "delicious.quinoa@gmail.com" <delicious.quinoa@gmail.com>, "dinguyen@opensource.altera.com" <dinguyen@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 10, 2016 at 4:18 AM, Trent Piepho <tpiepho@kymetacorp.com> wrote:
> On Fri, 2016-02-05 at 15:30 -0600, atull@opensource.altera.com wrote:
>> Supports Altera SOCFPGA bridges:
>>  * fpga2sdram
>>  * fpga2hps
>>  * hps2fpga
>>  * lwhps2fpga
>>
>> Allows enabling/disabling the bridges through the FPGA
>> Bridge Framework API functions.
>
> I'm replying to v16 because it exists on gmane, while v17 appears not
> to.  lkml.org's forward feature appears to be broken so I can't reply to
> that message (no way to get message-id).  But v17 of this patch should
> be the same.  If a v18 was posted, I've not been able to find it.
>
>> diff --git a/drivers/fpga/altera-hps2fpga.c b/drivers/fpga/altera-hps2fpga.c
>> new file mode 100644
>> index 0000000..c15df47
>> --- /dev/null
>> +++ b/drivers/fpga/altera-hps2fpga.c
>> @@ -0,0 +1,213 @@
>> +/*
>> + * FPGA to/from HPS Bridge Driver for Altera SoCFPGA Devices
>> + *
>> + *  Copyright (C) 2013-2015 Altera Corporation, All Rights Reserved.
>> + *
>> + * This program is free software; you can redistribute it and/or modify it
>> + * under the terms and conditions of the GNU General Public License,
>> + * version 2, as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope it will be useful, but WITHOUT
>> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
>> + * more details.
>> + *
>> + * You should have received a copy of the GNU General Public License along with
>> + * this program.  If not, see <http://www.gnu.org/licenses/>.
>> + */
>> +
>> +/*
>> + * This driver manages bridges on a Altera SOCFPGA between the ARM host
>> + * processor system (HPS) and the embedded FPGA.
>> + *
>> + * This driver supports enabling and disabling of the configured ports, which
>> + * allows for safe reprogramming of the FPGA, assuming that the new FPGA image
>> + * uses the same port configuration.  Bridges must be disabled before
>> + * reprogramming the FPGA and re-enabled after the FPGA has been programmed.
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/fpga/fpga-bridge.h>
>> +#include <linux/kernel.h>
>> +#include <linux/mfd/syscon.h>
>> +#include <linux/module.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/regmap.h>
>> +#include <linux/reset.h>
>> +
>> +#define ALT_L3_REMAP_OFST                    0x0
>> +#define ALT_L3_REMAP_MPUZERO_MSK             0x00000001
>> +#define ALT_L3_REMAP_H2F_MSK                 0x00000008
>> +#define ALT_L3_REMAP_LWH2F_MSK                       0x00000010
>> +
>> +#define HPS2FPGA_BRIDGE_NAME                 "hps2fpga"
>> +#define LWHPS2FPGA_BRIDGE_NAME                       "lwhps2fpga"
>> +#define FPGA2HPS_BRIDGE_NAME                 "fpga2hps"
>> +
>> +struct altera_hps2fpga_data {
>> +     const char *name;
>> +     struct reset_control *bridge_reset;
>> +     struct regmap *l3reg;
>> +     /* The L3 REMAP register is write only, so keep a cached value. */
>> +     unsigned int l3_remap_value;
>> +     unsigned int remap_mask;
>> +     struct clk *clk;
>> +};
>> +
>> +static int alt_hps2fpga_enable_show(struct fpga_bridge *bridge)
>> +{
>> +     struct altera_hps2fpga_data *priv = bridge->priv;
>> +
>> +     return reset_control_status(priv->bridge_reset);
>> +}
>> +
>> +static int _alt_hps2fpga_enable_set(struct altera_hps2fpga_data *priv,
>> +                                 bool enable)
>> +{
>> +     int ret;
>> +
>> +     /* bring bridge out of reset */
>> +     if (enable)
>> +             ret = reset_control_deassert(priv->bridge_reset);
>> +     else
>> +             ret = reset_control_assert(priv->bridge_reset);
>> +     if (ret)
>> +             return ret;
>> +
>> +     /* Allow bridge to be visible to L3 masters or not */
>> +     if (priv->remap_mask) {
>> +             priv->l3_remap_value |= ALT_L3_REMAP_MPUZERO_MSK;
>
> Doesn't seem like this belongs here.  I realize the write-only register
> is a problem.  Maybe the syscon driver should be initializing this
> value?
>
>> +
>> +             if (enable)
>> +                     priv->l3_remap_value |= priv->remap_mask;
>> +             else
>> +                     priv->l3_remap_value &= ~priv->remap_mask;
>> +
>> +             ret = regmap_write(priv->l3reg, ALT_L3_REMAP_OFST,
>> +                                priv->l3_remap_value);
>
> This isn't going work if more than one bridge is used.  Each bridge has
> its own priv and thus priv->l3_remap_value.  Each bridge's priv will
> have just the bit for it's own remap set.  The 2nd bridge to be enabled
> will turn off the 1st bridge when it re-write the l3 register.

I can confirm this is exactly what happens with tag
"rel_socfpga-4.1.22-ltsi_16.06.02_pr" of socfpga-4.1.22-ltsi branch
from altera-opensource/linux-socfpga which includes more or less the
code in this patch. If you have 2 bridges (lw-hps2fpga and hps2fpga)
you end up with only one of them being visible. Easily spot by logging
l3_remap_value being passed to regmap_write()...
