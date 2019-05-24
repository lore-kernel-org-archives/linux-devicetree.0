From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v1 3/5] dt-bindings: Add depends-on property
Date: Fri, 24 May 2019 16:01:35 +0100
Message-ID: <20190524150135.GD15566@lakrids.cambridge.arm.com>
References: <20190524010117.225219-1-saravanak@google.com>
 <20190524010117.225219-4-saravanak@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190524010117.225219-4-saravanak@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Saravana Kannan <saravanak@google.com>
Cc: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@android.com
List-Id: devicetree@vger.kernel.org

On Thu, May 23, 2019 at 06:01:14PM -0700, Saravana Kannan wrote:
> The depends-on property is used to list the mandatory functional
> dependencies of a consumer device on zero or more supplier devices.
> 
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> ---
>  .../devicetree/bindings/depends-on.txt        | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/depends-on.txt
> 
> diff --git a/Documentation/devicetree/bindings/depends-on.txt b/Documentation/devicetree/bindings/depends-on.txt
> new file mode 100644
> index 000000000000..1cbddd11cf17
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/depends-on.txt
> @@ -0,0 +1,26 @@
> +Functional dependency linking
> +=============================
> +
> +Apart from parent-child relationships, devices (consumers) often have
> +functional dependencies on other devices (suppliers). Common examples of
> +suppliers are clock, regulators, pinctrl, etc. However not all of them are
> +dependencies with well defined devicetree bindings. 

For clocks, regualtors, and pinctrl, that dependency is already implicit
in the consumer node's properties. We should be able to derive those
dependencies within the kernel.

Can you give an example of where a dependency is not implicit in an
existing binding?

> Also, not all functional
> +dependencies are mandatory as the device might be able to operate in a limited
> +mode without some of the dependencies.

Whether something is a mandatory dependency will depend on the driver
and dynamic runtime details more than it will depend on the hardware.

For example, assume I have an IP block that functions as both a
clocksource and a watchdog that can reset the system, with those two
functions derived from separate input clocks.

I could use the device as just a clocksource, or as just a watchdog, and
neither feature in isolation is necessarily mandatory for the device to
be somewhat useful to the OS.

We need better ways of dynamically providing and managing this
information. For example, if a driver could register its dynamic
dependencies at probe (or some new pre-probe callback), we'd be able to
notify it immediately when its dependencies are available.

Thanks,
Mark.
