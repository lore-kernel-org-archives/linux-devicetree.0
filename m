From: Viet Nga Dao <vndao@altera.com>
Subject: Re: [PATCH] [PATCH v4] mtd:spi-nor: Add Altera Quad SPI Driver
Date: Thu, 20 Aug 2015 15:33:23 +0800
Message-ID: <CAN1oZWyE9E2kRkGZPajpiNbpeKEjOhs9NDNDbUpmdw18WNYL2A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, marex@denx.de
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, nga_chi86 <ngachi86@gmail.com>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 18, 2015 at 2:55 PM, Viet Nga Dao <vndao@altera.com> wrote:
>
>
> -----Original Message-----
> From: marex@denx.de
> Sent: Tuesday, August 18, 2015 9:33 AM
> To: Brian Norris
> Cc: linux-mtd@lists.infradead.org; Viet Nga Dao; devicetree@vger.kernel.org; Rafa?? Mi??ecki; linux-kernel@vger.kernel.org; David Woodhouse; Graham Moore
> Subject: Re: [PATCH] [PATCH v4] mtd:spi-nor: Add Altera Quad SPI Driver
>
> On Tuesday, August 18, 2015 at 03:24:44 AM, Brian Norris wrote:
>> I'm not very helpful here, so hopefully Viet can be of more use:
>
> Yup :)
>
>> On Mon, Aug 17, 2015 at 07:53:23PM +0200, Marek Vasut wrote:
>> > On Monday, August 17, 2015 at 06:03:38 PM, Brian Norris wrote:
>> > Also, I cannot find any documentation for this IP block even if I
>> > search through Quartus/QSys, is there any proper documentation
>> > available anywhere?
>>
>> I never found proper documentation, but I didn't look too hard. I've
>> mostly been going off of Viet's comments and code.
>
> Me neither, and I looked through the altera stuff in fact. I'm trying to learn whether this is just an Soft IP, in which case it certainly can be fixed ; or if there is actually some chip shipping with this crap synthesised into actual silicon.
>
>> But FWIW, I did find some relevant info for the peculiar Altera EPCQ
>> flash here:
>>
>> https://www.altera.com/content/dam/altera-www/global/en_US/pdfs/litera
>> ture/
>> hb/cfg/cfg_cf52012.pdf
>
> Altera EPCS/EPCQ flashes are just rebranded micron flashes, they just have different JEDEC >ID and are a bit more expensive.

You can find the document at here
(https://www.altera.com/content/dam/altera-www/global/en_US/pdfs/literature/ug/ug_embedded_ip.pdf)
 Chapter 42.Page 407.

For the soft IP issue, i've requested hardware engineer to come out
the solution. So in the mean way, our driver will NOT support Micron
flashes until hardware fix is completed.

Hence, i just submitted version 5 for this driver with eliminating
micron device support. Hope this version will get ACKed by you.

Thanks,
Viet Nga
