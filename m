From: Arnaud Patard (Rtp) <arnaud.patard@rtp-net.org>
Subject: Re: device tree binding documentation outdated
Date: Fri, 27 Sep 2013 15:52:53 +0200
Message-ID: <87ioxmbccq.fsf@lebrac.rtp-net.org>
References: <20130926195158.GS12758@n2100.arm.linux.org.uk>
 <CAOMZO5ANsZGcpvmtBE7d0q0E6+f0bE_U8CBF7G2v3xtqoLbqcA@mail.gmail.com>
 <CACRpkda9HZ4JKnidnJJh-HkhCgtvJwQPQJnv9CZ4iYcQP36_Nw@mail.gmail.com>
 <20130927025116.GG25146@S2101-09.ap.freescale.net>
 <20130927084504.GW12758@n2100.arm.linux.org.uk>
 <20130927122814.GK25146@S2101-09.ap.freescale.net>
 <20130927131225.GA31178@titan.lakedaemon.net>
 <20130927132107.GZ12758@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130927132107.GZ12758@n2100.arm.linux.org.uk> (Russell King's
 message of "Fri, 27 Sep 2013 14:21:07 +0100")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Linus Walleij <linus.walleij@linaro.org>, Shawn Guo <shawn.guo@linaro.org>, Fabio Estevam <festevam@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Russell King - ARM Linux <linux@arm.linux.org.uk> writes:

> On Fri, Sep 27, 2013 at 09:12:25AM -0400, Jason Cooper wrote:
>> I'm currently slogging through the exact same issues for adding imx50
>> (SanDisk Connect Wireless media Drive).  I thought I was just thick.
>> It's a relief to know I'm not the only one having trouble with this.
>
> I'm coming to the conclusion that it's almost to the point of "vendor
> lockin" - you have to find someone who understands this stuff to take
> your hardware description and turn it into a working DT description.

I don't know imx6 vendor code, but at least on imx5x with mainline, half
of the job is easy. For instance, in C, there was a tab containing pad
settings, like that:
static iomux_v3_cfg_t mx51efika_pads[] = {
...
MX51_PAD_EIM_A16__GPIO2_10,
...

and now, it's more :

fsl,pins = <
...
MX51_PAD_EIM_A16__GPIO2_10  0x85
...

The real problem is more about finding the 0x85 value, which is not
easy. Of course, if the code did not use this kind of (imx-specific)
stuff, it's not suprising that it's hard to convert it.

>
> Still slogging away at the nonfunctional ethernet and still have no
> idea why it's not working... just going through the pinctrl settings
> again, this time decoding them right down to the values on both the
> DT and the working code and comparing.

There may be also some missing code on the driver side (not related to
pinctrl). It's already the case for some stuff on imx5x side.

my 2 cents,
Arnaud
