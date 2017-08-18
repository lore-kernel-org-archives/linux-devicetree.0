From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v4 6/8] Documentation: Add device tree binding for
 Goldfish FB driver
Date: Fri, 18 Aug 2017 19:04:19 +0300
Message-ID: <64418e6a-7ac2-ae2f-a064-937343ecb136@cogentembedded.com>
References: <1503061833-26563-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <1503061833-26563-7-git-send-email-aleksandar.markovic@rt-rk.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1503061833-26563-7-git-send-email-aleksandar.markovic@rt-rk.com>
Content-Language: en-MW
Sender: linux-kernel-owner@vger.kernel.org
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>, linux-mips@linux-mips.org
Cc: Aleksandar Markovic <aleksandar.markovic@imgtec.com>, Miodrag Dinic <miodrag.dinic@imgtec.com>, Goran Ferenc <goran.ferenc@imgtec.com>, Bo Hu <bohu@google.com>, David Airlie <airlied@linux.ie>, devicetree@vger.kernel.org, Douglas Leung <douglas.leung@imgtec.com>, dri-devel@lists.freedesktop.org, James Hogan <james.hogan@imgtec.com>, Jin Qian <jinqian@google.com>, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Paul Burton <paul.burton@imgtec.com>, Petar Jovanovic <petar.jovanovic@imgtec.com>, Raghu Gandham <raghu.gandham@imgtec.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

On 08/18/2017 04:08 PM, Aleksandar Markovic wrote:

> From: Aleksandar Markovic <aleksandar.markovic@imgtec.com>
> 
> Add documentation for DT binding of Goldfish FB driver. The compatible
> string used by OS for binding the driver is "google,goldfish-fb".
> 
> Signed-off-by: Miodrag Dinic <miodrag.dinic@imgtec.com>
> Signed-off-by: Goran Ferenc <goran.ferenc@imgtec.com>
> Signed-off-by: Aleksandar Markovic <aleksandar.markovic@imgtec.com>
> ---
>   .../devicetree/bindings/display/google,goldfish-fb.txt | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/display/google,goldfish-fb.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/google,goldfish-fb.txt b/Documentation/devicetree/bindings/display/google,goldfish-fb.txt
> new file mode 100644
> index 0000000..9ce0615
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/google,goldfish-fb.txt
> @@ -0,0 +1,18 @@
> +Android Goldfish framebuffer
> +
> +Android Goldfish framebuffer device used by Android emulator.
> +
> +Required properties:
> +
> +- compatible : should contain "google,goldfish-fb"
> +- reg        : <registers mapping>
> +- interrupts : <interrupt mapping>
> +
> +Example:
> +
> +	goldfish_fb@1f008000 {

    The node names should be generic according to the DT spec. It even has the 
fitting name: "display".

> +		compatible = "google,goldfish-fb";
> +		interrupts = <0x10>;
> +		reg = <0x1f008000 0x0 0x100>;
> +		compatible = "google,goldfish-fb";

    Why twice? :-)

> +	};
> 

MBR, Sergei
