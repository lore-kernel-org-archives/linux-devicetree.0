From: Souptick Joarder <jrdr.linux@gmail.com>
Subject: Re: [PATCH v4 7/8] netdev: octeon-ethernet: Add Cavium Octeon III support.
Date: Thu, 30 Nov 2017 12:42:13 +0530
Message-ID: <CAFqt6za-ccO8zXNL6zgt_ZtPyRFpVEGHKWsnipWCiuQkUgYi_Q@mail.gmail.com>
References: <20171129005540.28829-1-david.daney@cavium.com>
 <20171129005540.28829-8-david.daney@cavium.com> <CAFqt6zabdQhyjUc4WsjzJ6CxMr70H3V_JdipJVwRi8LuOG54tA@mail.gmail.com>
 <CAFqt6zZAPxKm663yEHD0Rx2SPye9Nvoax0RMroDQuF8BpZchsA@mail.gmail.com> <cef2bbe0-cb06-6938-f665-9840eb67172d@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <cef2bbe0-cb06-6938-f665-9840eb67172d@caviumnetworks.com>
Sender: netdev-owner@vger.kernel.org
To: David Daney <ddaney@caviumnetworks.com>
Cc: David Daney <david.daney@cavium.com>, linux-mips@linux-mips.org, ralf@linux-mips.org, James Hogan <james.hogan@mips.com>, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, "Steven J. Hill" <steven.hill@cavium.com>, devicetree@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Carlos Munoz <cmunoz@cavium.com>
List-Id: devicetree@vger.kernel.org

Hi David, Dan,


On Thu, Nov 30, 2017 at 12:50 AM, David Daney <ddaney@caviumnetworks.com> wrote:
> On 11/29/2017 08:07 AM, Souptick Joarder wrote:
>>
>> On Wed, Nov 29, 2017 at 4:00 PM, Souptick Joarder <jrdr.linux@gmail.com>
>> wrote:
>>>
>>> On Wed, Nov 29, 2017 at 6:25 AM, David Daney <david.daney@cavium.com>
>>> wrote:
>>>>
>>>> From: Carlos Munoz <cmunoz@cavium.com>
>>>>
>>>> The Cavium OCTEON cn78xx and cn73xx SoCs have network packet I/O
>>>> hardware that is significantly different from previous generations of
>>>> the family.
>>
>>
>>>> diff --git a/drivers/net/ethernet/cavium/octeon/octeon3-bgx-port.c
>>>> b/drivers/net/ethernet/cavium/octeon/octeon3-bgx-port.c
>>>> new file mode 100644
>>>> index 000000000000..4dad35fa4270
>>>> --- /dev/null
>>>> +++ b/drivers/net/ethernet/cavium/octeon/octeon3-bgx-port.c
>>>> @@ -0,0 +1,2033 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +/* Copyright (c) 2017 Cavium, Inc.
>>>> + *
>>>> + * This file is subject to the terms and conditions of the GNU General
>>>> Public
>>>> + * License.  See the file "COPYING" in the main directory of this
>>>> archive
>>>> + * for more details.
>>>> + */
>>>> +#include <linux/platform_device.h>
>>>> +#include <linux/netdevice.h>
>>>> +#include <linux/etherdevice.h>
>>>> +#include <linux/of_platform.h>
>>>> +#include <linux/of_address.h>
>>>> +#include <linux/of_mdio.h>
>>>> +#include <linux/of_net.h>
>>>> +#include <linux/module.h>
>>>> +#include <linux/slab.h>
>>>> +#include <linux/list.h>
>>>> +
>>
>>
>>>> +static void bgx_port_sgmii_set_link_down(struct bgx_port_priv *priv)
>>>> +{
>>>> +       u64     data;
>>
>>
>>>> +       data = oct_csr_read(BGX_GMP_PCS_MISC_CTL(priv->node, priv->bgx,
>>>> priv->index));
>>>> +       data |= BIT(11);
>>>> +       oct_csr_write(data, BGX_GMP_PCS_MISC_CTL(priv->node, priv->bgx,
>>>> priv->index));
>>>> +       data = oct_csr_read(BGX_GMP_PCS_MISC_CTL(priv->node, priv->bgx,
>>>> priv->index));
>>>
>>>
>>> Any particular reason to read immediately after write ?
>>
>>
>
> Yes, to ensure the write is committed to hardware before the next step.
>
>>
>>
>>>> +static int bgx_port_sgmii_set_link_speed(struct bgx_port_priv *priv,
>>>> struct port_status status)
>>>> +{
>>>> +       u64     data;
>>>> +       u64     prtx;
>>>> +       u64     miscx;
>>>> +       int     timeout;
>>>> +
>>
>>
>>>> +
>>>> +       switch (status.speed) {
>>>> +       case 10:
>>>
>>>
>>> In my opinion, instead of hard coding the value, is it fine to use ENUM ?
>>
>>     Similar comments applicable in other places where hard coded values
>> are used.
>>
>
> There is nothing to be gained by interposing an extra layer of abstraction
> in this case.  The code is more clear with the raw numbers in this
> particular case.

   As mentioned by Andrew,  macros defined in uapi/linux/ethtool.h may
be useful here.
   Otherwise it's fine to me :)
>
>
>>
>>
>>>> +static int bgx_port_gser_27882(struct bgx_port_priv *priv)
>>>> +{
>>>> +       u64     data;
>>>> +       u64     addr;
>>>
>>>
>>>> +       int     timeout = 200;
>>>> +
>>>> +   //    timeout = 200;
>>
>> Better to initialize the timeout value

>
>
> What are you talking about?  It is properly initialized using valid C code.

      I mean, instead of writing

       int     timeout;
       timeout = 200;

      write,

       int timeout = 200;

Anyway both are correct and there is nothing wrong in your code.
Please ignore my comment here.

>
>
>>
>>
>>>> +static int bgx_port_qlm_rx_equalization(struct bgx_port_priv *priv, int
>>>> qlm, int lane)
>>>> +{
>>>> +       lmode = oct_csr_read(GSER_LANE_MODE(priv->node, qlm));
>>>> +       lmode &= 0xf;
>>>> +       addr = GSER_LANE_P_MODE_1(priv->node, qlm, lmode);
>>>> +       data = oct_csr_read(addr);
>>>> +       /* Don't complete rx equalization if in VMA manual mode */
>>>> +       if (data & BIT(14))
>>>> +               return 0;
>>>> +
>>>> +       /* Apply rx equalization for speed > 6250 */
>>>> +       if (bgx_port_get_qlm_speed(priv, qlm) < 6250)
>>>> +               return 0;
>>>> +
>>>> +       /* Wait until rx data is valid (CDRLOCK) */
>>>> +       timeout = 500;
>>>
>>>
>>> 500 us is the min required value or it can be further reduced ?
>>
>>
>
>
> 500 uS works well and is shorter than the 2000 uS from the hardware manual.
>
> If you would like to verify shorter timeout values, we could consider
> merging such a patch.  But really, this doesn't matter as it is a very short
> one-off action when the link is brought up.

   Ok.
>
>>
>>>> +static int bgx_port_init_xaui_link(struct bgx_port_priv *priv)
>>>> +{
>>
>>
>>>> +
>>>> +               if (use_ber) {
>>>> +                       timeout = 10000;
>>>> +                       do {
>>>> +                               data =
>>>> +
>>>> oct_csr_read(BGX_SPU_BR_STATUS1(priv->node, priv->bgx, priv->index));
>>>> +                               if (data & BIT(0))
>>>> +                                       break;
>>>> +                               timeout--;
>>>> +                               udelay(1);
>>>> +                       } while (timeout);
>>>
>>>
>>> In my opinion, it's better to implement similar kind of loops inside
>>> macros.
>
>
> Ok, duly noted.  I think we are in disagreement with respect to this point.


As similar type loops are implemented in many places, so I suggested
to implement those in macros
in header file and include it here.
Anyway if you don't agree with me, I am fine with it :)

>
>
>>>
>>>> +                       if (!timeout) {
>>>> +                               pr_debug("BGX%d:%d:%d: BLK_LOCK
>>>> timeout\n",
>>>> +                                        priv->bgx, priv->index,
>>>> priv->node);
>>>> +                               return -1;
>>>> +                       }
>>>> +               } else {
>>>> +                       timeout = 10000;
>>>> +                       do {
>>>> +                               data =
>>>> +
>>>> oct_csr_read(BGX_SPU_BX_STATUS(priv->node, priv->bgx, priv->index));
>>>> +                               if (data & BIT(12))
>>>> +                                       break;
>>>> +                               timeout--;
>>>> +                               udelay(1);
>>>> +                       } while (timeout);
>>>
>>> same here
>
>
