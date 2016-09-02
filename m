From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 13/26] dt-bindings: Document mti,mips-cdmm binding
Date: Fri, 2 Sep 2016 07:38:28 -0500
Message-ID: <20160902123828.GA1327@rob-hp-laptop>
References: <20160826153725.11629-1-paul.burton@imgtec.com>
 <20160826153725.11629-14-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160826153725.11629-14-paul.burton@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Burton <paul.burton@imgtec.com>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 26, 2016 at 04:37:12PM +0100, Paul Burton wrote:
> Document a binding for the MIPS Common Device Memory Map (CDMM) which
> simply allows the device tree to specify where the CDMM registers should
> be mapped.
> 
> Signed-off-by: Paul Burton <paul.burton@imgtec.com>
> ---
> 
>  Documentation/devicetree/bindings/misc/mti,mips-cdmm.txt | 8 ++++++++

Try to find another location for these. Perhaps bindings/bus/? Even 
bindings/mips/ would be better. 

>  1 file changed, 8 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/misc/mti,mips-cdmm.txt
> 
> diff --git a/Documentation/devicetree/bindings/misc/mti,mips-cdmm.txt b/Documentation/devicetree/bindings/misc/mti,mips-cdmm.txt
> new file mode 100644
> index 0000000..5b0fc40
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/mti,mips-cdmm.txt
> @@ -0,0 +1,8 @@
> +Binding for MIPS Common Device Memory Map (CDMM) bus.
> +
> +This binding allows a system to specify where the CDMM registers should be
> +mapped using device tree.
> +
> +Required properties:
> +compatible : Should be "mti,mips-cdmm".
> +regs: Should describe the address & size of the CDMM register region.
> -- 
> 2.9.3
> 
