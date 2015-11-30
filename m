From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 27/28] dt-bindings: mips: img,boston: Document img,boston
 binding
Date: Mon, 30 Nov 2015 12:34:17 -0600
Message-ID: <20151130183417.GA16490@rob-hp-laptop>
References: <1448900513-20856-1-git-send-email-paul.burton@imgtec.com>
 <1448900513-20856-28-git-send-email-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1448900513-20856-28-git-send-email-paul.burton@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Burton <paul.burton@imgtec.com>
Cc: linux-mips@linux-mips.org, Tejun Heo <tj@kernel.org>, Joe Perches <joe@perches.com>, Jiri Slaby <jslaby@suse.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, linux-kernel@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, "David S. Miller" <davem@davemloft.net>, Ian Campbell <ijc+devicetree@hellion.org.uk>, devicetree@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Pawel Moll <pawel.moll@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 30, 2015 at 04:21:52PM +0000, Paul Burton wrote:
> Add documentation for the simple img,boston devicetree binding & the
> boot protocol used to pass the devicetree to the kernel.
> 
> Signed-off-by: Paul Burton <paul.burton@imgtec.com>
> ---
> 
>  Documentation/devicetree/bindings/mips/img/boston.txt | 15 +++++++++++++++
>  MAINTAINERS                                           |  5 +++++
>  2 files changed, 20 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mips/img/boston.txt
> 
> diff --git a/Documentation/devicetree/bindings/mips/img/boston.txt b/Documentation/devicetree/bindings/mips/img/boston.txt
> new file mode 100644
> index 0000000..27b2806
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/img/boston.txt
> @@ -0,0 +1,15 @@
> +Imagination Technologies Boston Development Board
> +=================================================
> +
> +Required properties:
> +--------------------
> + - compatible: Must be "img,boston".

No SOC compatible in addition?

> +
> +Boot protocol:
> +--------------
> +In accordance with the MIPS UHI specification[1], the bootloader must pass the
> +following arguments to the kernel:
> + - $a0: -2.
> + - $a1: KSEG0 address of the flattened device-tree blob.

If this is standard, I don't know that we need to repeat it for every 
board.

Rob

> +
> +[1] http://prplfoundation.org/wiki/MIPS_documentation
