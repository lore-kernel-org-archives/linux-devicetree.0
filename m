From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Device tree FSL description for Microblaze
Date: Wed, 13 Jul 2011 00:12:07 +0900
Message-ID: <CACxGe6tVGa4H8-Bep89-wNQzR11bFeJ6dS3S18sYN=g0_1r+tw@mail.gmail.com>
References: <4DDCE793.9080709@monstr.eu> <4E1BEA17.6020004@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4E1BEA17.6020004-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 12, 2011 at 3:30 PM, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org> wrote:
> Any comments on this?

Sorry I didn't comment, but this is the first I've seen it.  I missed
it the first time around.

It's hard to provide any useful comments on this.  I have no idea what
FSL devices are.

g.

>
> Michal
>
> Michal Simek wrote:
>>
>> Hi,
>>
>> I would like to check with you proper device tree FSL description for
>> Microblaze (PPC can use FSL through IP connected to the bus).
>>
>> Microblaze supports FSL buses to connect coprocessors or hw accelerators
>> directly to the cpu. Cpu has up to 16 fsl bus connections - master and s=
lave
>> side. (BTW: in the latest Microblaze with AXI is possible to use AXI str=
eam
>> instead of FSL but description should be the same),
>> FSL bus has one master and in most cases one slave (more point-to-point
>> connection than bus) but I think there could be an option to have multip=
le
>> slaves for cases where the same input data goes to n-slaves.
>> There is also an option to generate interrupt if there is any data on the
>> bus.
>>
>> FSL devices can have multiple FSL inputs and outputs and they also can
>> generate interrupts.
>>
>> There is also one option to have only loopback which means connect CPU F=
SL
>> master to CPU FSL slave with optional interrupt enabling.
>>
>> I am also aware of one more option which is possibility to use a bridge
>> instead of CPU (this option is not shown below).
>>
>> Currently I have changed our generator to have the first description whi=
ch
>> I would like to use for our discussion.
>>
>> Below is the important part which I would like to discuss - it is fake hw
>> design but illustrate some important cases.
>>
>> Here are some my notes:
>> 1. I can't add FSL device directly to the CPU node because connection
>> could be from axi IP. And I need to separate interrupt generation if the=
re
>> is any activity on a bus. That's why I separate fsl bus and devices out =
of
>> CPU.
>> 2. I think that shouldn't be a problem to have fsl buses in the root node
>> 3. I think fsl devices should be moved out of root node but the point is
>> where.
>> It is not bus sub/node because device can be connected to several buses.
>> There could be a lot of connections. Any suggestions?
>> 4. Please let me know if there should be any cells properties or similar.
>> 5. There is not any address on the bus. FSL devices has some registers.
>> 6. Should I use different address than 0 for connection from cpu? mfsl@5
>> instead of mfsl5@0?
>>
>> Thanks,
>> Michal
>>
>>
>>
>> /dts-v1/;
>> / {
>> =A0 =A0#address-cells =3D <1>;
>> =A0 =A0#size-cells =3D <1>;
>> =A0 =A0compatible =3D "xlnx,microblaze";
>> =A0 =A0model =3D "axi-loopback";
>>
>> /* cpu node */
>> =A0 =A0cpus {
>> =A0 =A0 =A0 =A0#address-cells =3D <1>;
>> =A0 =A0 =A0 =A0#cpus =3D <0x1>;
>> =A0 =A0 =A0 =A0#size-cells =3D <0>;
>> =A0 =A0 =A0 =A0microblaze_0: cpu@0 {
>> ... /* some cpu parameters */
>> =A0 =A0 =A0 =A0 =A0 =A0xlnx,use-stack-protection =3D <0x0>;
>>
>> =A0 =A0 =A0 =A0/* fsl_m -> master side, fsl_s -> slave side */
>> =A0 =A0 =A0 =A0 =A0 =A0fsl_m_0: mfsl0@0 {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0link =3D <&fsl_v20_2>; /* bus connection =
*/
>> =A0 =A0 =A0 =A0 =A0 =A0} ;
>> ...
>> =A0 =A0 =A0 =A0 =A0 =A0fsl_m_5: mfsl5@0 {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0link =3D <&fsl_v20_9>;
>> =A0 =A0 =A0 =A0 =A0 =A0} ;
>> =A0 =A0 =A0 =A0 =A0 =A0fsl_s_0: sfsl0@0 {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0link =3D <&fsl_v20_1>;
>> =A0 =A0 =A0 =A0 =A0 =A0} ;
>> ...
>> =A0 =A0 =A0 =A0 =A0 =A0fsl_s_5: sfsl5@0 {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0link =3D <&fsl_v20_10>;
>> =A0 =A0 =A0 =A0 =A0 =A0} ;
>> =A0 =A0 =A0 =A0} ;
>> =A0 =A0} ;
>>
>> /* FSL buses - all look the same that's why I keep here only two - I
>> expect you will beat me for simple-bus compatible property. =A0*/
>> /* The first where all interrupts are connected */
>> =A0 =A0fsl_v20_0: fsl-v20-0@0 {
>> =A0 =A0 =A0 =A0compatible =3D "xlnx,fsl-v1.00.a", "simple-bus";
>> =A0 =A0 =A0 =A0interrupt-parent =3D <&microblaze_0_intc>;
>> =A0 =A0 =A0 =A0interrupts =3D < 11 2 4 2 10 2 >;
>> =A0 =A0 =A0 =A0xlnx,async-clks =3D <0x0>;
>> =A0 =A0 =A0 =A0xlnx,ext-reset-high =3D <0x1>;
>> =A0 =A0 =A0 =A0xlnx,fsl-depth =3D <0x10>;
>> =A0 =A0 =A0 =A0xlnx,fsl-dwidth =3D <0x20>;
>> =A0 =A0 =A0 =A0xlnx,impl-style =3D <0x0>;
>> =A0 =A0 =A0 =A0xlnx,read-clock-period =3D <0x0>;
>> =A0 =A0 =A0 =A0xlnx,use-control =3D <0x1>;
>> =A0 =A0} ;
>> /* bus without interrupts */
>> =A0 =A0fsl_v20_10: fsl-v20-10@0 {
>> =A0 =A0 =A0 =A0compatible =3D "xlnx,fsl-v1.00.a", "simple-bus";
>> =A0 =A0 =A0 =A0xlnx,async-clks =3D <0x0>;
>> =A0 =A0 =A0 =A0xlnx,ext-reset-high =3D <0x1>;
>> =A0 =A0 =A0 =A0xlnx,fsl-depth =3D <0x10>;
>> =A0 =A0 =A0 =A0xlnx,fsl-dwidth =3D <0x20>;
>> =A0 =A0 =A0 =A0xlnx,impl-style =3D <0x0>;
>> =A0 =A0 =A0 =A0xlnx,read-clock-period =3D <0x0>;
>> =A0 =A0 =A0 =A0xlnx,use-control =3D <0x1>;
>> =A0 =A0} ;
>>
>> ....
>>
>> /* simple ip - one input and one output + parameters and interrupt */
>> =A0 =A0axi_stream_test_0: axi-stream-test-0@0 {
>> =A0 =A0 =A0 =A0MFSL =3D <&fsl_v20_3>;
>> =A0 =A0 =A0 =A0SFSL =3D <&fsl_v20_2>;
>> =A0 =A0 =A0 =A0interrupt-parent =3D <&microblaze_0_intc>;
>> =A0 =A0 =A0 =A0interrupts =3D < 3 2 >;
>> =A0 =A0 =A0 =A0xlnx,use-rexa =3D <0x0>;
>> =A0 =A0 =A0 =A0xlnx,use-rexam =3D <0x2>;
>> =A0 =A0 =A0 =A0xlnx,use-rexample =3D <0x4>;
>> =A0 =A0} ;
>> ...
>> /* IP with two inputs and one output */
>> =A0 =A0multiinput_dev_0: multiinput-dev-0@0 {
>> =A0 =A0 =A0 =A0MFSL0 =3D <&fsl_v20_11>;
>> =A0 =A0 =A0 =A0SFSL0 =3D <&fsl_v20_12>;
>> =A0 =A0 =A0 =A0SFSL1 =3D <&fsl_v20_13>;
>> =A0 =A0 =A0 =A0xlnx,use-exa =3D <0x0>;
>> =A0 =A0 =A0 =A0xlnx,use-exam =3D <0x2>;
>> =A0 =A0 =A0 =A0xlnx,use-example =3D <0x4>;
>> =A0 =A0} ;
>>
>> /* IP with two inputs and two outputs */
>> =A0 =A0multiport_fsl_0: multiport-fsl-0@0 {
>> =A0 =A0 =A0 =A0MFSL0 =3D <&fsl_v20_8>;
>> =A0 =A0 =A0 =A0MFSL1 =3D <&fsl_v20_5>;
>> =A0 =A0 =A0 =A0SFSL0 =3D <&fsl_v20_7>;
>> =A0 =A0 =A0 =A0SFSL1 =3D <&fsl_v20_6>;
>> =A0 =A0 =A0 =A0xlnx,use-test =3D <0x3>;
>> =A0 =A0} ;
>>
>>
>> /* the rest of IP connected to axi */
>> =A0 =A0axi4lite_0: axi@0 {
>> =A0 =A0 =A0 =A0#address-cells =3D <1>;
>> =A0 =A0 =A0 =A0#size-cells =3D <1>;
>> =A0 =A0 =A0 =A0compatible =3D "xlnx,axi-interconnect-1.03.a", "simple-bu=
s";
>> =A0 =A0 =A0 =A0ranges ;
>> ...
>> =A0 =A0 =A0 =A0microblaze_0_intc: interrupt-controller@41200000 {
>> =A0 =A0 =A0 =A0 =A0 =A0#interrupt-cells =3D <0x2>;
>> =A0 =A0 =A0 =A0 =A0 =A0compatible =3D "xlnx,axi-intc-1.01.a";
>> =A0 =A0 =A0 =A0 =A0 =A0interrupt-controller ;
>> =A0 =A0 =A0 =A0 =A0 =A0reg =3D < 0x41200000 0x10000 >;
>> =A0 =A0 =A0 =A0 =A0 =A0xlnx,kind-of-intr =3D <0x144>;
>> =A0 =A0 =A0 =A0 =A0 =A0xlnx,num-intr-inputs =3D <0xc>;
>> =A0 =A0 =A0 =A0} ;
>> =A0 =A0} ;
>> } ;
>>
>>
>>
>>
>>
>
>
> --
> Michal Simek, Ing. (M.Eng)
> w: www.monstr.eu p: +42-0-721842854
> Maintainer of Linux kernel 2.6 Microblaze Linux - http://www.monstr.eu/fd=
t/
> Microblaze U-BOOT custodian
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
