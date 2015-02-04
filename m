From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH RFC 1/2] Documentation: arm: define DT bindings for
 system suspend
Date: Wed, 4 Feb 2015 16:10:06 +0000
Message-ID: <20150204161006.GD6592@leverpostej>
References: <1421840155-18990-1-git-send-email-sudeep.holla@arm.com>
 <1421840155-18990-2-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1421840155-18990-2-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lorenzo Pieralisi <Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Amit Daniel Kachhap <amit.daniel-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jonghwa Lee <jonghwa3.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, "leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Sudeep,

On Wed, Jan 21, 2015 at 11:35:54AM +0000, Sudeep Holla wrote:
> ARM based platforms implement unique ways to enter system suspend
> (i.e. Suspend to RAM). The mechanism and the parameters defining the
> system state vary on a per-platform basis forcing the OS to handle it
> in very platform specific way.
> 
> Since ARM 32-bit systems had machine specific code, no attempts to
> standardize are being made as it provides easy way to implement suspend
> operations in a platform specific manner. However, this approach not
> only makes maintainance more difficult as the number of platforms
> supported increases but also not feasible for ARM64.
> 
> This DT binding aims at standardizing the system suspend for ARM
> platforms. ARM64 platforms mandates entry-method property in DT for
> this system suspend node.
> 
> On system implementing PSCI as an enable-method to enter system suspend,
> the PSCI CPU suspend method is used on versions upto v0.2 and requires
> the power_state parameter to be passed to the PSCI CPU suspend function.
> 
> This parameter is platform specific, therefore must be provided by
> firmware to the OS in order to enable proper call sequence.
> 
> This ARM system suspend DT bindings rely on a property
> (i.e. arm,psci-suspend-param) in the PSCI DT bindings that describes
> how the PSCI CPU suspend power_state parameter should be defined in DT.

A short while ago (after this posting), the PSCI 1.0 spec [1] was
released, featuring the new (optional) SYSTEM_SUSPEND mechanism intended
for suspend to RAM. This has a standard ID, and its presence can be
detected via the new standard PSCI_FEATURES call.

The fundamental mechanism is identical. We would hot unplug all but one
CPU, and from this remaining CPU we would make a SYSTEM_SUSPEND call.
The major differences are that SYSTEM_SUSPEND can be detected via
PSCI_FEATURES, and doesn't need a state parameter.

Given that the only mandatory addition in PSCI 1.0 over PSCI 0.2 is the
PSCI_FEATURES call (used to detect the presence of SYSTEM_SUSPEND), I do
not believe that implementing this should be a signficant overhead
compared to implementing the CPU_SUSPEND based approach with PSCI 0.2.

So I'd very much prefer that we require a minimal PSCI 1.0 with
SYSTEM_SUSPEND rather than extending CPU_SUSPEND in this manner. Is
anyone attempting to implement suspend to RAM with PSCI 0.1?

Thanks,
Mark.

[1] http://infocenter.arm.com/help/topic/com.arm.doc.den0022c/index.html

> 
> Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/psci.txt     | 11 +++
>  .../devicetree/bindings/arm/system-suspend.txt     | 93 ++++++++++++++++++++++
>  2 files changed, 104 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/system-suspend.txt
> 
> diff --git a/Documentation/devicetree/bindings/arm/psci.txt b/Documentation/devicetree/bindings/arm/psci.txt
> index 5aa40ede0e99..bd3977a2a333 100644
> --- a/Documentation/devicetree/bindings/arm/psci.txt
> +++ b/Documentation/devicetree/bindings/arm/psci.txt
> @@ -61,6 +61,14 @@ Device tree nodes that require usage of PSCI CPU_SUSPEND function (ie idle
>  		Definition: power_state parameter to pass to the PSCI
>  			    suspend call.
>  
> +PSCI v0.2 and earlier versions don't have explicit operation for system
> +suspend. However, one can implement system suspend using CPU_SUSPEND by
> +ensuring every other core except the one executing the CPU_SUSPEND call
> +has called into PSCI through a CPU_OFF call.
> +
> +In such cases, device tree nodes representing system suspend as per the
> +bindings in [2] must specify the above "arm,psci-suspend-param" property.
> +
>  Example:
>  
>  Case 1: PSCI v0.1 only.
> @@ -100,3 +108,6 @@ Case 3: PSCI v0.2 and PSCI v0.1.
>  
>  [1] Kernel documentation - ARM idle states bindings
>      Documentation/devicetree/bindings/arm/idle-states.txt
> +
> +[2] Kernel documentation - ARM system suspend bindings
> +    Documentation/devicetree/bindings/arm/system-suspend.txt
> diff --git a/Documentation/devicetree/bindings/arm/system-suspend.txt b/Documentation/devicetree/bindings/arm/system-suspend.txt
> new file mode 100644
> index 000000000000..15cac4c7fe92
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/system-suspend.txt
> @@ -0,0 +1,93 @@
> +==========================================
> +ARM system suspend binding description
> +==========================================
> +
> +==========================================
> +1 - Introduction
> +==========================================
> +
> +System Suspend(commonly known as Suspend to RAM) is a method to remove
> +power from most parts of the machine aside from the RAM, which is required
> +to restore the machine's state. Because of the large power savings, it is
> +widely used in mobile systems like laptops, tablets and smartphones.
> +
> +Usually most mobile systems enter system suspend state aggressively when
> +they are idle even for short time(in seconds) while others systems like
> +laptops automatically enter this mode when they running on batteries and
> +the lid is closed (and/or the user is inactive for some time(in minutes)).
> +
> +Most of the devices in the system are deactivated. Non-volatile memory
> +(like disk drives, flash, memory card), graphics chips and even the CPU
> +are usually deactivated. Only the RAM is powered to keep its contents. On
> +resume, only those individual devices/CPUs need to be reinitialized and
> +work continues relatively fast.
> +
> +It is highly hardware specific especially on ARM platforms. Hence we need
> +device tree binding definition for ARM system suspend state which is the
> +subject of this document in order to provide generic solution.
> +
> +===========================================
> +2 - system suspend node
> +===========================================
> +
> +The system suspend node represents the description of the mechanism to
> +enter system suspend state and must be defined as follows:
> +
> +	- compatible
> +		Usage: Required
> +		Value type: <stringlist>
> +		Definition: Must be "arm,system-suspend";
> +
> +	- entry-method
> +		Value type: <stringlist>
> +		Usage and definition depend on ARM architecture version.
> +			# On ARM v8 64-bit this property is required and must
> +			  be one of:
> +			   - "arm,psci" (see bindings in [1])
> +
> +	- status:
> +		Usage: Optional
> +		Value type: <string>
> +		Definition: A standard device tree property [2] that indicates
> +			    the operational status of system suspend.
> +			    If present, it shall be:
> +			    "okay": to indicate it is operational.
> +			    "disabled": to indicate that it has been disabled
> +			                in firmware so it is not operational.
> +			    By default, it's always enabled if not explicitly
> +			    disabled.
> +
> +	In addition to the properties listed above, it may require additional
> +	properties specifics to the entry-method defined, please refer to the
> +	corresponding entry-method bindings documentation for details.
> +	In the below example using "arm,psci" entry method,
> +	"arm,psci-suspend-param" is a PSCI specific property.
> +
> +	The system suspend node's parent node must be the 'cpus' node.
> +
> +===========================================
> +3 - Examples
> +===========================================
> +
> +Example:
> +cpus {
> +	/* cpu-map, cpu and idle-states nodes */
> +	....
> +
> +	system-suspend {
> +		compatible = "arm,system-suspend";
> +		entry-method = "arm,psci";
> +		arm,psci-suspend-param = <0x1010000>;
> +	};
> +
> +	....
> +};
> +===========================================
> +4 - References
> +===========================================
> +
> +[1] ARM Linux Kernel documentation - PSCI bindings
> +    Documentation/devicetree/bindings/arm/psci.txt
> +
> +[2] ePAPR standard
> +    https://www.power.org/documentation/epapr-version-1-1/
> -- 
> 1.9.1
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
