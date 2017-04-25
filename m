From: Mark Greer <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
Subject: Re: [PATCH v3 0/7] NFC: trf7970a: Fixups & convert to desc-based GPIO
Date: Mon, 24 Apr 2017 17:19:17 -0700
Message-ID: <20170425001917.GA14396@animalcreek.com>
References: <20170120191745.29255-1-mgreer@animalcreek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170120191745.29255-1-mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Greer <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

[-CC: Lauro Ramos Venancio <lauro.venancio-430g2QfJUUCGglJvpFV4uA@public.gmane.org> and
 Aloisio Almeida Jr <aloisio.almeida-430g2QfJUUCGglJvpFV4uA@public.gmane.org>]
[+CC: linux-wireless]

On Fri, Jan 20, 2017 at 12:17:38PM -0700, Mark Greer wrote:
> These trf7970a driver patches do the following things:
>  - a couple minor fixups
>  - allow EN2 to not be managed by the driver (e.g., when its tied low by
>    hardware
>  - convert the driver to use the descriptor-based GPIO interface
>  - remove support for 'vin-voltage-override' DT property
>  - change the DTS example to indicate that EN and EN2 are active high GPIOs
>  - add Mark Greer as the maintainer of the trf7970a driver
> 
> Based on k.o. 44b4b46 (Merge tag 'armsoc-fixes' of
> git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc)
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
> Mark Greer (7):
>   NFC: trf7970a: Don't de-assert EN2 unless it was asserted
>   NFC: trf7970a: Don't manage EN2 when not specified in DT
>   NFC: trf7970a: Convert to descriptor based GPIO interface
>   NFC: trf7970a: Remove useless comment
>   NFC: trf7970a: Remove support for 'vin-voltage-override' DT property
>   NFC: trf7970a: Enable pins are active high not active low
>   MAINTAINERS: NFC: trf7970a: Add Mark Greer as maintainer
> 
>  .../devicetree/bindings/net/nfc/trf7970a.txt       |  6 +-
>  MAINTAINERS                                        |  7 ++
>  drivers/nfc/Kconfig                                |  2 +-
>  drivers/nfc/trf7970a.c                             | 75 +++++++++-------------
>  4 files changed, 40 insertions(+), 50 deletions(-)


I've already mentioned this to Samuel privately but for everyone's sake,
I will respin this series because some patches that cause conflicts have
been accepted.  I will also add some patches that I have made in the
interim.  I apologize for the churn.

Mark
--
