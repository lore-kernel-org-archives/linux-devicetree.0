From: Anton Vorontsov <avorontsov@ru.mvista.com>
Subject: Re: [PATCH] ndfc driver
Date: Tue, 9 Dec 2008 05:11:15 +0300
Message-ID: <20081209021115.GA13948@oksana.dev.rtsoft.ru>
References: <20081203222832.3fc77d28@lappy.seanm.ca>
	<20081204090107.20269571@zod.rchland.ibm.com>
	<20081208193446.37e27e26@lappy.seanm.ca>
Reply-To: avorontsov@ru.mvista.com
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20081208193446.37e27e26@lappy.seanm.ca>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: linux-mtd-bounces@lists.infradead.org
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Sean MacLennan <smaclennan@pikatech.com>
Cc: linuxppc-dev@ozlabs.org, devicetree-discuss@ozlabs.org, linux-mtd@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Sean,

On Mon, Dec 08, 2008 at 07:34:46PM -0500, Sean MacLennan wrote:
> On Thu, 4 Dec 2008 09:01:07 -0500
> "Josh Boyer" <jwboyer@linux.vnet.ibm.com> wrote:
> 
> > In addition to an example DTS patch (probably to warp itself), could
> > you briefly write up a binding and put it in
> > Documentation/powerpc/dts-bindings/amcc (or similar)?  Also please CC
> > the devicetree-discuss list on that part.
> 
> Here is a start at the doc. I have sent it as a patch, but could just
> as easily send raw text.
> 
> The example comes from the warp dts, just with less partitions, so I
> have not included a warp dts patch here.
> 
> Cheers,
>    Sean
> 
> diff --git a/Documentation/powerpc/dts-bindings/amcc/ndfc.txt
> b/Documentation/powerpc/dts-bindings/amcc/ndfc.txt new file mode 100644
> index 0000000..668f4a9
> --- /dev/null
> +++ b/Documentation/powerpc/dts-bindings/amcc/ndfc.txt
> @@ -0,0 +1,31 @@
> +AMCC NDFC (NanD Flash Controller)
> +
> +Required properties:
> +- compatible : "amcc,ndfc".
> +- reg : should specify chip select and size used for the chip (0x2000).
> +
> +Optional properties:
> +- ccr : NDFC config and control register value (default 0).
> +- bank-settings : NDFC bank configuration register value (default 0).
> +- partition(s) - follows the OF MTD standard for partitions
> +
> +Example:
> +
> +nand@1,0 {
> +	compatible = "amcc,ndfc";

The first line in this file says that this is a controller...

> +	reg = <0x00000001 0x00000000 0x00002000>;
> +	ccr = <0x00001000>;
> +	bank-settings = <0x80002222>;
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	partition@0 {

So this is a controller with partitions? ;-)

Recalling my own mistakes with the FSL UPM NAND controller bindings,
and Josh's comment:

http://www.mail-archive.com/linuxppc-dev@ozlabs.org/msg16572.html

I think the bindings should look like this:

nand-controller@.. {
	...controller's properties...

	nand-chip@... {
		...chip's properties...

		partition@... {
			...partition's properties...
		};
	};

	nand-chip@... {
		...
	};
};

Sure, I understand that there are plenty of boards with the "old"
scheme flashed into the firmware... Just something you might
want to consider for the future updates for the driver/bindings.

Thanks,

-- 
Anton Vorontsov
email: cbouatmailru@gmail.com
irc://irc.freenode.net/bd2

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
