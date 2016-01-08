From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3] pstore-ram: add Device Tree bindings
Date: Fri, 08 Jan 2016 09:48 +0100
Message-ID: <4327736.BAId4lHCG7@wuerfel>
References: <1452210056-14436-1-git-send-email-ghackmann@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452210056-14436-1-git-send-email-ghackmann@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Hackmann <ghackmann@google.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Kees Cook <keescook@chromium.org>, Tony Luck <tony.luck@intel.com>, John Stultz <john.stultz@linaro.org>, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thursday 07 January 2016 15:40:56 Greg Hackmann wrote:
> ramoops is one of the remaining places where ARM vendors still rely on
> board-specific shims.  Device Tree lets us replace those shims with
> generic code.
> 
> These bindings mirror the ramoops module parameters, with two small
> differences:
> 
> (1) dump_oops becomes an optional "no-dump-oops" property, since ramoops
>     sets dump_oops=1 by default.
> 
> (2) mem_type=1 becomes the more self-explanatory "unbuffered" property.
> 
> Signed-off-by: Greg Hackmann <ghackmann@google.com>
> ---
> Changes in V3:
> - documentation fixes
> - look for "no-ram-oops" property as documented
> 
> Changes in V2:
> - make DT binding documentation more generic
> 
>  Documentation/devicetree/bindings/misc/ramoops.txt |  43 ++++++++
>  Documentation/ramoops.txt                          |   6 +-
>  fs/pstore/ram.c                                    | 110 ++++++++++++++++++++-
>  3 files changed, 155 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/misc/ramoops.txt
> 
> diff --git a/Documentation/devicetree/bindings/misc/ramoops.txt b/Documentation/devicetree/bindings/misc/ramoops.txt
> new file mode 100644
> index 0000000..5a475fa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/ramoops.txt
> @@ -0,0 +1,43 @@
> +Ramoops oops/panic logger
> +=========================
> +
> +ramoops provides persistent RAM storage for oops and panics, so they can be
> +recovered after a reboot.
> +
> +Parts of this storage may be set aside for other persistent log buffers, such
> +as kernel log messages, or for optional ECC error-correction data.  The total
> +size of these optional buffers must fit in the reserved region.
> +
> +Any remaining space will be used for a circular buffer of oops and panic
> +records.  These records have a configurable size, with a size of 0 indicating
> +that they should be disabled.
> +
> +
> +Required properties:
> +
> +- compatible: must be "ramoops"
> +
> +- memory-region: phandle to a region of memory that is preserved between reboots
> +

I still think putting it into the pstore node would be better here.

	Arnd
