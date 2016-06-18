From: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 1/2] ubi: mount partitions specified in device tree
Date: Sat, 18 Jun 2016 21:30:23 +0200
Message-ID: <5765A14F.6020201@nod.at>
References: <1466277476-14853-1-git-send-email-hauke@hauke-m.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1466277476-14853-1-git-send-email-hauke@hauke-m.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Hauke Mehrtens <hauke@hauke-m.de>, dwmw2@infradead.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, dedekind1@gmail.com, robh+dt@kernel.org, linux-mtd@lists.infradead.org, computersforpeace@gmail.com
List-Id: devicetree@vger.kernel.org

Am 18.06.2016 um 21:17 schrieb Hauke Mehrtens:
> This makes it possible to open a ubi layer in device tree, this is
> helpful when the rootfs is on a ubi layer. It loops though all mtd
> partitions and mounts the partition which is compatible with
> "ubi,volume". The same was only possible with kernel command line
> arguments before.
> 
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> ---
>  Documentation/devicetree/bindings/mtd/ubi.txt | 33 ++++++++++++++
>  drivers/mtd/ubi/block.c                       | 63 +++++++++++++++++++++++++++
>  2 files changed, 96 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/ubi.txt

Some time ago I thought about an UBI DT binding too, but
I have been told that device tree is only for describing the hardware
and nothing else.
So I fear this will be rejected by DT folks.

Thanks,
//richard


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
