From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: RTC: Add sirf,prima2-sysrtc bindings
Date: Wed, 20 Sep 2017 15:52:16 -0500
Message-ID: <20170920205216.sgxyxc3bjcw3whot@rob-hp-laptop>
References: <20170915002035.13284-1-alexandre.belloni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170915002035.13284-1-alexandre.belloni@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Barry Song <baohua@kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 15, 2017 at 02:20:35AM +0200, Alexandre Belloni wrote:
> Add device tree bindings for the SiRFSoC Real Time Clock.

Would be useful to note this is already in use and was undocumented.

> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> ---
>  .../devicetree/bindings/rtc/sirf,prima2-sysrtc.txt         | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/sirf,prima2-sysrtc.txt
> 
> diff --git a/Documentation/devicetree/bindings/rtc/sirf,prima2-sysrtc.txt b/Documentation/devicetree/bindings/rtc/sirf,prima2-sysrtc.txt
> new file mode 100644
> index 000000000000..206a5b44af48
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/sirf,prima2-sysrtc.txt
> @@ -0,0 +1,14 @@
> +SiRFSoC Real Time Clock
> +
> +Required properties:
> +- compatible: must be "sirf,prima2-sysrtc"
> +- reg: address range of rtc register set.
> +- interrupts: rtc alarm interrupts.
> +
> +Example:
> +			sysrtc@2000 {

rtc@...

Did you want to take all these patches or I can? At least the ones 
touching trivial-devices.txt I'll take so I can deal with any conflicts.

Rob
