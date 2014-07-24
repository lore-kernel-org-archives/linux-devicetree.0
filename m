From: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>
Subject: RE: [PATCH RFC v3 2/2] memory: pl353: Add driver for arm pl353
 static memory controller
Date: Thu, 24 Jul 2014 03:44:03 +0000
Message-ID: <d9b01b11-da65-4e79-b3de-e5065df76281@BL2FFO11FD009.protection.gbl>
References: <1403838162-18756-1-git-send-email-punnaia@xilinx.com>
 <CAGnW=BaU6iS6BNa_MQNAK_Sck-Cv=Z3iL87gMENPQOq2otMjKg@mail.gmail.com>
 <CAGnW=BbiMQchQeWPE8gKsr8QuGPkurt7kb3hGcqf+fjyrVi0ww@mail.gmail.com>
 <201407232148.15419.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <201407232148.15419.arnd@arndb.de>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "jussi.kivilinna@iki.fi" <jussi.kivilinna@iki.fi>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Srikanth Vemula <svemula@xilinx.com>, Michal Simek <michals@xilinx.com>, "ezequiel.garcia@free-electrons.com" <ezequiel.garcia@free-electrons.com>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "jason@lakedaemon.net" <jason@lakedaemon.net>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Anirudha Sarangi <anirudh@xilinx.com>, "joern@logfs.org" <joern@logfs.org>, Punnaiah Choudary <kpc528@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "acourbot@nvidia.com" <acourbot>
List-Id: devicetree@vger.kernel.org

Hi Arnd

>-----Original Message-----
>From: Arnd Bergmann [mailto:arnd@arndb.de]
>Sent: Thursday, July 24, 2014 1:18 AM
>To: Punnaiah Choudary Kalluri
>Cc: Punnaiah Choudary Kalluri; robh+dt@kernel.org; pawel.moll@arm.com;
>mark.rutland@arm.com; ijc+devicetree@hellion.org.uk; Kumar Gala; Rob
>Landley; Michal Simek; Grant Likely; gregkh@linuxfoundation.org;
>jason@lakedaemon.net; ezequiel.garcia@free-electrons.com; David
>Woodhouse; Brian Norris; artem.bityutskiy@linux.intel.com; Gupta, Pekon;
>jussi.kivilinna@iki.fi; acourbot@nvidia.com; Khoronzhuk, Ivan;
>joern@logfs.org; devicetree@vger.kernel.org; linux-doc@vger.kernel.org;
>linux-kernel@vger.kernel.org; linux-mtd@lists.infradead.org; Punnaiah
>Choudary; Anirudha Sarangi; Srikanth Vemula
>Subject: Re: [PATCH RFC v3 2/2] memory: pl353: Add driver for arm pl353 static
>memory controller
>
>On Monday 21 July 2014, punnaiah choudary kalluri wrote:
>> On Mon, Jul 7, 2014 at 10:15 PM, punnaiah choudary kalluri
>> <punnaia@xilinx.com> wrote:
>> > On Thu, Jul 3, 2014 at 4:09 PM, Arnd Bergmann <arnd@arndb.de> wrote:
>> >> On Friday 27 June 2014 08:32:42 Punnaiah Choudary Kalluri wrote:
>> >>
>> >>> +/**
>> >>> + * struct pl353_smc_data - Private smc driver structure
>> >>> + * @devclk:          Pointer to the peripheral clock
>> >>> + * @aperclk:         Pointer to the APER clock
>> >>> + */
>> >>> +struct pl353_smc_data {
>> >>> +     struct clk              *memclk;
>> >>> +     struct clk              *aclk;
>> >>> +};
>> >>> +
>> >>> +/* SMC virtual register base */
>> >>> +static void __iomem *pl353_smc_base;
>> >>
>> >> Drivers should not assume that there is only a single instance of the
>> >> hardware in the system. Please remove this global variable and
>> >> change the code to pass around a pointer to a structure containing
>> >> it.
>> >
>> > Since, the pl353 nand driver has dependency with this driver for
>configuring the
>> > bus width,operational parameters and ecc specific settings.
>> > So, i didnt find any mechanism for passing this instance from other driver
>other
>> > than exporting this instance.
>> > http://lists.infradead.org/pipermail/linux-mtd/2014-April/053432.html
>> >
>> > Please suggest the better option if you want it to be not global.
>
>I would expect the nand device to be a child of the smc device. In this case,
>the nand driver can just pass a pointer to its own 'struct device', and the
>smc driver can find its data using dev_get_drvdata(dev->parent).

Ok.
>
>> >>> +/**
>> >>> + * pl353_smc_set_buswidth - Set memory buswidth
>> >>> + * @bw:      Memory buswidth (8 | 16)
>> >>> + * Return: 0 on success or negative errno.
>> >>> + */
>> >>> +int pl353_smc_set_buswidth(unsigned int bw)
>> >>> +{
>> >>> +
>> >>> +     if (bw != PL353_SMC_MEM_WIDTH_8  && bw !=
>PL353_SMC_MEM_WIDTH_16)
>> >>> +             return -EINVAL;
>> >>> +
>> >>> +     writel(bw, pl353_smc_base + PL353_SMC_SET_OPMODE_OFFS);
>> >>> +     writel(PL353_SMC_DC_UPT_NAND_REGS, pl353_smc_base +
>> >>> +            PL353_SMC_DIRECT_CMD_OFFS);
>> >>> +
>> >>> +     return 0;
>> >>> +}
>> >>> +EXPORT_SYMBOL_GPL(pl353_smc_set_buswidth);
>> >>
>> >> Why is this an exported interface? Wouldn't that setting just be
>> >> determined from DT when the device is probed?
>> >
>> > Nand driver rely on auto bus width detection mechanism for identifying
>> > the bus width using onfi parameter page settings. So, once the driver
>> > finds the bus width, updates accordingly using this API
>
>This should at least pass the device pointer then.

Ok. Thanks. I will update the driver and send you the updated version.

Regards,
Punnaiah
>
>
>	Arnd
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
