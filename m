From: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v3 0/5] MTD: Add Initial Hyperbus support
Date: Wed, 17 Apr 2019 22:54:36 +0530
Message-ID: <9e8575e2-b8de-341d-7ab5-08055b84c805@ti.com>
References: <20190412092923.24919-1-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20190412092923.24919-1-vigneshr@ti.com>
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
To: Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: devicetree@vger.kernel.org, Mason Yang <masonccyang@mxic.com.tw>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Boris Brezillon <bbrezillon@kernel.org>, nsekhar@ti.com, linux-kernel@vger.kernel.org, Joakim Tjernlund <Joakim.Tjernlund@infinera.com>, linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On 12/04/19 2:59 PM, Vignesh Raghavendra wrote:
> Vignesh Raghavendra (5):
>    mtd: cfi_cmdset_0002: Add support for polling status register
>    dt-bindings: mtd: Add binding documentation for HyperFlash
>    mtd: Add support for HyperBus memory devices
>    dt-bindings: mtd: Add bindings for TI's AM654 HyperBus memory
>      controller
>    mtd: hyperbus: Add driver for TI's HyperBus memory controller
> 

Thanks for all the reviews!
Were you able to test this series with your hardware? Would like to get 
this into v5.2-rc1 if possible

Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
