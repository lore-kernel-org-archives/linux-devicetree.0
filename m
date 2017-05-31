From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 5/5] mtd: mchp23k256: Add support for mchp23lcv1024
Date: Wed, 31 May 2017 12:52:09 -0500
Message-ID: <20170531175209.p3dnaagvaruekvjh@rob-hp-laptop>
References: <20170524234916.16181-1-chris.packham@alliedtelesis.co.nz>
 <20170524234916.16181-6-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170524234916.16181-6-chris.packham@alliedtelesis.co.nz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Mark Rutland <mark.rutland@arm.com>, andrew@lunn.ch, boris.brezillon@free-electrons.com, Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, May 25, 2017 at 11:49:16AM +1200, Chris Packham wrote:
> The mchp23lcv1024 is similar to the mchp23k256, the differences (from a
> software point of view) are the capacity of the chip and the size of the
> addresses used.
> 
> There is no way to detect the specific chip so we must be told via a
> Device Tree or default to mchp23k256 when device tree is not used.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> ---
> Changes in v2:
> - fix formatting in switch statement
> - add support for 24-bit addressing
> Changes in v3:
> - None
> Changes in v4:
> - reword commit message (thanks Andrew)
> - introduce mchp23_caps struct (thanks Boris)
> 
>  .../bindings/mtd/microchip,mchp23k256.txt          |  2 +-

I'd rather see a single binding patch than split like this, but it's 
fine.

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/mtd/devices/mchp23k256.c                   | 66 ++++++++++++++++++----
>  2 files changed, 57 insertions(+), 11 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
