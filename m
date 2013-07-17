From: Gerlando Falauto <gerlando.falauto@keymile.com>
Subject: Re: [PATCH] ARM: Kirkwood: Fix the internal register ranges
 translation
Date: Wed, 17 Jul 2013 08:35:38 +0200
Message-ID: <51E63B3A.2010807@keymile.com>
References: <1371569479-31498-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <51E5145A.90404@keymile.com> <20130716125531.GD2317@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130716125531.GD2317@localhost>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, "Longchamp,
 Valentin" <Valentin.Longchamp@keymile.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Ezequiel,

On 07/16/2013 02:56 PM, Ezequiel Garcia wrote:
[...]
> Also, speaking of "device bus" this nand node should be behind a devicebus node.
>
> 		ranges = <MBUS_ID(0xf0, 0x01) 0 0 0xf1000000 0x100000   /* internal-regs */
> 			  MBUS_ID(0x01, 0x2f) 0 0 0xf4000000 0x400>;
>
> 		devbus {
> 			status = "okay";
> 			ranges = <0 MBUS_ID(0x01, 0x2f) 0 0x400>;
>
> 			/* nand */
> 			nand {
> 				compatible = "marvell,orion-nand";
> 				reg = <0 0x400>;
> 			};
> 		};
>
> (notice this will allow you to relocate the base address of the NAND windows
> easily if it conflicts with your PCIe needs).

I am MAYBE slowly starting to understand this whole mbus rework.
Just one remark though: don't you think it would make sense to add 
something like:

#define MBUS_ID_INTERNAL_REGS	MBUS_ID(0xf0, 0x01)
#define MBUS_ID_NAND		MBUS_ID(0x01, 0x2f)

I personally have a hard time reading numeric values for 
GPIO_ACTIVE_LOW/GPIO_ACTIVE_HIGH.

Thanks,
Gerlando

>
>> avoid a later incosistency between the "unit-address" and the first
>> "reg" address:
>>
>>>    		#address-cells = <1>;
>>>    		#size-cells = <1>;
>>> @@ -171,7 +172,7 @@
>>   >   		nand@3000000 {
>> 		     ^^^^^^^
>
> Oh, this should be fixed. I just missed it, and nobody noticed either.
>
