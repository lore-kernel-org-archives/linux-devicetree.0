From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 5/5] ath9k: Make EEPROM endianness
	swapping configurable via devicetree
Date: Mon, 29 Aug 2016 14:10:44 +0200
Message-ID: <201608291410.44338.arnd@arndb.de>
References: <20160821144906.30984-1-martin.blumenstingl@googlemail.com>
	<2303906.Xe1WvCfP0V@wuerfel>
	<CAFBinCCK4zG7QXENpCgEr9wUgzinfr1ugEm3HepjE6c3RDqtVg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ath9k-devel-bounces@lists.ath9k.org>
In-Reply-To: <CAFBinCCK4zG7QXENpCgEr9wUgzinfr1ugEm3HepjE6c3RDqtVg@mail.gmail.com>
List-Unsubscribe: <https://lists.ath9k.org/mailman/listinfo/ath9k-devel>,
	<mailto:ath9k-devel-request@lists.ath9k.org?subject=unsubscribe>
List-Archive: <http://lists.ath9k.org/pipermail/ath9k-devel>
List-Post: <mailto:ath9k-devel@lists.ath9k.org>
List-Help: <mailto:ath9k-devel-request@lists.ath9k.org?subject=help>
List-Subscribe: <https://lists.ath9k.org/mailman/listinfo/ath9k-devel>,
	<mailto:ath9k-devel-request@lists.ath9k.org?subject=subscribe>
Sender: ath9k-devel-bounces@lists.ath9k.org
Errors-To: ath9k-devel-bounces@lists.ath9k.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, ath9k-devel@qca.qualcomm.com, robh+dt@kernel.org, ath9k-devel@lists.ath9k.org, chunkeey@googlemail.com, kvalo@codeaurora.org, nbd@nbd.name
List-Id: devicetree@vger.kernel.org

On Sunday 28 August 2016, Martin Blumenstingl wrote:
> On Mon, Aug 22, 2016 at 1:52 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> > On Sunday, August 21, 2016 4:49:06 PM CEST Martin Blumenstingl wrote:
> >> +- qca,check-eeprom-endianness: When enabled, the driver checks if the
> >> +                               endianness of the EEPROM (using two checks,
> >> +                               one is based on the two magic bytes at the
> >> +                               start of the EEPROM and a second one which
> >> +                               relies on a flag within the EEPROM data)
> >> +                               matches the host system's native endianness.
> >> +                               The data will be swapped accordingly if there
> >> +                               is a mismatch.
> >> +                               Leaving this disabled means that the EEPROM
> >> +                               data will always be interpreted in the
> >> +                               system's native endianness.
> >> +                               Enable this option only when the EEPROMs
> >> +                               endianness identifiers are known to be
> >> +                               correct, because otherwise the EEPROM data
> >> +                               may be swapped and thus interpreted
> >> +                               incorrectly.
> >
> > The property should not describe the driver behavior, but instead
> > describe what the hardware is like.
> >
> > A default of "system's native endianess" should not be specified
> > in a binding, as the same DTB can be used with both big-endian or
> > little-endian kernels on some architectures (ARM and PowerPC among
> > others), so disabling the property means that it is guaranteed to
> > be broken on one of the two.
> OK, I went back to have a separate look at the whole issue again.
> Let's recap, there are two types of swapping:
> 1. swab16 for the whole EEPROM data
> 2. EEPROM format specific swapping (for all u16 and u32 values)

Right, this is part of what makes the suggested DT property
a bit problematic (it's not obvious which swap is referred to),
though the other part is more important.

Note that for #1, there isn't really a big-endian and a little-endian
variant, only one that is correct and one that is incorrect (i.e.
fields are in the wrong place). In either case, it should be
independent of the CPU endianess.

> Actually I am not 100% sure what #1 exists. In OpenWrt and LEDE it's
> only used by the brcm63xx and lantiq targets (I personally have only
> lantiq based devices, so that's what I can test with).

Ok.

> Without patch 4 from this series the EEPROM data is loaded like this:
> 1. out of tree code extracts the EEPROM data from NOR/SPI/NAND flash
> 2. board specific entry (usually device-tree) tells the code to apply
> swab16 to the data
> 3. board specific entry (usually device-tree again) sets the
> "endian_check" property in the ath9k_platform_data to true
> 4.a ath9k sees that the magic bytes are not matching and applies swab16
> 4.b while doing that it notifies the EEPROM format specific swapping
> 
> However, with patch 4 from this series steps 4.a and 4.b are replaced with:
> 4. ath9k checks the eepMisc field of the EEPROM and applies the EEPROM
> format specific swapping

I think the intention of the patch is right, but it needs to go further:
It seems wrong to have 'u32' members e.g. in

struct modal_eep_ar9287_header {
        u32 antCtrlChain[AR9287_MAX_CHAINS];
        u32 antCtrlCommon;

and then do a swab32() on them. I suspect these should just be __le32 
(and __le16, respectively where needed), using appropriate accessors
everywhere that those fields are being read instead of having one function
that tries to turn them into cpu-native ordering.

If we can manage to convert the code into doing this consistently,
maybe only the 16-bit swaps of the data stream are left over.

	Arnd
