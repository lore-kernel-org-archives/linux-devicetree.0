From: "Gupta, Pekon" <pekon@ti.com>
Subject: RE: [PATCH v5 1/3] mtd: nand: gpio: Add DT property to
 automatically determine bus width
Date: Wed, 27 Nov 2013 20:16:31 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA4FA0B@DBDE04.ent.ti.com>
References: <1384343884-29622-1-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1384343884-29622-1-git-send-email-shc_work@mail.ru>
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
To: Alexander Shiyan <shc_work@mail.ru>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Artem Bityutskiy <dedekind1@gmail.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <rob.herring@calxeda.com>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Eric Miao <eric.y.miao@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Alexander,

> From:  Alexander Shiyan
> This patch adds a property to automatically determine the NAND
> bus width by CFI/ONFI information from chip. This property works
> if the bus width is not specified explicitly.
> 
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
> ---
[...]

> --- a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
> @@ -19,6 +19,9 @@ Optional properties:
>    defaults to 1 byte.
>  - chip-delay : chip dependent delay for transferring data from array to
>    read registers (tR).  If not present then a default of 20us is used.
> +- gpio-control-nand,bank-width-auto : Device bus width is determined
> +  automatically by CFI/ONFI information from chip if "bank-width"
> +  parameter is omitted (Boolean).
> 
There is one important thing to understand here is that when a READ_ID
or READ_PARAM command is issued to NAND device, the read_data is
is transmitted only on lower 8-bit data lines. This is as per ONFI standard.
Therefore, irrespective of whether the NAND device is x8 or x16,
ONFI parameter page is always read in 8-bit mode.. 
--------------------------
[*] Reference: ONFI spec version 3.1 (section 3.5.3. Target Initialization)
    "The Read ID and Read Parameter Page commands only use the lower 8-bits
     of the data bus. The host shall not issue commands that use a word
     data width on x16 devices until the host determines the device supports
     a 16-bit data bus width in the parameter page."
--------------------------

Now this forms the basis of NAND_BUSWIDTH_AUTO, which allows
ONFI parameter parsing '@@nand_flash_detect_onfi()' only in 8-bit
mode. And once the actual width is known, then it re-configures the
driver while returning from nand_scan_ident().

Thus, in summary: To read on-chip ONFI parameters, your driver
should always be in 8-bit mode.
Using this as basis, we tried eliminate NAND_BUSWIDTH_AUTO and
instead implemented this requirement directly as part of generic
NAND driver in nand_base.c: nand_flash_detect_onfi().

Please refer following patch and subsequent discussion on same.
(It might help you understand that we don't need to explicitly
set have NAND_BUSWIDTH_AUTO, instead we can make it implicit
in our code while scanning NAND devices)

http://lists.infradead.org/pipermail/linux-mtd/2013-November/050252.html


with regards, pekon

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
