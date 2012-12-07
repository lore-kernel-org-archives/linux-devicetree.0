From: Holger Brunck <holger.brunck@keymile.com>
Subject: Re: [PATCH] mtd: cfi_cmdset_0002: Support Persistent Protection Bits
 (PPB) locking
Date: Fri, 07 Dec 2012 11:41:58 +0100
Message-ID: <50C1C7F6.9010504@keymile.com>
References: <1354864954-30290-1-git-send-email-sr@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1354864954-30290-1-git-send-email-sr@denx.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: linux-mtd-bounces@lists.infradead.org
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Stefan Roese <sr@denx.de>
Cc: devicetree-discuss@ozlabs.org, linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Stefan,

On 12/07/2012 08:22 AM, Stefan Roese wrote:
> Currently cfi_cmdset_0002.c does not support PPB locking of sectors. This
> patch adds support for this locking/unlocking mechanism. It is needed on
> some platforms, since newer U-Boot versions do support this PPB locking
> and protect for example their environment sector(s) this way.
> 
> This PPB locking/unlocking will be enabled for all devices supported by
> cfi_cmdset_0002 reporting 8 in the CFI word 0x49 (Sector Protect/Unprotect
> scheme).
> 
> Please note that PPB locking does support sector-by-sector locking. But
> the whole chip can only be unlocked together. So unlocking one sector
> will automatically unlock all sectors of this device. Because of this
> chip limitation, the PPB unlocking function saves the current locking
> status of all sectors before unlocking the whole device. After unlocking
> the saved locking status is re-configured. This way only the addressed
> sectors will be unlocked.
> 
> To selectively enable this advanced sector protection mechanism, the
> device-tree property "use-advanced-sector-protection" has been created.
> To enable support for this locking this property needs to be present in the
> flash DT node. E.g.:
> 
> nor_flash@0,0 {
> 	compatible = "amd,s29gl256n", "cfi-flash";
> 	bank-width = <2>;
> 	use-advanced-sector-protection;
> 	...
> 
> Tested with Spanion S29GL512S10THI and Micron JS28F512M29EWx flash
> devices.
> 
> Signed-off-by: Stefan Roese <sr@denx.de>
> Cc: Holger Brunck <holger.brunck@keymile.com>
> Cc: Artem Bityutskiy <dedekind1@gmail.com>
> ---
>  .../devicetree/bindings/mtd/mtd-physmap.txt        |   3 +
>  drivers/mtd/chips/cfi_cmdset_0002.c                | 211 +++++++++++++++++++++
>  drivers/mtd/maps/physmap_of.c                      |   1 +
>  include/linux/mtd/map.h                            |   1 +
>  4 files changed, 216 insertions(+)
> 

Tested-by: Holger Brunck <holger.brunck@keymile.com>

with an Spanion S29GL512S10THI.

Regards
Holger

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
