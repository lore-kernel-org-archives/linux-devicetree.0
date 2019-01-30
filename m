From: Rob Herring <robh@kernel.org>
Subject: Re: [RFC v7 2/5] dt-bindings: pstore-block: new support for blkoops
Date: Wed, 30 Jan 2019 10:07:07 -0600
Message-ID: <20190130160707.GA31844@bogus>
References: <1548245116-6360-1-git-send-email-liaoweixiong@allwinnertech.com>
 <1548245116-6360-3-git-send-email-liaoweixiong@allwinnertech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1548245116-6360-3-git-send-email-liaoweixiong@allwinnertech.com>
Sender: linux-kernel-owner@vger.kernel.org
To: liaoweixiong <liaoweixiong@allwinnertech.com>
Cc: Kees Cook <keescook@chromium.org>, Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>, Jonathan Corbet <corbet@lwn.net>, Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "David S. Miller" <davem@davemloft.net>, Andrew Morton <akpm@linux-foundation.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Arnd Bergmann <arnd@arndb.de>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 23, 2019 at 08:05:13PM +0800, liaoweixiong wrote:
> Create DT binding document for blkoops.
> 
> Signed-off-by: liaoweixiong <liaoweixiong@allwinnertech.com>
> ---
>  .../devicetree/bindings/pstore-block/blkoops.txt   | 32 ++++++++++++++++++++++

/bindings/pstore/...

I wouldn't call it blkoops either. I believe ramoops is called that to 
maintain compatibility keeping the same kernel module name that 
preceeded pstore.

>  MAINTAINERS                                        |  1 +
>  2 files changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pstore-block/blkoops.txt
> 
> diff --git a/Documentation/devicetree/bindings/pstore-block/blkoops.txt b/Documentation/devicetree/bindings/pstore-block/blkoops.txt
> new file mode 100644
> index 0000000..a25835b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pstore-block/blkoops.txt
> @@ -0,0 +1,32 @@
> +Blkoops oops logger
> +===================
> +
> +Blkoops provides a block partition for oops, excluding panics now, so they can
> +be recovered after a reboot.
> +
> +Any space of block partition will be used for a circular buffer of oops records.
> +These records have a configurable size, with a size of 0 indicating that they
> +should be disabled.
> +
> +"partition-size" and at least one of "dmesg-size" or "pmsg-size" must be set
> +non-zero, but are otherwise optional as listed below.
> +
> +Blkoops will take value from Kconfig if device tree do not set, but settings
> +from module parameters can also overwrite them.

That's all kernel details not relevant to the binidng.

> +
> +Required properties:
> +
> +- compatible: must be "blkoops".
> +
> +- partition-size: size in kbytes, must be a multiple of 4.

This seems unnecessary given a partition has a known size.

> +
> +Optional properties:
> +
> +- partition-path: strings must begin with "/dev", tell blkoops which partition
> +  it can used. If it is not set, blkoops will drop all data when reboot.

No. '/dev/...' is a Linux thing and doesn't belong in DT.

You should define a partition UUID and/or label and the kernel can find 
the right partition to use.

> +
> +- dmesg-size: maximum size in kbytes of each dump done on oops, which must be a
> +  multiple of 4.
> +
> +- pmsg-size: maximum size in kbytes for userspace messages, which must be a
> +  multiple of 4.

Common properties shared with ramoops should be in a common doc.

Rob
