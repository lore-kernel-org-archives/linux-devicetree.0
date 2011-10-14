From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: P4080 device tree problems with fsl dpaa ...
Date: Fri, 14 Oct 2011 15:48:41 -0600
Message-ID: <CACxGe6t7pRFKKc=0_=PrrMq4twVGELoPwqQf2u2HmJaQO0LLiA@mail.gmail.com>
References: <2DD52030B5146141BEB762A11AE97C4CF6E0E6@SPQCEXC05.exfo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <2DD52030B5146141BEB762A11AE97C4CF6E0E6-OMuKRxKQdmAsN9D57aW0LdBPR1lH4CV8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Robert Sciuk <robert.sciuk-AJFDzwRlY/g@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 14, 2011 at 3:26 PM, Robert Sciuk <robert.sciuk-AJFDzwRlY/g@public.gmane.org> wrote:
> I've just joined the list, and I hope that this is not an inappropriate
> question, but I'm looking for some direction with respect to device
> trees, and the fsl, dpaa Ethernet drivers.
>
> I'm wondering if anyone has had any experience with the FreeScale DPAA
> drivers for the 1g dtsec interface. =A0We are getting interfaces defined,
> and the tx count increases, but we are not seeing packets on the "wire".

Hi Robert,

You should send your question to the linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
mailing list.  This is more of a powerpc device driver question than
it is a device tree question, so you're more likely to get a helpful
answer there.

g.


>
> ...
> [ =A0 =A00.911592] Freescale FM module (Oct 13 2011:14:41:07)
> [ =A0 =A00.916745] cpu6/6: fsl_mac: FSL FMan MAC API based driver ()
> [ =A0 =A00.923077] cpu6/6: fsl_mac: ffe4e0000.ethernet: FMan dTSEC versio=
n:
> 0x08240101
> [ =A0 =A00.930403] cpu6/6: fsl_mac: ffe4e0000.ethernet: FMan MAC address:
> 00:a0:a9:be:ef:10
> ...
> [ =A0 =A01.015863] cpu6/6: fsl_dpa: FSL DPAA Ethernet driver ()
> [ =A0 =A01.021446] cpu6/6: fsl_dpa: ethernet.23:
> dpaa_eth.c:1684:dpa_bp_create() eth%d: Using private BM buffer pools
> [ =A0 =A01.032263] cpu6/6: Using dynamic RX QM frame queues
> [ =A0 =A01.037242] cpu6/6: Using dynamic TX QM frame queues
> [ =A0 =A01.042263] cpu6/6: > WARNING (FM)
> [/export2/rd2/dev/robsci1/Work/gold/wr4linux-layer/obj/hotwire1/hotwire1
> /build/linux/drivers/n
> et/dpa/NetCommSw/Peripherals/FM/fm.c:911 FmGetSetPortParams]:
> [ =A0 =A01.059138] cpu6/6: FIFO size enlarged to 11008
> [ =A0 =A01.063670] cpu6/6:
> [ =A0 =A01.066672] cpu6/6: fsl_dpa: ethernet.23:
> dpaa_eth.c:2327:dpaa_oh_probe() no OH port bindings on node
> /fsl,dpaa/ethernet@0
> [ =A0 =A01.077806] cpu6/6: fsl_dpa: ethernet.24:
> dpaa_eth.c:1684:dpa_bp_create() eth%d: Using private BM buffer pools
> [ =A0 =A01.087826] cpu6/6: Using dynamic RX QM frame queues
> [ =A0 =A01.092798] cpu6/6: Using dynamic TX QM frame queues
> ...
>
> Our device tree defines the top level Ethernet as:
> ethernet@0 {
> =A0compatible =3D "fsl,p4080?dpa?ethernet", "fsl,dpa?ethernet";
> =A0fsl,qman?channel =3D <0x13>;
> =A0fsl,fman?mac =3D <0x50>;
> };
>
> And the mac and phys are defined as follows:
>
> ethernet@e0000 {
> =A0cell?index =3D <0x0>;
> =A0compatible =3D "fsl,p4080?fman?1g?mac", "fsl,fman?1g?mac";
> =A0reg =3D <0xe0000 0x1000>;
> =A0fsl,port?handles =3D <0x22 0x23>;
> =A0tbi?handle =3D <0x24>;
> =A0phy?handle =3D <0x25>;
> =A0phy?connection?type =3D "sgmii";
> =A0ptimer?handle =3D <0x26>;
> =A0linux,phandle =3D <0x50>;
> };
> mdio@e1120 {
> =A0#address?cells =3D <0x1>;
> =A0#size?cells =3D <0x0>;
> =A0compatible =3D "fsl,fman?mdio";
> =A0reg =3D <0xe1120 0xee0>;
> =A0interrupts =3D <0x64 0x1 0x0 0x0>;
> =A0gpios =3D <0x27 0x0 0x0 0x27 0x1 0x0>;
> =A0linux,phandle =3D <0x28>;
> =A0tbi?phy@8 {
> =A0reg =3D <0x8>;
> =A0device_type =3D "tbi?phy";
> =A0linux,phandle =3D <0x24>;
> =A0};
> =A0phy0: ethernet?phy@0 {
> =A0device_type=3D"ethernet?phy";
> =A0compatible=3D"broadcom,BCM5482";
> =A0reg =3D <0>;
> =A0linux,phandle =3D <0x25>;
> =A0};
> };
>
>
> I have no idea what an OH binding is, what it might look like, and what
> it entails, but I think that it might be a significant factor in our not
> seeing a working interface. =A0Has anyone any experience with dpaa device
> trees, and configuration? =A0Any pointers? =A0Any docs? Shots in the dark?
>
> Robert Sciuk
> Senior Designer, R&D.
> 905.738.3741=A0xt 22621
>
>
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
