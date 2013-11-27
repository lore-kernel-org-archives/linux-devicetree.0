From: =?UTF-8?B?QWxleGFuZGVyIFNoaXlhbg==?= <shc_work@mail.ru>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2NSAxLzNdIG10ZDogbmFuZDogZ3BpbzogQWRkIERUIHBy?=
 =?UTF-8?B?b3BlcnR5IHRvIGF1dG9tYXRpY2FsbHkgZGV0ZXJtaW5lIGJ1cyB3aWR0aA==?=
Date: Wed, 27 Nov 2013 08:21:18 +0400
Message-ID: <1385526078.44550720@f276.i.mail.ru>
References: <1384343884-29622-1-git-send-email-shc_work@mail.ru>
 <20131127012158.GR9468@ld-irv-0074.broadcom.com>
Reply-To: =?UTF-8?B?QWxleGFuZGVyIFNoaXlhbg==?= <shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20131127012158.GR9468@ld-irv-0074.broadcom.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: =?UTF-8?B?QnJpYW4gTm9ycmlz?= <computersforpeace@gmail.com>
Cc: =?UTF-8?B?TWFyayBSdXRsYW5k?= <mark.rutland@arm.com>, devicetree@vger.kernel.org, =?UTF-8?B?UnVzc2VsbCBLaW5n?= <linux@arm.linux.org.uk>, =?UTF-8?B?UGF3ZWwgTW9sbA==?= <pawel.moll@arm.com>, =?UTF-8?B?SWFuIENhbXBiZWxs?= <ijc+devicetree@hellion.org.uk>, =?UTF-8?B?QXJ0ZW0gQml0eXV0c2tpeQ==?= <dedekind1@gmail.com>, =?UTF-8?B?Um9iIEhlcnJpbmc=?= <rob.herring@calxeda.com>, linux-mtd@lists.infradead.org, =?UTF-8?B?SGFvamlhbiBaaHVhbmc=?= <haojian.zhuang@gmail.com>, =?UTF-8?B?U3RlcGhlbiBXYXJyZW4=?= <swarren@wwwdotorg.org>, =?UTF-8?B?RXJpYyBNaWFv?= <eric.y.miao@gmail.com>, =?UTF-8?B?RGF2aWQgV29vZGhvdXNl?= <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

...
> We're dealing with a similar issue in other drivers currently, and I
> think it's worth straightening out the issue for all systems.
> 
> On Wed, Nov 13, 2013 at 03:58:02PM +0400, Alexander Shiyan wrote:
> > This patch adds a property to automatically determine the NAND
> > bus width by CFI/ONFI information from chip. This property works
> > if the bus width is not specified explicitly.
> 
> This issue brings up a few questions in my mind, which are relevant to
> device tree in general.
> 
> First of all, do we need a device tree property at all, for something
> that is auto-detectable?
> 
> Related: is a device tree consumer (like Linux) supposed to be a
> validator, or simply a best-effort? I'm considering the following case:
> if Linux is allowed to auto-detect some property which also has a device
> tree binding (e.g., "nand-bus-width", in
> Documentation/devicetree/bindings/mtd/nand.txt), what should happen if
> the binding happens to be incorrect? IOW, what if the device tree
> specifies buswidth is x16, but Linux correctly detects it as x8?
> Shouldn't we make the best effort to bring the hardware up, regardless
> of what the device tree says?
> 
> So for something like this GPIO driver, I'm thinking that Linux should
> just use NAND_BUSWIDTH_AUTO all the time [*]. But (as I'm hinting above)
> that would allow DTB firmware implementors to be lazier and have a
> technically-incorrect "nand-bus-width" or "bank-width" binding, since
> they know it can reliably be detected and overridden by Linux.
> 
> [*] Except where resource_size(res) < 2, as Alexander already has in
> this patch.
> 
> > Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
> > ---
> >  .../devicetree/bindings/mtd/gpio-control-nand.txt        |  3 +++
> >  drivers/mtd/nand/gpio.c                                  | 16 ++++++++++++----
> >  2 files changed, 15 insertions(+), 4 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
> > index 36ef07d..fe4e960 100644
> > --- a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
> > +++ b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
> > @@ -19,6 +19,9 @@ Optional properties:
> >    defaults to 1 byte.
> >  - chip-delay : chip dependent delay for transferring data from array to
> >    read registers (tR).  If not present then a default of 20us is used.
> > +- gpio-control-nand,bank-width-auto : Device bus width is determined
> > +  automatically by CFI/ONFI information from chip if "bank-width"
> > +  parameter is omitted (Boolean).
> 
> If we do resort to a new binding for auto-buswidth, it should be a
> generic one that all NAND drivers can use. Maybe a separate boolean
> "nand-bus-width-auto" and if it is present, then it overrules the
> presence (or lack) of the "nand-bus-width" boolean property?
> Or is it possible to extend "nand-bus-width" to allow the value of 0 to
> mean automatic?

This was be my first implementation of this feature, but rejected...
http://permalink.gmane.org/gmane.linux.drivers.mtd/47302

---
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
