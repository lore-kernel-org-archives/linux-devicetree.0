From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] [PATCH v4] mtd:spi-nor: Add Altera Quad SPI Driver
Date: Mon, 17 Aug 2015 09:03:38 -0700
Message-ID: <20150817160338.GN60523@google.com>
References: <1433316644-3748-1-git-send-email-vndao@altera.com>
 <20150724183749.GI8876@google.com>
 <CAN1oZWx1z0vq_8csMx3bs70ULfhR03CgX=NtTBj1HiLA8FdZjg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAN1oZWx1z0vq_8csMx3bs70ULfhR03CgX=NtTBj1HiLA8FdZjg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Viet Nga Dao <vndao-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 27, 2015 at 03:10:23PM +0800, Viet Nga Dao wrote:
> On Sat, Jul 25, 2015 at 2:37 AM, Brian Norris
> <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > On Wed, Jun 03, 2015 at 12:30:44AM -0700, vndao-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org wrote:
> >> From: VIET NGA DAO <vndao-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
> >>
> >> Altera Quad SPI Controller is a soft IP which enables access to
> >> Altera EPCS, EPCQ and Mircon flash chips. This patch adds driver
> >> for these devices.
> >>
> >> Signed-off-by: VIET NGA DAO <vndao-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
> >>
> >> ---
> >> v4:
> >> - Add more flash devices support ( EPCQL and Micron)
> >
> > ^^ Unfortunately, I think you've added yourself another burden with this
> > one. Most of the rest actually is looking pretty good, so it's sad to
> > see this hold your driver back. Comments below.

FWIW, this comment still stands. I cannot take your patch as-is.

> >> - Remove redundant messages
> >> - Change EPCQ_OPCODE_ID to NON_EPCS_OPCODE_ID
> >> - Replace get_flash_name to altera_quadspi_scan
> >> - Remove clk related parts
> >> - Remove altera_quadspi_plat
> >> - Change device tree reg name and remove opcode-id
> >>
> >> v3:
> >> - Change altera_epcq driver name to altera_quadspi for more generic name
> >> - Implement flash name searching in altera_quadspi.c instead of spi-nor
> >> - Edit the altra quadspi info table in spi-nor
> >> - Remove wait_til_ready in all read,write, erase, lock, unlock functions
> >> - Merge .h and .c into 1 file
> >>
> >> v2:
> >> - Change to spi_nor structure
> >> - Add lock and unlock functions for spi_nor
> >> - Simplify the altera_epcq_lock function
> >> - Replace reg by compatible in device tree
> >> ---
> >>  .../devicetree/bindings/mtd/altera-quadspi.txt     |   49 ++
> >>  drivers/mtd/spi-nor/Kconfig                        |    8 +
> >>  drivers/mtd/spi-nor/Makefile                       |    1 +
> >>  drivers/mtd/spi-nor/altera-quadspi.c               |  568 ++++++++++++++++++++
> >>  drivers/mtd/spi-nor/spi-nor.c                      |   30 +
> >>  5 files changed, 656 insertions(+), 0 deletions(-)
> >>  create mode 100644 Documentation/devicetree/bindings/mtd/altera-quadspi.txt
> >>  create mode 100644 drivers/mtd/spi-nor/altera-quadspi.c
> >>
> >> diff --git a/Documentation/devicetree/bindings/mtd/altera-quadspi.txt b/Documentation/devicetree/bindings/mtd/altera-quadspi.txt
> >> new file mode 100644
> >> index 0000000..2873319
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/mtd/altera-quadspi.txt
> >> @@ -0,0 +1,49 @@
> >> +* MTD Altera QUADSPI driver
> >> +
> >> +Required properties:
> >> +- compatible: Should be "altr,quadspi-1.0"
> >> +- reg: Address and length of the register set  for the device. It contains
> >> +  the information of registers in the same order as described by reg-names
> >> +- reg-names: Should contain the reg names
> >> +  "avl_csr": Should contain the register configuration base address
> >> +  "avl_mem": Should contain the data base address
> >> +- #address-cells: Must be <1>.
> >> +- #size-cells: Must be <0>.
> >> +- flash device tree subnode, there must be a node with the following fields:
> >> +     - compatible: Should contain the flash name:
> >> +       1. EPCS:   epcs16, epcs64, epcs128
> >> +       2. EPCQ:   epcq16, epcq32, epcq64, epcq128, epcq256, epcq512, epcq1024
> >> +       3. EPCQ-L: epcql256, epcql512, epcql1024
> >> +       4. Mircon: n25q016-nonjedec, n25q032-nonjedec, n25q064-nonjedec,
> >> +                  n25q128a13-nonjedec, n25q128a11-nonjedec, n25q256a-nonjedec,
> >> +                  n25q256a11-nonjedec, n25q512a-nonjedec, n25q512ax3-nonjedec,
> >> +                  mt25ql512-nonjedec, n25q00-nonjedec, n25q00a11-nonjedec
> >
> > OK, so you're adding a bunch of Micron flashes which already have
> > support via standard DT bindings and spi-nor library code, except now
> > you're adding "-nonjedec" to all of them. You better have a *really*
> > good reason for this. Are these flash not compatible with the JEDEC READ
> > ID opcode, by which every other system identifies these parts? Or are
> > you adding these names because of limitations in your controller? For
> > the former, I might be able to understand the need, but for the latter,
> > I'm much disinclined to support this. There's got to be a better way.
> >
> 
> Hi Brian,
> It is really unfortunate that this controller is not able to read full
> JEDEC ID. It only can provide 1 byte ID. I did discuss with IP
> designer about this, but it is really unfortunate that they are not
> able to fix that issue. Hence it requires software to make changes.

Wow, what a joke. (Please quote me to your IP "designer.")

In any case, there's no way I'm going to support a ton of new
"*-nonjedec" strings just to support your completely broken controller.
These aren't actually "nonjedec" flash devices, and AFAICT, there's
absolutely nothing wrong with the flash that requires this description.
It's purely your controller's fault.

Thus, I'm not changing the DT binding for all the flash you want to use.

Instead, I think we need to assume that your controller is completely
incapable of identifying the flash that's attached to it, and instead
just rely on specifying this entirely in the device tree. Then, we need
a flag for your driver to notify spi-nor.c that it can't trust the READ
ID command at all, and it must instead rely strictly on flash string
matching. e.g. something like:

	ret = of_modalias_node(np, name, sizeof(name)); /* e.g., name = "n25q016" */
	if (ret < 0)
		return ret;
	nor->controller_flags |= SPI_NOR_MY_CONTROLLER_SUCKS_AND_CANT_DO_READID;
	ret = spi_nor_scan(nor, name, mode);

along with something like this in spi-nor.c:

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 47df4b5eae2f..04d3aa7ec641 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -709,6 +709,11 @@ static const struct spi_device_id *spi_nor_read_id(struct spi_nor *nor)
 	u8			id[SPI_NOR_MAX_ID_LEN];
 	struct flash_info	*info;
 
+	if (nor->my_foo_flags & SPI_NOR_MY_CONTROLLER_SUCKS_AND_CANT_DO_READID) {
+		dev_err(nor->dev, "READ ID not supported\n");
+		return ERR_PTR(-EOPNOTSUPP);
+	}
+
 	tmp = nor->read_reg(nor, SPINOR_OP_RDID, id, SPI_NOR_MAX_ID_LEN);
 	if (tmp < 0) {
 		dev_dbg(nor->dev, " error %d reading JEDEC ID\n", tmp);
@@ -1018,6 +1023,10 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 
 	if (name)
 		id = spi_nor_match_id(name);
+	if (!id && (nor->my_foo_flags & SPI_NOR_MY_CONTROLLER_SUCKS_AND_CANT_DO_READID)) {
+		dev_err(dev, "no matching device found, and your controller sucks\n");
+		return -ENODEV;
+	}
 	/* Try to auto-detect if chip name wasn't specified or not found */
 	if (!id)
 		id = spi_nor_read_id(nor);

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
