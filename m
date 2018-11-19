From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: NAND Flash memory timings when using non-ONFI chips
Date: Mon, 19 Nov 2018 11:54:52 +0100
Message-ID: <20181119115452.6134c0fb@bbrezillon>
References: <CAGkQfmOQZFvOdhFTvL3UtfAzBLR+dWfCpkDMv5KajjwY=KJkog@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <CAGkQfmOQZFvOdhFTvL3UtfAzBLR+dWfCpkDMv5KajjwY=KJkog@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Romain Izard <romain.izard.pro@gmail.com>
Cc: devicetree@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, Miquel Raynal <miquel.raynal@bootlin.com>
List-Id: devicetree@vger.kernel.org

On Mon, 19 Nov 2018 11:46:15 +0100
Romain Izard <romain.izard.pro@gmail.com> wrote:

> Hello,
> 
> Having used the Microchip SAMA5D2 for some time, I have some devices that
> work with the legacy device tree bindings for the atmel_nand controller.
> While updating from 4.14 to 4.19, I am trying to use the updated bindings
> instead.
> 
> However I have encountered a problem with the timings configured in the NAND
> controller. When using the legacy bindings, the hardware timings that have
> been written by the bootloader are left alone, but with the new bindings
> they are recalculated, using the ONFI table.
> 
> When using non-ONFI devices (which is very common, as Toshiba, Samsung, etc.
> don't implement ONFI), the timings are configured to the work with the
> slowest ONFI class, which is very slow compared to the possible performance
> of those chips.
> 
> For the atmel_nand driver, the root of the difference is that there is no
> clock available in the "mck" field of the nand_controller structure in the
> legacy binding, and as a result the setup_data_interface() hook is empty.
> But this is a problem that could affect any NAND controller that implements
> the setup_data_interface() hook.
> 
> Unfortunately, I have a hard time finding a satisfying solution to this:
> - Adding a property to the NAND chip's device tree node, directing the NAND
>   driver to preserve the bootloader's timings is quite easy, but this is not
> a good solution as we are adding software information to the hardware
> description
> - Adding a property indicating that the Flash chip is not ONFI is redundant,
>   as detecting whether a chip supports ONFI can be autodetected. But the
> Reset command, that must be sent to ONFI chips on startup to reliably to
> detect them, needs to be sent with the slowest ONFI timings to work
> correctly with chips using the ONFI DDR mode. As a result, auto-detection
> needs to change the NAND controller's timings to detect ONFI chips.
> 
> The 'best' answer I have for now, is to add a 'timings' subnode to the NAND
> chip's device tree node, that explicitly encodes all the values from the
> timing table as described in "struct nand_sdr_timings", which is derived
> from the ONFI specification, and extend it to add the various values that
> are present in the timing table for Toshiba NAND chips and compatibles.
> 
> But I am not very satisfied with this solution, as it adds a lot of code
> for little gain.
> 
> What was the original plan for handling timing requirements for non-ONFI
> chips when introducing setup_data_interface()?

There's a ->onfi_default_timing_mode field in struct nand_chip. NAND
chip drivers (in your case nand_toshiba.c) should update this field
appropriately at detection time (in their ->init() hook) so that the
core applies ONFI timing mode X by default.

Hope that helps. Let me know if you have other questions or if my
suggestion does not work.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
