From: Haojian Zhuang <haojian.zhuang@gmail.com>
Subject: Re: [PATCH v2 4/7] tty: serial: support device tree in pxa
Date: Mon, 1 Aug 2011 10:50:47 +0800
Message-ID: <CAN1soZwYjQp5c=4f=CbqjrXFxzSURSv6i9QHMyjyPszs=kzh9w@mail.gmail.com>
References: <1311835293-18125-1-git-send-email-haojian.zhuang@marvell.com>
	<1311835293-18125-2-git-send-email-haojian.zhuang@marvell.com>
	<1311835293-18125-3-git-send-email-haojian.zhuang@marvell.com>
	<1311835293-18125-4-git-send-email-haojian.zhuang@marvell.com>
	<1311835293-18125-5-git-send-email-haojian.zhuang@marvell.com>
	<20110729164539.GM11164@ponder.secretlab.ca>
	<20110729164922.GA30298@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20110729164922.GA30298@n2100.arm.linux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: eric.y.miao@gmail.com, devicetree-discuss@lists.ozlabs.org, Haojian Zhuang <haojian.zhuang@marvell.com>, Grant Likely <grant.likely@secretlab.ca>, linux-arm-kernel@lists.infradead.org, alan@linux.intel.com
List-Id: devicetree@vger.kernel.org

On Sat, Jul 30, 2011 at 12:49 AM, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> On Fri, Jul 29, 2011 at 10:45:39AM -0600, Grant Likely wrote:
>> On Thu, Jul 28, 2011 at 02:41:30PM +0800, Haojian Zhuang wrote:
>> > +#ifdef CONFIG_OF
>> > + =A0 for (i =3D 0; i < PXA_SERIAL_NR; i++) {
>> > + =A0 =A0 =A0 =A0 =A0 if (serial_pxa_ports[i] =3D=3D NULL)
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> > + =A0 }
>> > + =A0 if (i >=3D PXA_SERIAL_NR) {
>> > + =A0 =A0 =A0 =A0 =A0 pr_warn("can't find pxa serial port\n");
>> > + =A0 =A0 =A0 =A0 =A0 return -ENODEV;
>> > + =A0 }
>> > +
>> > + =A0 if (of_property_read_u32(np, "clock-frequency", &clk)) {
>> > + =A0 =A0 =A0 =A0 =A0 pr_warn("no clock-frequency property set\n");
>> > + =A0 =A0 =A0 =A0 =A0 return -ENODEV;
>> > + =A0 }
>> > + =A0 if (of_property_read_u32(np, "current-speed", &spd) =3D=3D 0)
>> > + =A0 =A0 =A0 =A0 =A0 sport->port.custom_divisor =3D clk / (16 * spd);
>> > +
>> > + =A0 sprintf(name, "pxa2xx-uart.%d", i);
>> > + =A0 sport->clk =3D clk_get_sys(name, NULL);
>> > + =A0 if (IS_ERR(sport->clk)) {
>> > + =A0 =A0 =A0 =A0 =A0 ret =3D PTR_ERR(sport->clk);
>> > + =A0 =A0 =A0 =A0 =A0 goto err_free;
>> > + =A0 }
>> > + =A0 sport->port.uartclk =3D clk;
>> > +#else
>> > + =A0 i =3D dev->id;
>> > =A0 =A0 sport->clk =3D clk_get(&dev->dev, NULL);
>> > =A0 =A0 if (IS_ERR(sport->clk)) {
>> > =A0 =A0 =A0 =A0 =A0 =A0 ret =3D PTR_ERR(sport->clk);
>> > =A0 =A0 =A0 =A0 =A0 =A0 goto err_free;
>> > =A0 =A0 }
>> > + =A0 sport->port.uartclk =3D clk_get_rate(sport->clk);
>> > +#endif
>>
>> This means a kernel build can either support DT or non-DT, but not
>> both. =A0DT & non-DT booting are full supported with the same kernel
>> image, so don't do it this way.
>>
>> Instead, check for the presence of an of_node. =A0If it is there, do the
>> DT parsing. =A0If now, still support the old method.
>
> Oh ffs, why is this DT stuff causing all the clk stuff to have to change.
> And specifically why is stuff converting to use clk_get_sys().
>
> clk_get_sys() is there to allow system devices to get their clocks.
> It's not for general drivers to use.
>
> Please, stop this madness.
>

So how could I get these clocks?

Thanks
Haojian
