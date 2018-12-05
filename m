From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v5 1/6] fieldbus_dev: add Fieldbus Device subsystem.
Date: Tue, 4 Dec 2018 17:12:02 -0800
Message-ID: <9f44b8a5-57bf-5dbf-1854-85c732708d02@infradead.org>
References: <20181204220224.27324-1-TheSven73@googlemail.com>
 <20181204220224.27324-2-TheSven73@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181204220224.27324-2-TheSven73@googlemail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sven Van Asbroeck <thesven73@gmail.com>, svendev@arcx.com, robh+dt@kernel.org, linus.walleij@linaro.org
Cc: lee.jones@linaro.org, mark.rutland@arm.com, afaerber@suse.de, treding@nvidia.com, david@lechnology.com, noralf@tronnes.org, johan@kernel.org, monstr@monstr.eu, michal.vokac@ysoft.com, arnd@arndb.de, gregkh@linuxfoundation.org, john.garry@huawei.com, geert+renesas@glider.be, robin.murphy@arm.com, paul.gortmaker@windriver.com, sebastien.bourdelin@savoirfairelinux.com, icenowy@aosc.io, stuyoder@gmail.com, maxime.ripard@bootlin.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 12/4/18 2:02 PM, Sven Van Asbroeck wrote:
> Fieldbus device (client) adapters allow data exchange with a PLC aka.
> "Fieldbus Controller" over a fieldbus (Profinet, FLNet, etc.)
> 
> They are typically used when a Linux device wants to expose itself
> as an actuator, motor, console light, switch, etc. over the fieldbus.
> 
> This framework is designed to provide a generic interface to Fieldbus
> Devices from both the Linux Kernel and the userspace.
> 
> Signed-off-by: Sven Van Asbroeck <TheSven73@googlemail.com>
> ---
> 

> diff --git a/Documentation/fieldbus_dev/fieldbus_dev.txt b/Documentation/fieldbus_dev/fieldbus_dev.txt
> new file mode 100644
> index 000000000000..40ab4de0f019
> --- /dev/null
> +++ b/Documentation/fieldbus_dev/fieldbus_dev.txt
> @@ -0,0 +1,66 @@
> +                       Fieldbus-Device Subsystem
> +               ============================================
> +
> +Part 0 - What is a Fieldbus Device ?
> +------------------------------------
> +
> +Fieldbus is the name of a family of industrial computer network protocols used
> +for real-time distributed control, standardized as IEC 61158.
> +
> +A complex automated industrial system — such as manufacturing assembly line —
> +usually needs a distributed control system—an organized hierarchy of controller

"system-an" looks like a hyphenated word, but it's not.  It would be better
to use either "--" or " - " (as in the line above it).

> +systems—to function. In this hierarchy, there is usually a

Same for "systems-to".

> +Human Machine Interface (HMI) at the top, where an operator can monitor or
> +operate the system. This is typically linked to a middle layer of programmable
> +logic controllers (PLC) via a non-time-critical communications system
> +(e.g. Ethernet). At the bottom of the control chain is the fieldbus that links
> +the PLCs to the components that actually do the work, such as sensors,
> +actuators, electric motors, console lights, switches, valves and contactors.
> +
> +(Source: Wikipedia)
> +
> +A "Fieldbus Device" is such an actuator, motor, console light, switch, ...
> +controlled via the Fieldbus by a PLC aka. "Fieldbus Controller".

a.k.a. or just "aka", but not "aka."

> +
> +Communication between PLC and device typically happens via process data memory,
> +separated into input and output areas. The Fieldbus then cyclically transfers
> +the PLC's output area to the device's input area, and vice versa.
> +
> +Part I - Why do we need this subsystem?
> +---------------------------------------
> +
> +Fieldbus device (client) adapters are commercially available. They allow data
> +exchange with a PLC aka. "Fieldbus Controller" via process data memory.

                       aka

> +
> +They are typically used when a Linux device wants to expose itself as an
> +actuator, motor, console light, switch, etc. over the fieldbus.
> +
> +The purpose of this subsystem is:
> +a) present a general, standardized, extensible API/ABI to userspace; and
> +b) present a convenient interface to drivers.
> +
> +Part II - How can drivers use the subsystem?
> +--------------------------------------------
> +
> +Any driver that wants to register as a Fieldbus Device should allocate and
> +populate a 'struct fieldbus_dev' (from include/linux/fieldbus_dev.h).
> +Registration then happens by calling fieldbus_dev_register().
> +
> +Part III - How can userspace use the subsystem?
> +-----------------------------------------------
> +
> +Fieldbus protocols and adapters are diverse and varied. However, they share
> +a limited few common behaviours and properties. This allows us to define
> +a simple interface consisting of a character device and a set of sysfs files:
> +
> +See:
> +Documentation/ABI/testing/sysfs-class-fieldbus-dev
> +Documentation/ABI/testing/fieldbus-dev-cdev
> +
> +Note that this simple interface does not provide a way to modify adapter
> +configuration settings. It is therefore useful only for adapters that get their
> +configuration settings some other way, e.g. non-volatile memory on the adapter,
> +through the network, ...
> +
> +At a later phase, this simple interface can easily co-exist with a future
> +(netlink-based ?) configuration settings interface.


-- 
~Randy
