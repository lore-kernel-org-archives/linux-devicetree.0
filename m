From: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: [PATCH v3 0/8] Add the Quadspi driver for vf610-twr
Date: Thu, 12 Sep 2013 15:25:45 +0200
Message-ID: <alpine.DEB.2.00.1309121523130.2394@lnxricardw.se.axis.com>
References: <20130910180704.GB29403@sirena.org.uk>
 <522FD78A.6080900@freescale.com> <20130911104126.GN29403@sirena.org.uk>
 <52304BFF.4060007@freescale.com> <20130911113002.GP29403@sirena.org.uk>
 <523186DF.4070203@freescale.com>
 <1378982395.2627.416.camel@shinybook.infradead.org>
 <20980858CB6D3A4BAE95CA194937D5E73EA0EE8B@DBDE04.ent.ti.com>
 <1378984665.2627.423.camel@shinybook.infradead.org>
 <20130912114831.GL29403@sirena.org.uk>
 <20130912115549.GI12758@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-15"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130912115549.GI12758@n2100.arm.linux.org.uk>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "b44548@freescale.com" <b44548@freescale.com>, "dedekind1@gmail.com" <dedekind1@gmail.com>, David Woodhouse <dwmw2@infradead.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "b18965@freescale.com" <b18965@freescale.com>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "thomas.langer@lantiq.com" <thomas.langer@lantiq.com>, Mark Brown <broonie@kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "lznuaa@gmail.com" <lznuaa@gmail.com>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, Huang Shijie <shijie8@gmail.com>, Huang Shijie <b32955@freescale.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


On Thu, 12 Sep 2013, Russell King - ARM Linux wrote:

> On Thu, Sep 12, 2013 at 12:48:31PM +0100, Mark Brown wrote:
>> On Thu, Sep 12, 2013 at 12:17:45PM +0100, David Woodhouse wrote:
>>
>>> Right. The issue here is that the LUT is currently *pre-populated*, with
>>> an incestuously-"known" set of commands that the slave is expected to
>>> support.
>>
>> So, to repeat my earlier question can someone tell me what a LUT is?
>
> It's a very common abbreviation - Look Up Table.
>
> More specifically, it's a set of registers which give the SPI controller
> a sequence of 16-bit commands to execute, which tell it what to do on
> the SPI bus.  Each register contains two commands, and it executes them
> ...

A bit of an odd name when used in this context I think; LUTs are usually =

used to perform mapping or transformation functions, e.g. looking up a =

value 'y' given an input value 'x'. In this case it's just a table of =

commands to be executed. But I guess the name LUT has been used in some =

hardware specification so there's not much we can do about it.

/Ricard
-- =

Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
