From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 5/5] nds32: Add document for NDS32 PMU.
Date: Thu, 18 Oct 2018 15:31:32 +0100
Message-ID: <20181018143132.vhhc6qpz4sooljlj@lakrids.cambridge.arm.com>
References: <cover.1539745993.git.nickhu@andestech.com>
 <c0a80d2db642b1d9547ff412d91baa9927b68aac.1539745993.git.nickhu@andestech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c0a80d2db642b1d9547ff412d91baa9927b68aac.1539745993.git.nickhu@andestech.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nickhu <nickhu@andestech.com>
Cc: greentime@andestech.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, deanbo422@gmail.com, peterz@infradead.org, mingo@redhat.com, acme@kernel.org, alexander.shishkin@linux.intel.com, jolsa@redhat.com, namhyung@kernel.org, arnd@arndb.de, sboyd@codeaurora.org, geert@linux-m68k.org, zong@andestech.com, ebiederm@xmission.com, akpm@linux-foundation.org, gregkh@linuxfoundation.org, pombredanne@nexb.com, tglx@linutronix.de, kstewart@linuxfoundation.org, devicetree@vger.kernel.org, green.hu@gmail.com
List-Id: devicetree@vger.kernel.org

On Thu, Oct 18, 2018 at 04:43:17PM +0800, Nickhu wrote:
> The document for how to add NDS32 PMU
> in devicetree.
> 
> Signed-off-by: Nickhu <nickhu@andestech.com>
> ---
>  Documentation/devicetree/bindings/nds32/pmu.txt | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nds32/pmu.txt
> 
> diff --git a/Documentation/devicetree/bindings/nds32/pmu.txt b/Documentation/devicetree/bindings/nds32/pmu.txt
> new file mode 100644
> index 000000000000..02762b850e59
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nds32/pmu.txt
> @@ -0,0 +1,17 @@
> +* NDS32 Performance Monitor Units
> +
> +NDS32 core have a PMU for counting cpu and cache events like cache misses.
> +The NDS32 PMU representation in the device tree should be done as under:
> +
> +Required properties:
> +
> +- compatilbe :
> +	"andestech,atcpmu"

Which CPUs have this PMU?

I expected more specific strings, e.g. "andestech,n13-pmu" and/or
"andestech,andestech,nds32v3-pmu".

> +
> +- interrupts : The interrupt number for NDS32 PMU is 13.
> +
> +Example:
> +pmu{
> +	compatible = "andestech,atcpmu";
> +	interrupts = <13>;
> +}

The driver tried to find multiple interrupts. Is there only a single
interrupt in all cases?

Thanks,
Mark.
