From: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
Subject: Re: [PATCH 2/3] mtd: davinci-nand: add dts property for
 NAND_NO_SUBPAGE_WRITE option
Date: Thu, 20 Mar 2014 21:26:29 +0200
Message-ID: <532B40E5.4070201@ti.com>
References: <1395335184-4745-1-git-send-email-ivan.khoronzhuk@ti.com>
 <1395335184-4745-3-git-send-email-ivan.khoronzhuk@ti.com>
 <532B2183.2080309@ti.com> <20140320172912.GW31517@norris-Latitude-E6410>
 <532B2766.6090506@ti.com> <D69011BE-C37F-4085-B992-45F6F32AF1D0@gmail.com>
 <532B2D3F.6050004@ti.com> <20140320185452.GB21018@ld-irv-0074>
 <532B3D74.6070703@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <532B3D74.6070703@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Santosh Shilimkar <santosh.shilimkar@ti.com>, Brian Norris <computersforpeace@gmail.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, grygorii.strashko@ti.com, Russell King - ARM Linux <linux@arm.linux.org.uk>, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Murali Karicheri <m-karicheri2@ti.com>, robh+dt@kernel.org, linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, rob@landley.net, galak@codeaurora.org, David Woodhouse <dwmw2@infradead.org>, Warner Losh <imp@bsdimp.com>
List-Id: devicetree@vger.kernel.org


On 03/20/2014 09:11 PM, Santosh Shilimkar wrote:
> On Thursday 20 March 2014 02:54 PM, Brian Norris wrote:
>> On Thu, Mar 20, 2014 at 02:02:39PM -0400, Santosh Shilimkar wrote:
>>> On Thursday 20 March 2014 01:44 PM, Warner Losh wrote:
>>>> I though sub page writing was one of the fields in the onfi and/or jedec(toggle) meta data structures. Have you looked there?
>>>>
>>> Am not sure if I follow you. The limitation is from the TI NAND controller(AEMIF) and
>>> not the NAND memory.
>> That doesn't match the patch description, which says "that flash doesn't
>> support subpage writing". Flash != flash controller.
>>
> Patch description is indeed doesn't reflect the actual issue.
>
>> Which one is it? If it's a controller limitation, I think we should be
>> able to pull this from a "compatible" property, no?
>>
> Just to be accurate, the limitation(bug) is on the controller found on Keystone
> SOCs. AEMIF controller is also used on DaVinci SOCs which don't seems to have
> any issue. So even for compatible, you need to add keystone specific one.
> Hence thought dt property is better option.
>
> regards,
> Santosh
>

I will use compatible approach.
We have keystone compatible in k2hk-evm.dts,
so I need to add it only in the davinci-nand driver.
I will add the following:

if (of_device_is_compatible(np, "ti,keystone-nand")) {
             pdata->options |= NAND_NO_SUBPAGE_WRITE;
  }

...

static const struct of_device_id davinci_nand_of_match[] = {
     {.compatible = "ti,davinci-nand", },
     {.compatible = "ti,keystone-nand", },
     {},
};

-- 
Regards,
Ivan Khoronzhuk


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
