From: boris brezillon <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [RFC PATCH 0/9] mtd: nand: add sunxi NAND Flash
 Controller support
Date: Sat, 11 Jan 2014 14:38:22 +0100
Message-ID: <52D1494E.9090303@overkiz.com>
References: <1389190924-26226-1-git-send-email-b.brezillon@overkiz.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Return-path: <linux-sunxi+bncBDGNFFFRWEIBB5USYWLAKGQEUWLCT2I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1389190924-26226-1-git-send-email-b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, Boris BREZILLON <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 08/01/2014 15:21, Boris BREZILLON wrote:
> Hello,
>
> This series add the sunxi NFC support with up to 8 NAND chip connected.
> I'm still in the early stages drivers development and some key features are
> missing, but it's usable (I tested it on the cubietruck board).
>
> Here's what's missing:
>   - HW ECC support
>   - DMA support
>   - HW randomization support
>   - many more improvements
>
> This series depends on Emilio's patch series implementing mod0 clks
> (http://lists.infradead.org/pipermail/linux-arm-kernel/2013-July/185478.html)
> + an other patch not yet posted
> (http://git.elopez.com.ar/linux/commits/5b4eb3ac406b9c98965714d40e8dd6da943d1ab0)

During my reasearch regarding the HW ECC and HW randomizer of the Allwinner
NAND flash controller I found this document describing the Altera NAND 
flash controller
(which is in turn based on a cadence IP):

http://www.altera.com/literature/hb/arria-v/av_54010.pdf

This really looks like the sunxi NAND flash controller (except for the 
registers positions
and contents) ;-)

>
> Best Regards,
>
> Boris
>
> Boris BREZILLON (9):
>    mtd: nand: retrieve ECC requirements from Hynix READ ID byte 4
>    mtd: nand: define struct nand_timings
>    of: mtd: add NAND timings retrieval support
>    of: mtd: add NAND timings bindings documentation
>    mtd: nand: add sunxi NFC support
>    mtd: nand: add sunxi NFC dt bindings doc
>    ARM: dt/sunxi: add NFC node to Allwinner A20 SoC
>    ARM: dt/sunxi: add NFC pinctrl pin definitions
>    ARM: sunxi/dt: enable NAND on cubietruck board
>
>   Documentation/devicetree/bindings/mtd/nand.txt     |   34 +
>   .../devicetree/bindings/mtd/sunxi-nand.txt         |   71 ++
>   arch/arm/boot/dts/sun7i-a20-cubietruck.dts         |   33 +
>   arch/arm/boot/dts/sun7i-a20.dtsi                   |   35 +
>   drivers/mtd/nand/Kconfig                           |    6 +
>   drivers/mtd/nand/Makefile                          |    1 +
>   drivers/mtd/nand/nand_base.c                       |   37 ++
>   drivers/mtd/nand/sunxi_nfc.c                       |  700 ++++++++++++++++++++
>   drivers/of/of_mtd.c                                |   47 ++
>   include/linux/mtd/nand.h                           |   44 ++
>   include/linux/of_mtd.h                             |    9 +
>   11 files changed, 1017 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/mtd/sunxi-nand.txt
>   create mode 100644 drivers/mtd/nand/sunxi_nfc.c
>
