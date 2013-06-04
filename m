From: Gerlando Falauto <gerlando.falauto@keymile.com>
Subject: Re: DT version of kirkwood_ge0x_init()
Date: Tue, 04 Jun 2013 22:53:40 +0200
Message-ID: <51AE53D4.5070208@keymile.com>
References: <51ADBEE0.5040500@keymile.com> <51ADC2C2.6010106@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <51ADC2C2.6010106@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, "Longchamp, Valentin" <Valentin.Longchamp@keymile.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "Brunck,
 Holger" <Holger.Brunck@keymile.com>, Simon Guinot <simon@sequanux.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Sebastian,

thanks for your answer and your hard work about this whole cleanup.

Two more questions though -- the whole pulling sequence and the 
mainlining process is still very confusing to me so I really have no 
idea where to look or what to expect.

1) Has this been pulled somewhere? You provided a pointer to the LKML 
but I assume this would pop up by way of an -arm tree... is that right?
I'd like to start using that.

2) About my old fixes for the IRQ conflicts on Kirkwood, I saw that 
Thomas Gleixner's rework was pulled into the "tip" tree, but that's more 
genirq related. Did you (or anyone else) also follow up on that and make 
the changes for Kirkwood in order to enable the separate mask registers? 
I'd like to test that (that's actually why I started looking at recent 
kernels with FDT support to begin with).
Or shall I just follow Thomas' proof of concept on irq-sun4i and do the 
same for Kirkwood?

Sorry, I am really more than lost when it's about tracking 
how/where/when changes are pulled. Any "mainlining for dummies" pointer 
would be more than appreciated.

Thank you,
Gerlando

On 06/04/2013 12:34 PM, Sebastian Hesselbarth wrote:
> On 06/04/13 12:18, Gerlando Falauto wrote:
>> I noticed how most of the DT-aware board-setup files only have a single
>> <board>_init() function, calling kirkwood_ge00_init() with a struct
>> mv643xx_eth_platform_data as a single argument.
>>
>> I was wondering -- is there a reason why we cannot remove all this
>> board-specific code and move all this to the DT?
>
> Gerlando,
>
> DT for mv643xx_eth is on the way (https://lkml.org/lkml/2013/5/29/527).
> We wait for the driver to surface to relax branch dependencies and then
> move all DT Orion SoCs to it.
>
>   > I would really love to have all our boards under a single
>   > CONFIG_<FAMILY>_DT and a single compatible string, with all the
>   > differences within the DTs itself -- no more #ifdef CONFIG_<BOARD>,
>   > no more of_machine_is_compatible("boardXXX").
>
> All those will happen if there is DT support for mv643xx_eth which
> is the only driver left without DT and board dependencies. But there
> will be no CONFIG_LACIE_DT or whatever, but just CONFIG_KIRKWOOD_DT
> and board dependent stuff described in the corresponding dts.
>
> Sebastian
>
