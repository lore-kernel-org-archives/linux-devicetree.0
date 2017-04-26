From: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v5 0/9] NFC: trf7970a: Fixups & convert to desc-based GPIO
Date: Thu, 27 Apr 2017 00:09:00 +0200
Message-ID: <20170426220900.GA3717@zurbaran.ger.intel.com>
References: <20170425224356.11498-1-mgreer@animalcreek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170425224356.11498-1-mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Greer <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Mark,

On Tue, Apr 25, 2017 at 03:43:47PM -0700, Mark Greer wrote:
> These trf7970a driver patches do the following things:
>  - add Mark Greer as the maintainer of the trf7970a driver
>  - some minor fixups
>  - remove support for 'vin-voltage-override' DT property
>  - change the DTS example to indicate that EN and EN2 are active high GPIOs
>  - convert the driver to use the descriptor-based GPIO interface
>  - apply Lindent coding style fixes
> 
> Based on nfc-next/master 4ea206395d3a ("nfc: fix get_unaligned_...() misuses")
> 
> v4->v5:
>  - Fixed whitespace issue in "NFC: trf7970a: Clean up coding style issues"
> 
> v3->v4:
>  - Rebased on nfc-next/master because patches in that branch conflict
>    with the v3 version of this patch series.
>  - Removed "NFC: trf7970a: Don't manage EN2 when not specified in DT"
>    because a similar patch has already been accepted.
>  - Added "NFC: trf7970a: Clean up coding style issues" because the reason
>    I removed it in v3 no longer exists.
>  - Reordered the patches to make more sense (I think)
> 
> v2->v3:
>  - Removed "[PATCH v2 5/7] NFC: trf7970a: Clean up coding style issues"
>    because it will make merging patches from Geoff Lansberry and others
>    hard to apply.  I will resubmit once those patches have been merged
>    or rejected.
>  - Added a patch to remove 'vin-voltage-override' DT property support as
>    proper DT regulator set up makes it unnecessary.
> 
> v1->v2:
>  - Commit description fixups only; no functional changes.
> 
> Mark Greer (9):
>   MAINTAINERS: NFC: trf7970a: Add Mark Greer as maintainer
>   NFC: trf7970a: Don't de-assert EN2 unless it was asserted
>   NFC: trf7970a: Fix inaccurate comment in trf7970a_probe()
>   NFC: trf7970a: Only check 'en2-rf-quirk' if EN2 is specified
>   NFC: trf7970a: Remove useless comment
>   NFC: trf7970a: Remove support for 'vin-voltage-override' DT property
>   NFC: trf7970a: Enable pins are active high not active low
>   NFC: trf7970a: Convert to descriptor based GPIO interface
>   NFC: trf7970a: Clean up coding style issues
All patches applied to nfc-next, thanks.

Cheers,
Samuel.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
