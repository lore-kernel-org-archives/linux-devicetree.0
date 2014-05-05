MIME-Version: 1.0
In-Reply-To: <1398296783-1176-4-git-send-email-santosh.shilimkar@ti.com>
References: <1398296783-1176-1-git-send-email-santosh.shilimkar@ti.com>
	<1398296783-1176-4-git-send-email-santosh.shilimkar@ti.com>
Date: Mon, 5 May 2014 11:18:51 -0500
Message-ID: <CAL_JsqJUJMuhq4Wcn8HkNFwyn=RVxr=_A3g5T0-vM5WSJOtfpA@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] Documentation: dt: soc: add Keystone Navigator
 QMSS bindings
From: Rob Herring <robherring2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: Santosh Shilimkar <santosh.shilimkar@ti.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sandeep Nair <sandeep_n@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kumar Gala <galak@codeaurora.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Apr 23, 2014 at 6:46 PM, Santosh Shilimkar <santosh.shilimkar@ti.co=
m> wrote:
> From: Sandeep Nair <sandeep_n@ti.com>
>
> The QMSS (Queue Manager Sub System) found on Keystone SOCs is one of
> the main hardware sub system which forms the backbone of the Keystone
> Multi-core Navigator. QMSS consist of queue managers, packed-data structu=
re
> processors(PDSP), linking RAM, descriptor pools and infrastructure
> Packet DMA.
>
> The Queue Manager is a hardware module that is responsible for accelerati=
ng
> management of the packet queues. Packets are queued/de-queued by writing =
or
> reading descriptor address to a particular memory mapped location. The PD=
SPs
> perform QMSS related functions like accumulation, QoS, or event managemen=
t.
> Linking RAM registers are used to link the descriptors which are stored i=
n
> descriptor RAM. Descriptor RAM is configurable as internal or external me=
mory.
>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Kumar Gala <galak@codeaurora.org>
> Cc: Olof Johansson <olof@lixom.net>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Grant Likely <grant.likely@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Sandeep Nair <sandeep_n@ti.com>
> Signed-off-by: Santosh Shilimkar <santosh.shilimkar@ti.com>
> ---
>  .../bindings/soc/keystone-navigator-qmss.txt       |  232 ++++++++++++++=
++++++
>  1 file changed, 232 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/keystone-naviga=
tor-qmss.txt
>
> diff --git a/Documentation/devicetree/bindings/soc/keystone-navigator-qms=
s.txt b/Documentation/devicetree/bindings/soc/keystone-navigator-qmss.txt
> new file mode 100644
> index 0000000..edc5458
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/keystone-navigator-qmss.txt
> @@ -0,0 +1,232 @@
> +* Texas Instruments Keystone Navigator Queue Management SubSystem driver
> +
> +The QMSS (Queue Manager Sub System) found on Keystone SOCs is one of
> +the main hardware sub system which forms the backbone of the Keystone
> +multi-core Navigator. QMSS consist of queue managers, packed-data struct=
ure
> +processors(PDSP), linking RAM, descriptor pools and infrastructure
> +Packet DMA.
> +The Queue Manager is a hardware module that is responsible for accelerat=
ing
> +management of the packet queues. Packets are queued/de-queued by writing=
 or
> +reading descriptor address to a particular memory mapped location. The P=
DSPs
> +perform QMSS related functions like accumulation, QoS, or event manageme=
nt.
> +Linking RAM registers are used to link the descriptors which are stored =
in
> +descriptor RAM. Descriptor RAM is configurable as internal or external m=
emory.
> +The QMSS driver manages the PDSP setups, linking RAM regions,
> +queue pool management (allocation, push, pop and notify) and descriptor
> +pool management.
> +
> +
> +Required properties:
> +- compatible   : Must be "ti,keystone-navigator-qmss";
> +- clocks       : phandle to the reference clock for this device.
> +- queue-range  : <start number> total range of queue numbers for the dev=
ice.
> +- linkram0     : <address size> for internal link ram, where size is the=
 total
> +                 link ram entries.
> +- linkram1     : <address size> for external link ram, where size is the=
 total
> +                 external link ram entries. If the address is specified =
as "0"
> +                 driver will allocate memory.
> +- qmgrs         : child node describing the individual queue managers on=
 the
> +                 SoC. On keystone 1 devices there should be only one nod=
e.
> +                 On keystone 2 devices there can be more than 1 node.
> +  -- managed-queues    : the actual queues managed by each queue manager
> +                         instance, specified as <"base queue #" "# of qu=
eues">.
> +  -- reg               : Address and size of the register set for the de=
vice.
> +                         Register regions should be specified in the fol=
lowing
> +                         order
> +                         - Queue Peek region.
> +                         - Queue status RAM.
> +                         - Queue configuration region.
> +                         - Descriptor memory setup region.
> +                         - Queue Management/Queue Proxy region for queue=
 Push.
> +                         - Queue Management/Queue Proxy region for queue=
 Pop.
> +- queue-pools  : child node classifying the queue ranges into pools.
> +                 Queue ranges are grouped into 3 type of pools:
> +                 - qpend           : pool of qpend(interruptible) queues
> +                 - general-purpose : pool of general queues, primarly us=
ed
> +                                     as free descriptor queues or the
> +                                     transmit DMA queues.
> +                 - accumulator     : pool of queues on PDSP accumulator =
channel
> +                 Each range can have the following properties:
> +  -- qrange            : number of queues to use per queue range, specif=
ied as
> +                         <"base queue #" "# of queues">.
> +  -- interrupts                : Optional property to specify the interr=
upt mapping
> +                         for interruptible queues. The driver additional=
y sets
> +                         the interrupt affinity hint based on the cpu ma=
sk.
> +  -- qalloc-by-id      : Optional property to specify that the queues in=
 this
> +                         range can only be allocated by queue id.
> +  -- accumulator       : Accumulator channel specification. Any of the P=
DSPs in
> +                         QMSS can be loaded with the accumulator firmwar=
e. The
> +                         accumulator firmware=E2=80=99s job is to poll a=
 select number of
> +                         queues looking for descriptors that have been p=
ushed
> +                         into them. Descriptors are popped from the queu=
e and
> +                         placed in a buffer provided by the host. When t=
he list
> +                         becomes full or a programmed time period expire=
s, the
> +                         accumulator triggers an interrupt to the host t=
o read
> +                         the buffer for descriptor information. This fir=
mware
> +                         comes in 16, 32, and 48 channel builds. Each of=
 these
> +                         channels can be configured to monitor 32 contig=
uous
> +                         queues.  Accumulator channel property is specif=
ied as:
> +                         <pdsp-id, channel, entries, pacing mode, latenc=
y>
> +                         pdsp-id     : QMSS PDSP running accumulator fir=
mware
> +                                       on which the channel has to be
> +                                       configured
> +                         channel     : Accumulator channel number
> +                         entries     : Size of the accumulator descripto=
r list
> +                         pacing mode : Interrupt pacing mode
> +                                       0 : None, i.e interrupt on list f=
ull only
> +                                       1 : Time delay since last interru=
pt
> +                                       2 : Time delay since first new pa=
cket
> +                                       3 : Time delay since last new pac=
ket
> +                         latency     : time to delay the interrupt, spec=
ified
> +                                       in microseconds.
> +  -- multi-queue       : Optional property to specify that the channel h=
as to
> +                         monitor upto 32 queues starting at the base que=
ue #.
> +- descriptor-regions   : child node describing the memory regions for ke=
ystone
> +                         navigator packet DMA descriptors. The memory fo=
r
> +                         descriptors will be allocated by the driver.
> +  -- id                                : region number in QMSS.
> +  -- region-spec               : specifies the number of descriptors in =
the
> +                                 region, specified as
> +                                 <"# of descriptors" "descriptor size">.
> +  -- link-index                        : start index, i.e. index of the =
first
> +                                 descriptor in the region.
> +
> +Optional properties:
> +- dma-coherent : Present if DMA operations are coherent.
> +- pdsps                : child node describing the PDSP configuration.
> +  -- firmware          : firmware to be loaded on the PDSP.
> +  -- id                        : the qmss pdsp that will run the firmwar=
e.
> +  -- reg               : Address and size of the register set for the PD=
SP.
> +                         Register regions should be specified in the fol=
lowing
> +                         order
> +                         - PDSP internal RAM region.
> +                         - PDSP control/status region registers.
> +                         - QMSS interrupt distributor registers.
> +                         - PDSP command interface region.
> +
> +Example:
> +
> +qmss: qmss@2a40000 {
> +       compatible =3D "ti,keystone-qmss";
> +       dma-coherent;
> +       #address-cells =3D <1>;
> +       #size-cells =3D <1>;
> +       clocks =3D <&chipclk13>;
> +       ranges;
> +       queue-range     =3D <0 0x4000>;
> +       linkram0        =3D <0x100000 0x8000>;
> +       linkram1        =3D <0x0 0x10000>;
> +
> +       qmgrs {
> +               #address-cells =3D <1>;
> +               #size-cells =3D <1>;
> +               ranges;
> +               qmgr0 {
> +                       managed-queues =3D <0 0x2000>;
> +                       reg =3D <0x2a40000 0x20000>,
> +                             <0x2a06000 0x400>,
> +                             <0x2a02000 0x1000>,
> +                             <0x2a03000 0x1000>,
> +                             <0x2a80000 0x20000>,
> +                             <0x2a80000 0x20000>;
> +               };
> +
> +               qmgr1 {
> +                       managed-queues =3D <0x2000 0x2000>;
> +                       reg =3D <0x2a60000 0x20000>,
> +                             <0x2a06400 0x400>,
> +                             <0x2a04000 0x1000>,
> +                             <0x2a05000 0x1000>,
> +                             <0x2aa0000 0x20000>,
> +                             <0x2aa0000 0x20000>;
> +               };
> +       };
> +       queue-pools {
> +               qpend {
> +                       qpend-0 {
> +                               qrange =3D <658 8>;
> +                               interrupts =3D<0 40 0xf04 0 41 0xf04 0 42=
 0xf04
> +                                            0 43 0xf04 0 44 0xf04 0 45 0=
xf04
> +                                            0 46 0xf04 0 47 0xf04>;
> +                       };
> +                       qpend-1 {
> +                               qrange =3D <8704 16>;
> +                               interrupts =3D <0 48 0xf04 0 49 0xf04 0 5=
0 0xf04
> +                                             0 51 0xf04 0 52 0xf04 0 53 =
0xf04
> +                                             0 54 0xf04 0 55 0xf04 0 56 =
0xf04
> +                                             0 57 0xf04 0 58 0xf04 0 59 =
0xf04
> +                                             0 60 0xf04 0 61 0xf04 0 62 =
0xf04
> +                                             0 63 0xf04>;
> +                               qalloc-by-id;
> +                       };
> +                       qpend-2 {
> +                               qrange =3D <8720 16>;
> +                               interrupts =3D <0 64 0xf04 0 65 0xf04 0 6=
6 0xf04
> +                                             0 59 0xf04 0 68 0xf04 0 69 =
0xf04
> +                                             0 70 0xf04 0 71 0xf04 0 72 =
0xf04
> +                                             0 73 0xf04 0 74 0xf04 0 75 =
0xf04
> +                                             0 76 0xf04 0 77 0xf04 0 78 =
0xf04
> +                                             0 79 0xf04>;
> +                       };
> +               };
> +               general-purpose {
> +                       gp-0 {
> +                               qrange =3D <4000 64>;
> +                       };
> +                       netcp-tx {
> +                               qrange =3D <640 9>;
> +                               qalloc-by-id;
> +                       };
> +               };
> +               accumulator {
> +                       acc-0 {
> +                               qrange =3D <128 32>;
> +                               accumulator =3D <0 36 16 2 50>;
> +                               interrupts =3D <0 215 0xf01>;
> +                               multi-queue;
> +                               qalloc-by-id;
> +                       };
> +                       acc-1 {
> +                               qrange =3D <160 32>;
> +                               accumulator =3D <0 37 16 2 50>;
> +                               interrupts =3D <0 216 0xf01>;
> +                               multi-queue;
> +                       };
> +                       acc-2 {
> +                               qrange =3D <192 32>;
> +                               accumulator =3D <0 38 16 2 50>;
> +                               interrupts =3D <0 217 0xf01>;
> +                               multi-queue;
> +                       };
> +                       acc-3 {
> +                               qrange =3D <224 32>;
> +                               accumulator =3D <0 39 16 2 50>;
> +                               interrupts =3D <0 218 0xf01>;
> +                               multi-queue;
> +                       };
> +               };
> +       };
> +       descriptor-regions {
> +               #address-cells =3D <1>;
> +               #size-cells =3D <1>;
> +               ranges;
> +               region-12 {
> +                       id =3D <12>;
> +                       region-spec =3D <8192 128>; /* num_desc desc_size=
 */
> +                       link-index =3D <0x4000>;
> +               };
> +       };
> +       pdsps {
> +               #address-cells =3D <1>;
> +               #size-cells =3D <1>;
> +               ranges;
> +               pdsp0@0x2a10000 {
> +                       firmware =3D "keystone/qmss_pdsp_acc48_k2_le_1_0_=
0_8.fw";
> +                       reg =3D <0x2a10000 0x1000>,
> +                             <0x2a0f000 0x100>,
> +                             <0x2a0c000 0x3c8>,
> +                             <0x2a20000 0x4000>;
> +                       id =3D <0>;
> +               };
> +       };
> +}; /* qmss */
> --
> 1.7.9.5
>
