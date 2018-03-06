From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: usb: ehci: add optional external
 vbus supply property
Date: Mon, 5 Mar 2018 19:57:43 -0600
Message-ID: <20180306015743.uazy4e5quil2ijy2@rob-hp-laptop>
References: <1519897899-8577-1-git-send-email-amelie.delaunay@st.com>
 <1519897899-8577-2-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1519897899-8577-2-git-send-email-amelie.delaunay@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Amelie Delaunay <amelie.delaunay@st.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Tony Prisk <linux@prisktech.co.nz>, Alan Stern <stern@rowland.harvard.edu>, Roger Quadros <rogerq@ti.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, Robin Murphy <robin.murphy@arm.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 01, 2018 at 10:51:38AM +0100, Amelie Delaunay wrote:
> On some boards, especially when vbus supply requires large current,
> and the charge pump on the PHY isn't enough, an external vbus power switch
> per port may be used.
> Add portN_vbus-supply property to usb-ehci bindings. As the number of ports
> depends on the ehci controller, and the port on which an external vbus
> supply depends on the platform, <portN> is used to make it generic.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
> ---
>  Documentation/devicetree/bindings/usb/usb-ehci.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/usb-ehci.txt b/Documentation/devicetree/bindings/usb/usb-ehci.txt
> index 3efde12..cd576db 100644
> --- a/Documentation/devicetree/bindings/usb/usb-ehci.txt
> +++ b/Documentation/devicetree/bindings/usb/usb-ehci.txt
> @@ -19,6 +19,7 @@ Optional properties:
>   - phys : phandle + phy specifier pair
>   - phy-names : "usb"
>   - resets : phandle + reset specifier pair
> + - portN_vbus-supply : phandle of regulator supplying vbus for port N

Just make this an array with the index being the port (and drop 
"portN_").

Rob
