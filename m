From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: mtd: Altera ASMI Parallel II IP Core
Date: Wed, 27 Sep 2017 16:52:26 -0500
Message-ID: <20170927215226.ogcewa22dqc2jf3f@rob-hp-laptop>
References: <1505932139-2905-1-git-send-email-matthew.gerlach@linux.intel.com>
 <1505932139-2905-2-git-send-email-matthew.gerlach@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1505932139-2905-2-git-send-email-matthew.gerlach@linux.intel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: matthew.gerlach@linux.intel.com
Cc: vndao@altera.com, boris.brezillon@free-electrons.com, mchehab@kernel.org, devicetree@vger.kernel.org, hean.loong.ong@intel.com, richard@nod.at, linux-fpga@vger.kernel.org, linux-kernel@vger.kernel.org, marek.vasut@gmail.com, gregkh@linuxfoundation.org, linux-mtd@lists.infradead.org, cyrille.pitchen@wedev4u.fr, mark.rutland@arm.com, computersforpeace@gmail.com, dwmw2@infradead.org, davem@davemloft.net, tien.hock.loh@intel.com
List-Id: devicetree@vger.kernel.org

On Wed, Sep 20, 2017 at 11:28:57AM -0700, matthew.gerlach@linux.intel.com wrote:
> From: Matthew Gerlach <matthew.gerlach@linux.intel.com>
> 
> Device Tree bindings for Altera ASMI Parallel II IP Core
> connected to a flash chip.
> 
> Signed-off-by: Matthew Gerlach <matthew.gerlach@linux.intel.com>
> ---
> v2:
>     Made substitutions suggested by Rob Herring.
>     Emphasize driver expects controller is connected to spi-nor flash.
> ---
>  Documentation/devicetree/bindings/mtd/altera-asmip2.txt | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/altera-asmip2.txt

Acked-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
