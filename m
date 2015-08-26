From: Bill Pringlemeir <bpringle@sympatico.ca>
Subject: Re: [PATCH v10 3/5] mtd: nand: vf610_nfc: add device tree bindings
Date: Wed, 26 Aug 2015 11:26:36 -0400
Message-ID: <BLU436-SMTP1971442F63D96D55AC8E905B8600@phx.gbl>
References: <1438594050-4595-1-git-send-email-stefan@agner.ch>
 <1438594050-4595-4-git-send-email-stefan@agner.ch>
 <20150825202546.GL81844@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Brian Norris <computersforpeace@gmail.com>
Cc: mark.rutland@arm.com, boris.brezillon@free-electrons.com, aaron@tastycactus.com, marb@ixxat.de, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, bpringlemeir@gmail.com, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>, albert.aribaud@3adev.fr, klimov.linux@gmail.com, sebastian@breakpoint.cc, robh+dt@kernel.org, linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, galak@codeaurora.org, shawn.guo@linaro.org, dwmw2@infradead.org, devicetree@vger.kernel.org, Bill Pringlemeir <bpringlemeir@nbsps.com>
List-Id: devicetree@vger.kernel.org

On 25 Aug 2015, computersforpeace@gmail.com wrote:

> Sorry, I realized a potential issue here.

> On Mon, Aug 03, 2015 at 11:27:28AM +0200, Stefan Agner wrote:
>> Signed-off-by: Bill Pringlemeir <bpringlemeir@nbsps.com>
>> Acked-by: Shawn Guo <shawnguo@kernel.org>
>> Reviewed-by: Brian Norris <computersforpeace@gmail.com>
>> Signed-off-by: Stefan Agner <stefan@agner.ch>
>> ---
>> .../devicetree/bindings/mtd/vf610-nfc.txt | 45 ++++++++++++++++++++++
>> 1 file changed, 45 insertions(+) create mode 100644
>> Documentation/devicetree/bindings/mtd/vf610-nfc.txt

>> diff --git a/Documentation/devicetree/bindings/mtd/vf610-nfc.txt
>> b/Documentation/devicetree/bindings/mtd/vf610-nfc.txt
>> new file mode 100644
>> index 0000000..cae5f25
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/vf610-nfc.txt
>>>> -0,0 +1,45 @@
>> +- nand-bus-width: see nand.txt
>> +- nand-ecc-mode: see nand.txt
>> +- nand-on-flash-bbt: see nand.txt

> Stumbling across the "multi-CS" questions on the driver reminds me: it
> typically makes sense to define new NAND bindings using separate NAND
> *controller* and *flash* device nodes. The above 3 properties, at
> least, would apply on a per-flash basis, not per-controller
> typically. See sunxi-nand, for instance:

> http://lxr.free-electrons.com/source/Documentation/devicetree/bindings/mtd/sunxi-nand.txt

> brcmnand had a similar pattern:

> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt

> (Perhaps it's time we standardized this a little more formally...)

These would apply per chip, but the controller has to be configured to
support each and every one.  Every time an operation was performed, we
would have to check the chip type and reconfigure the controller.
Currently, the driver does not support this and it would add a lot of
overhead in some cases unless a register cache was used.

Is the flexibility of using a system with combined 8/16bit devices
really worth all the overhead?  Isn't it sort of brain dead hardware not
to make all of the chips similar?  Why would everyone have to pay for
such a crazy setup?

To separate it would at least be a lie versus the code in the current
form.  As well, there are only a few SOC which support multiple chip
selects.  The 'multi-CS' register bits of this controller varies between
PowerPC, 68K/Coldfire and ARM platforms.

I looked briefly at the brcmnand.c  and it seems that it is not
supporting different ECC per chip even though the nodes are broken out
this way.  In fact, if some raw functions are called, I think it will
put it in ECC mode even if it wasn't before?  Well, I agree that this
would be good generically, I think it puts a lot of effort in the
drivers for not so much payoff?

Fwiw,
Bill Pringlemeir.
