From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 2/4] Documentation: arm64/arm: dt bindings for numa.
Date: Sun, 23 Aug 2015 16:49:42 -0500
Message-ID: <CAL_JsqJSeehY91D_bbN+XK22aDvWMymeGbHfBmqQX+NotB7ORg@mail.gmail.com>
References: <1439570374-4079-1-git-send-email-gkulkarni@caviumnetworks.com> <1439570374-4079-3-git-send-email-gkulkarni@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1439570374-4079-3-git-send-email-gkulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ganapatrao Kulkarni <gkulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, rfranz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Salter <msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Steve Capper <steve.capper-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Al Stone <al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, gpkulkarni-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 14, 2015 at 11:39 AM, Ganapatrao Kulkarni
<gkulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org> wrote:
> DT bindings for numa map for memory, cores and IOs using
> arm,associativity device node property.
>
> Signed-off-by: Ganapatrao Kulkarni <gkulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>

Given this matches PPC, looks fine to me.

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> ---
>  Documentation/devicetree/bindings/arm/numa.txt | 212 +++++++++++++++++++++++++
>  1 file changed, 212 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/numa.txt
>
> diff --git a/Documentation/devicetree/bindings/arm/numa.txt b/Documentation/devicetree/bindings/arm/numa.txt
> new file mode 100644
> index 0000000..dc3ef86
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/numa.txt
> @@ -0,0 +1,212 @@
> +==============================================================================
> +NUMA binding description.
> +==============================================================================
> +
> +==============================================================================
> +1 - Introduction
> +==============================================================================
> +
> +Systems employing a Non Uniform Memory Access (NUMA) architecture contain
> +collections of hardware resources including processors, memory, and I/O buses,
> +that comprise what is commonly known as a NUMA node.
> +Processor accesses to memory within the local NUMA node is generally faster
> +than processor accesses to memory outside of the local NUMA node.
> +DT defines interfaces that allow the platform to convey NUMA node
> +topology information to OS.
> +
> +==============================================================================
> +2 - arm,associativity
> +==============================================================================
> +The mapping is done using arm,associativity device property.
> +this property needs to be present in every device node which needs to to be
> +mapped to numa nodes.
> +
> +arm,associativity property is set of 32-bit integers which defines level of
> +topology and boundary in the system at which a significant difference in
> +performance can be measured between cross-device accesses within
> +a single location and those spanning multiple locations.
> +The first cell always contains the broadest subdivision within the system,
> +while the last cell enumerates the individual devices, such as an SMT thread
> +of a CPU, or a bus bridge within an SoC".
> +
> +ex:
> +       /* board 0, socket 0, cluster 0, core 0  thread 0 */
> +       arm,associativity = <0 0 0 0 0>;
> +
> +==============================================================================
> +3 - arm,associativity-reference-points
> +==============================================================================
> +This property is a set of 32-bit integers, each representing an index into
> +the arm,associativity nodes. The first integer is the most significant
> +NUMA boundary and the following are progressively less significant boundaries.
> +There can be more than one level of NUMA.
> +
> +Ex:
> +       arm,associativity-reference-points = <0 1>;
> +       The board Id(index 0) used first to calculate the associativity (node
> +       distance), then follows the  socket id(index 1).
> +
> +       arm,associativity-reference-points = <1 0>;
> +       The socket Id(index 1) used first to calculate the associativity,
> +       then follows the board id(index 0).
> +
> +       arm,associativity-reference-points = <0>;
> +       Only the board Id(index 0) used to calculate the associativity.
> +
> +       arm,associativity-reference-points = <1>;
> +       Only socket Id(index 1) used to calculate the associativity.
> +
> +==============================================================================
> +4 - Example dts
> +==============================================================================
> +
> +Example: 2 Node system consists of 2 boards and each board having one socket
> +and 8 core in each socket.
> +
> +       arm,associativity-reference-points = <0>;
> +
> +       memory@00c00000 {
> +               device_type = "memory";
> +               reg = <0x0 0x00c00000 0x0 0x80000000>;
> +               /* board 0, socket 0, no specific core */
> +               arm,associativity = <0 0 0xffff>;
> +       };
> +
> +       memory@10000000000 {
> +               device_type = "memory";
> +               reg = <0x100 0x00000000 0x0 0x80000000>;
> +               /* board 1, socket 0, no specific core */
> +               arm,associativity = <1 0 0xffff>;
> +       };
> +
> +       cpus {
> +               #address-cells = <2>;
> +               #size-cells = <0>;
> +
> +               cpu@000 {
> +                       device_type = "cpu";
> +                       compatible =  "arm,armv8";
> +                       reg = <0x0 0x000>;
> +                       enable-method = "psci";
> +                       /* board 0, socket 0, core 0*/
> +                       arm,associativity = <0 0 0>;
> +               };
> +               cpu@001 {
> +                       device_type = "cpu";
> +                       compatible =  "arm,armv8";
> +                       reg = <0x0 0x001>;
> +                       enable-method = "psci";
> +                       arm,associativity = <0 0 1>;
> +               };
> +               cpu@002 {
> +                       device_type = "cpu";
> +                       compatible =  "arm,armv8";
> +                       reg = <0x0 0x002>;
> +                       enable-method = "psci";
> +                       arm,associativity = <0 0 2>;
> +               };
> +               cpu@003 {
> +                       device_type = "cpu";
> +                       compatible =  "arm,armv8";
> +                       reg = <0x0 0x003>;
> +                       enable-method = "psci";
> +                       arm,associativity = <0 0 3>;
> +               };
> +               cpu@004 {
> +                       device_type = "cpu";
> +                       compatible =  "arm,armv8";
> +                       reg = <0x0 0x004>;
> +                       enable-method = "psci";
> +                       arm,associativity = <0 0 4>;
> +               };
> +               cpu@005 {
> +                       device_type = "cpu";
> +                       compatible =  "arm,armv8";
> +                       reg = <0x0 0x005>;
> +                       enable-method = "psci";
> +                       arm,associativity = <0 0 5>;
> +               };
> +               cpu@006 {
> +                       device_type = "cpu";
> +                       compatible =  "arm,armv8";
> +                       reg = <0x0 0x006>;
> +                       enable-method = "psci";
> +                       arm,associativity = <0 0 6>;
> +               };
> +               cpu@007 {
> +                       device_type = "cpu";
> +                       compatible =  "arm,armv8";
> +                       reg = <0x0 0x007>;
> +                       enable-method = "psci";
> +                       arm,associativity = <0 0 7>;
> +               };
> +               cpu@008 {
> +                       device_type = "cpu";
> +                       compatible =  "arm,armv8";
> +                       reg = <0x0 0x008>;
> +                       enable-method = "psci";
> +                       /* board 1, socket 0, core 0*/
> +                       arm,associativity = <1 0 0>;
> +               };
> +               cpu@009 {
> +                       device_type = "cpu";
> +                       compatible =  "arm,armv8";
> +                       reg = <0x0 0x009>;
> +                       enable-method = "psci";
> +                       arm,associativity = <1 0 1>;
> +               };
> +               cpu@00a {
> +                       device_type = "cpu";
> +                       compatible =  "arm,armv8";
> +                       reg = <0x0 0x00a>;
> +                       enable-method = "psci";
> +                       arm,associativity = <0 0 2>;
> +               };
> +               cpu@00b {
> +                       device_type = "cpu";
> +                       compatible =  "arm,armv8";
> +                       reg = <0x0 0x00b>;
> +                       enable-method = "psci";
> +                       arm,associativity = <1 0 3>;
> +               };
> +               cpu@00c {
> +                       device_type = "cpu";
> +                       compatible =  "arm,armv8";
> +                       reg = <0x0 0x00c>;
> +                       enable-method = "psci";
> +                       arm,associativity = <1 0 4>;
> +               };
> +               cpu@00d {
> +                       device_type = "cpu";
> +                       compatible =  "arm,armv8";
> +                       reg = <0x0 0x00d>;
> +                       enable-method = "psci";
> +                       arm,associativity = <1 0 5>;
> +               };
> +               cpu@00e {
> +                       device_type = "cpu";
> +                       compatible =  "arm,armv8";
> +                       reg = <0x0 0x00e>;
> +                       enable-method = "psci";
> +                       arm,associativity = <1 0 6>;
> +               };
> +               cpu@00f {
> +                       device_type = "cpu";
> +                       compatible =  "arm,armv8";
> +                       reg = <0x0 0x00f>;
> +                       enable-method = "psci";
> +                       arm,associativity = <1 0 7>;
> +               };
> +       };
> +
> +       pcie0: pcie0@0x8480,00000000 {
> +               compatible = "arm,armv8";
> +               device_type = "pci";
> +               bus-range = <0 255>;
> +               #size-cells = <2>;
> +               #address-cells = <3>;
> +               reg = <0x8480 0x00000000 0 0x10000000>;  /* Configuration space */
> +               ranges = <0x03000000 0x8010 0x00000000 0x8010 0x00000000 0x70 0x00000000>; /* mem ranges */
> +               /* board 0, socket 0, pci bus 0*/
> +               arm,associativity = <0 0 0>;
> +        };
> --
> 1.8.1.4
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
