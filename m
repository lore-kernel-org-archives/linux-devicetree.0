From: masonccyang@mxic.com.tw
Subject: Re: [PATCH v4 1/2] mtd: rawnand: Add Macronix Raw NAND controller
Date: Wed, 3 Jul 2019 11:03:21 +0800
Message-ID: <OF041E283A.13DCC1D9-ON4825842C.000C9C7C-4825842C.0010C960@mxic.com.tw>
References: <1561443056-13766-1-git-send-email-masonccyang@mxic.com.tw>	<1561443056-13766-2-git-send-email-masonccyang@mxic.com.tw>
 <20190627193635.29abff43@xps13>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20190627193635.29abff43@xps13>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: devicetree@vger.kernel.org, christophe.kerello@st.com, vigneshr@ti.com, jianxin.pan@amlogic.com, bbrezillon@kernel.org, juliensu@mxic.com.tw, lee.jones@linaro.org, linux-kernel@vger.kernel.org, stefan@agner.ch, paul@crapouillou.net, marek.vasut@gmail.com, paul.burton@mips.com, broonie@kernel.org, linux-mtd@lists.infradead.org, richard@nod.at, anders.roxell@linaro.org, liang.yang@amlogic.com, computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: devicetree@vger.kernel.org


Hi Miquel,

> > Add a driver for Macronix raw NAND controller.
> 
> Could you pass userspace major MTD tests and can you attach/mount/edit
> a UBI/UBIFS storage?

The other userspace MTD tests are passed.

nandwrite, nanddump and nandtest.
i.e.,
zynq> ./nandtest -k /dev/mtd1
ECC corrections: 0
ECC failures   : 0
Bad blocks     : 0
BBT blocks     : 0
00100000: writing...random: crng init done
005c0000: checking...
Finished pass 1 successfully
zynq>


UBI/UBI-FS test is also passed.
i.e.,
UBI/UBIFS storage test on mtd2 as example
1. ubiformat /dev/mtd2
2. ubiattach /dev/ubi_ctrl -m 2
3. ubimkvol /dev/ubi0 -N ubifs -m
4. mknod -m 777 /dev/ubi0 c 244 0
5. mount -t ubifs ubi0_0 /mnt/ubifs
6. copy a file to /mnt/ubifs
7. sync and power off - on cycle
8. ubiattach & mount /mnt/ubifs
9. read file and compare it with md5sum

thanks & best regards,
Mason

CONFIDENTIALITY NOTE:

This e-mail and any attachments may contain confidential information 
and/or personal data, which is protected by applicable laws. Please be 
reminded that duplication, disclosure, distribution, or use of this e-mail 
(and/or its attachments) or any part thereof is prohibited. If you receive 
this e-mail in error, please notify us immediately and delete this mail as 
well as its attachment(s) from your system. In addition, please be 
informed that collection, processing, and/or use of personal data is 
prohibited unless expressly permitted by personal data protection laws. 
Thank you for your attention and cooperation.

Macronix International Co., Ltd.

=====================================================================



============================================================================

CONFIDENTIALITY NOTE:

This e-mail and any attachments may contain confidential information and/or personal data, which is protected by applicable laws. Please be reminded that duplication, disclosure, distribution, or use of this e-mail (and/or its attachments) or any part thereof is prohibited. If you receive this e-mail in error, please notify us immediately and delete this mail as well as its attachment(s) from your system. In addition, please be informed that collection, processing, and/or use of personal data is prohibited unless expressly permitted by personal data protection laws. Thank you for your attention and cooperation.

Macronix International Co., Ltd.

=====================================================================


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
