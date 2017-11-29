From: Souptick Joarder <jrdr.linux@gmail.com>
Subject: Re: [PATCH v4 7/8] netdev: octeon-ethernet: Add Cavium Octeon III
 support.
Date: Wed, 29 Nov 2017 21:37:15 +0530
Message-ID: <CAFqt6zZAPxKm663yEHD0Rx2SPye9Nvoax0RMroDQuF8BpZchsA@mail.gmail.com>
References: <20171129005540.28829-1-david.daney@cavium.com>
 <20171129005540.28829-8-david.daney@cavium.com>
 <CAFqt6zabdQhyjUc4WsjzJ6CxMr70H3V_JdipJVwRi8LuOG54tA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <CAFqt6zabdQhyjUc4WsjzJ6CxMr70H3V_JdipJVwRi8LuOG54tA@mail.gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: David Daney <david.daney@cavium.com>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-mips@linux-mips.org, devel@driverdev.osuosl.org, devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, ralf@linux-mips.org, Carlos Munoz <cmunoz@cavium.com>, Rob Herring <robh+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, "Steven J. Hill" <steven.hill@cavium.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Florian Fainelli <f.fainelli@gmail.com>, James Hogan <james.hogan@mips.com>, "David S. Miller" <davem@davemloft.net>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 29, 2017 at 4:00 PM, Souptick Joarder <jrdr.linux@gmail.com> wrote:
> On Wed, Nov 29, 2017 at 6:25 AM, David Daney <david.daney@cavium.com> wrote:
>> From: Carlos Munoz <cmunoz@cavium.com>
>>
>> The Cavium OCTEON cn78xx and cn73xx SoCs have network packet I/O
>> hardware that is significantly different from previous generations of
>> the family.

>> diff --git a/drivers/net/ethernet/cavium/octeon/octeon3-bgx-port.c b/drivers/net/ethernet/cavium/octeon/octeon3-bgx-port.c
>> new file mode 100644
>> index 000000000000..4dad35fa4270
>> --- /dev/null
>> +++ b/drivers/net/ethernet/cavium/octeon/octeon3-bgx-port.c
>> @@ -0,0 +1,2033 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/* Copyright (c) 2017 Cavium, Inc.
>> + *
>> + * This file is subject to the terms and conditions of the GNU General Public
>> + * License.  See the file "COPYING" in the main directory of this archive
>> + * for more details.
>> + */
>> +#include <linux/platform_device.h>
>> +#include <linux/netdevice.h>
>> +#include <linux/etherdevice.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/of_address.h>
>> +#include <linux/of_mdio.h>
>> +#include <linux/of_net.h>
>> +#include <linux/module.h>
>> +#include <linux/slab.h>
>> +#include <linux/list.h>
>> +

>> +static void bgx_port_sgmii_set_link_down(struct bgx_port_priv *priv)
>> +{
>> +       u64     data;

>> +       data = oct_csr_read(BGX_GMP_PCS_MISC_CTL(priv->node, priv->bgx, priv->index));
>> +       data |= BIT(11);
>> +       oct_csr_write(data, BGX_GMP_PCS_MISC_CTL(priv->node, priv->bgx, priv->index));
>> +       data = oct_csr_read(BGX_GMP_PCS_MISC_CTL(priv->node, priv->bgx, priv->index));
>
> Any particular reason to read immediately after write ?



>> +static int bgx_port_sgmii_set_link_speed(struct bgx_port_priv *priv, struct port_status status)
>> +{
>> +       u64     data;
>> +       u64     prtx;
>> +       u64     miscx;
>> +       int     timeout;
>> +

>> +
>> +       switch (status.speed) {
>> +       case 10:
>
> In my opinion, instead of hard coding the value, is it fine to use ENUM ?
   Similar comments applicable in other places where hard coded values are used.



>> +static int bgx_port_gser_27882(struct bgx_port_priv *priv)
>> +{
>> +       u64     data;
>> +       u64     addr;
>
>> +       int     timeout = 200;
>> +
>> +   //    timeout = 200;
Better to initialize the timeout value


>> +static int bgx_port_qlm_rx_equalization(struct bgx_port_priv *priv, int qlm, int lane)
>> +{
>> +       lmode = oct_csr_read(GSER_LANE_MODE(priv->node, qlm));
>> +       lmode &= 0xf;
>> +       addr = GSER_LANE_P_MODE_1(priv->node, qlm, lmode);
>> +       data = oct_csr_read(addr);
>> +       /* Don't complete rx equalization if in VMA manual mode */
>> +       if (data & BIT(14))
>> +               return 0;
>> +
>> +       /* Apply rx equalization for speed > 6250 */
>> +       if (bgx_port_get_qlm_speed(priv, qlm) < 6250)
>> +               return 0;
>> +
>> +       /* Wait until rx data is valid (CDRLOCK) */
>> +       timeout = 500;
>
> 500 us is the min required value or it can be further reduced ?


>> +static int bgx_port_init_xaui_link(struct bgx_port_priv *priv)
>> +{

>> +
>> +               if (use_ber) {
>> +                       timeout = 10000;
>> +                       do {
>> +                               data =
>> +                               oct_csr_read(BGX_SPU_BR_STATUS1(priv->node, priv->bgx, priv->index));
>> +                               if (data & BIT(0))
>> +                                       break;
>> +                               timeout--;
>> +                               udelay(1);
>> +                       } while (timeout);
>
> In my opinion, it's better to implement similar kind of loops inside macros.
>
>> +                       if (!timeout) {
>> +                               pr_debug("BGX%d:%d:%d: BLK_LOCK timeout\n",
>> +                                        priv->bgx, priv->index, priv->node);
>> +                               return -1;
>> +                       }
>> +               } else {
>> +                       timeout = 10000;
>> +                       do {
>> +                               data =
>> +                               oct_csr_read(BGX_SPU_BX_STATUS(priv->node, priv->bgx, priv->index));
>> +                               if (data & BIT(12))
>> +                                       break;
>> +                               timeout--;
>> +                               udelay(1);
>> +                       } while (timeout);
> same here
