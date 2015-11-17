From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] pstore-ram: add Device Tree bindings
Date: Tue, 17 Nov 2015 15:17:17 -0600
Message-ID: <20151117211717.GA12750@rob-hp-laptop>
References: <1447719205-8571-1-git-send-email-ghackmann@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1447719205-8571-1-git-send-email-ghackmann@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Hackmann <ghackmann@google.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Kees Cook <keescook@chromium.org>, Tony Luck <tony.luck@intel.com>, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 16, 2015 at 04:13:25PM -0800, Greg Hackmann wrote:
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
> Changes in V2:
> - make DT binding documentation more generic
>  Documentation/devicetree/bindings/misc/ramoops.txt |  40 ++++++++
>  Documentation/ramoops.txt                          |   6 +-
>  fs/pstore/ram.c                                    | 110 ++++++++++++++++++++-
>  3 files changed, 152 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/misc/ramoops.txt
> 
> diff --git a/Documentation/devicetree/bindings/misc/ramoops.txt b/Documentation/devicetree/bindings/misc/ramoops.txt
> new file mode 100644
> index 0000000..96c082b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/ramoops.txt
> @@ -0,0 +1,40 @@
> +Ramoops oops/panic logger
> +=========================
> +
> +ramoops provides persistent RAM storage for oops and panics, so they can be
> +recovered after a reboot.
> +
> +Parts of this storage may be set aside for other persistent log buffers, such
> +as kernel log messages, or for optional ECC error-correction data.  The total
> +size of these optional buffers must fit in the reserved region.  Any remaining
> +space will be used for oops and panics.

If record-size is not set, I don't think this last statement is true.

> +
> +
> +Required properties:
> +
> +- compatible: must be "ramoops"
> +
> +- memory-region: phandle to a region of memory that is preserved between reboots
> +
> +
> +Optional properties:
> +
> +- ecc-size: enables ECC support and specifies ECC buffer size in bytes
> +  (defaults to no ECC)
> +
> +- record-size: maximum size in bytes of each dump done on oops/panic
> +  (defaults to 0)

Perhaps the default should be something useful. 

> +
> +- console-size: size in bytes of log buffer reserved for kernel messages
> +  (defaults to 0)
> +
> +- ftrace-size: size in bytes of log buffer reserved for function tracing and
> +  profiling (defaults to 0)
> +
> +- pmsg-size: size in bytes of log buffer reserved for userspace messages
> +  (defaults to 0)
> +
> +- unbuffered: if present, use uncached mappings to map the reserved region
> +  (defaults to cached mappings)

It defaults to write-combined or buffered which is not really cached.

> +
> +- no-dump-oops: if present, only dump panics (defaults to panics and oops)

Rob
