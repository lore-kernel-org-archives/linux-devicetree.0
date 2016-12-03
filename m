From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH 39/39] mtd: nand: denali_dt: add compatible strings for
 UniPhier SoC variants
Date: Sat, 3 Dec 2016 11:41:13 +0900
Message-ID: <CAK7LNAQHnH=On=+7fzenu_v6rB71y9hYuAZi5oinZFu-tfAdjw@mail.gmail.com>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
 <1480183585-592-40-git-send-email-yamada.masahiro@socionext.com>
 <20161201160511.ahlibszokg547wxk@rob-hp-laptop>
 <CAK7LNASJLbizHEh8mUUVDvTKiRMCSvyYtdrQzwN5tHmCV8iYOA@mail.gmail.com>
 <CAL_Jsq+H-JcAtDV3NCfptCWrmTgkQkmZFTj=Do8HhX4b=At9RA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <CAL_Jsq+H-JcAtDV3NCfptCWrmTgkQkmZFTj=Do8HhX4b=At9RA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Dinh Nguyen <dinguyen@altera.com>
List-Id: devicetree@vger.kernel.org

Hi Rob,

2016-12-03 1:26 GMT+09:00 Rob Herring <robh@kernel.org>:

>>
>>
>> (Plan A)
>>   "denali,socfpga-nand"           (for Altera SOCFPGA variant)
>>   "denali,uniphier-nand-v1"       (for old Socionext UniPhier family variant)
>>   "denali,uniphier-nand-v2"       (for new Socionext UniPhier family variant)
>>
>> (Plan B)
>>   "altera,denali-nand"            (for Altera SOCFPGA variant)
>>   "socionext,denali-nand-v5a"     (for old Socionext UniPhier family variant)
>>   "socionext,denali-nand-v5b"     (for new Socionext UniPhier family variant)

> Let the Altera folks worry about their stuff. At least for soft IP in
> FPGA, it's a bit of a special case. The old string can remain as bad
> as it is.


Hmm, I am not sure if this IP would fit in FPGA
(to use it along with NIOS-II?)

(even if it happened, nothing of this IP would be customizable on users' side.
When buying the IP, SoC vendors submit a list of desired features.
Denali (now Cadence) generates the RTL according to the configuration sheet.
The function is fixed at this point. So, generic compatible would be
useless anyway.)


If we are talking about SOCFPGA,
SOCFPGA is not only FPGA. Rather "SOC" + "FPGA".
It consists of two parts:
[1] SOC part  (Cortex-A9 + various hard-wired peripherals such UART,
USB, SD, NAND, ...)
[2] FPGA part (User design logic)

The Denali NAND controller is included in [1].
So, as far as we talk about the Denali on SOCFPGA,
it is as hard-wired as Intel, Socionext's ones.


> I simply would do "socionext,uniphier-v5b-nand" (and v5a).
> The fact that it is denali is part of the documentation.
>

Let me think about this.

Socionext bought two version of Denali IP,
and we are now re-using the newer one (v5b) for several SoCs.
Socionext has some more product lines other than Uniphier SoC family,
perhaps wider re-use might happen in the future.

At first, I included "uniphier" in compatible, but I am still wondering
if such a specific string is good or not.

Also, comments from Altera engineers are appreciated.


-- 
Best Regards
Masahiro Yamada

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
