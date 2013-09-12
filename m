From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [RFC PATCH 5/6] extcon-gpio: Describe devicetree bindings
Date: Thu, 12 Sep 2013 17:41:00 +0100
Message-ID: <20130912164100.GF22013@e106331-lin.cambridge.arm.com>
References: <1377836978-24082-1-git-send-email-linux@roeck-us.net>
 <1377836978-24082-6-git-send-email-linux@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1377836978-24082-6-git-send-email-linux@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Pawel Moll <Pawel.Moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 30, 2013 at 05:29:37AM +0100, Guenter Roeck wrote:
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  .../devicetree/bindings/extcon/extcon-gpio         |   23 ++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/extcon/extcon-gpio
> 
> diff --git a/Documentation/devicetree/bindings/extcon/extcon-gpio b/Documentation/devicetree/bindings/extcon/extcon-gpio
> new file mode 100644
> index 0000000..091ddc6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/extcon/extcon-gpio
> @@ -0,0 +1,23 @@
> +Device-Tree bindings for extcon/extcon-gpio driver

Bindings shouldn't refer to Linux-specifics like particular drivers.
What class of hardware are you actually trying to describe?

> +
> +Required properties:
> +	- compatible = "gpio-connector";
> +	- presence-detect-gpios - presence detect gpio pin
> +
> +Optional properties:
> +	- debounce-interval - debounce interval in milli-seconds
> +	- state-on - on (connected) state
> +	- state-off - off (disconnected) state
> +	  Depending on the type of connector or cable, states may
> +	  for example be reported as "connected"/"disconnected"
> +	  or "inserted"/"removed".

I don't understand what the state-* properties describe. Do these
provide semantic information to drivers? What is the full set of valid
values?

> +
> +Example node:
> +
> +	some-connector {
> +		compatible = "gpio-connector";
> +		presence-detect-gpios = <&gpio1 7 1>;
> +		debounce-interval = <1>;
> +		state-on = "connected";
> +		state-on = "disconnected";
> +	};

I'm not sure how much value this adds to bindings over describing the
gpios directly. This seems to add a layer of indirection because of
Linux internals.

Thanks,
Mark.
