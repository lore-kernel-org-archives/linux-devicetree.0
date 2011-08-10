From: "Mark Rutland" <mark.rutland@arm.com>
Subject: Subject: L2x0 OF properties do not include interrupt #
Date: Wed, 10 Aug 2011 13:48:05 +0100
Message-ID: <34528.5811498345$1312980546@news.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Language: en-gb
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux@arm.linux.org.uk, 'Arnd Bergmann' <arnd@arndb.de>, Will Deacon <Will.Deacon@arm.com>, devicetree-discuss@lists.ozlabs.org, 'Barry Song' <21cnbao@gmail.com>, linux-kernel@vger.kernel.org, workgroup.linux@csr.com, 'Grant Likely' <grant.likely@secretlab.ca>, weizeng.he@csr.com, 'Olof Johansson' <olof@lixom.net>, tglx@linutronix.de, 'Rob Herring' <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

Hi all,

I'm working on a driver for the PMU found in L220/PL310 L2 Cache Controllers
(as an extension to the existing L2x0 code).

I've taken a look into what BSP support would be required and mocked up some
platform_device support, though I notice that Rob Herring has provided
devicetree bindings for the L2x0 ("l2x0: Add OF based initialization") which
should probably be used to initialize the PMU (if present) from devicetree.

The L2x0 hardware supports a combined interrupt line, which is present on the
Vexpress A9x4, EB11MPcore, PB1176, etc. This can be used to signal errors on
read/write, parity checks, etc. The PMU also fires an interrupt on this line
when any of its counters saturate.

Unfortunately the L2x0 OF bindings introduced by the patch don't include an
(optional) interrupt property, which means the PMU driver won't be able to be
initialised via devicetree. As we want to get as much as possible dynamically
configured via devicetree, this is problematic.

I realise I'm a bit late to the party here, but I'd like to propose adding an
optional interrupt parameter to the binding. I'm not aware of any
implementations which use separate interrupts, but given the binding
seems to be generic across L2CC implementations (and is not limited simply to
the L2x0), having a list rather than a single interrupt may be appropriate for
someone.

This would boil down to (for the moment) a Documentation change along the lines of:

> diff --git a/Documentation/devicetree/bindings/arm/l2cc.txt b/Documentation/devicetree/bindings/arm/l2cc.txt
> index f50e021..d4b387b 100644
> --- a/Documentation/devicetree/bindings/arm/l2cc.txt
> +++ b/Documentation/devicetree/bindings/arm/l2cc.txt
> @@ -28,6 +28,7 @@ Optional properties:
>  - arm,filter-ranges : <start length> Starting address and length of window to
>    filter. Addresses in the filter window are directed to the M1 port. Other
>    addresses will go to the M0 port.
> +- interrupt : A combined interrupt.
>  
>  Example:
>  
> @@ -39,4 +40,5 @@ L2: cache-controller {
>          arm,filter-latency = <0x80000000 0x8000000>;
>          cache-unified;
>          cache-level = <2>;
> +        interrupt = <45>;
>  };

Any thoughts?

Thanks,
Mark
