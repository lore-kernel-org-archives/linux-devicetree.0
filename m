From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: ls2080a: fsl-mc dt node updates
Date: Mon, 18 Apr 2016 10:30:36 +0800
Message-ID: <CAJBJ56L5-HXYv=0dHdOm2Fz_ewq0-o=V5nkn4bojLyS7bDB02A@mail.gmail.com>
References: <1459544080-28598-1-git-send-email-stuart.yoder@nxp.com>
 <20160413055019.GK28903@tiger>
 <HE1PR04MB1641EB3DD445D3AF3F524C3D8D960@HE1PR04MB1641.eurprd04.prod.outlook.com>
 <20160418020252.GS28903@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160418020252.GS28903@tiger>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stuart Yoder <stuart.yoder@nxp.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "german.rivera@freescale.com" <german.rivera@freescale.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Yang-Leo Li <leoyang.li@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 18, 2016 at 10:02 AM, Shawn Guo <shawnguo@kernel.org> wrote:
> On Wed, Apr 13, 2016 at 08:39:32PM +0000, Stuart Yoder wrote:
>> > > @@ -265,6 +265,93 @@
>> > >                   compatible = "fsl,qoriq-mc";
>> > >                   reg = <0x00000008 0x0c000000 0 0x40>,    /* MC portal base */
>> > >                         <0x00000000 0x08340000 0 0x40000>; /* MC control reg */
>> > > +                 msi-parent = <&its>;
>> > > +                 #address-cells = <3>;
>> > > +                 #size-cells = <1>;
>> > > +
>> > > +                 /*
>> > > +                  * Region type 0x0 - MC portals
>> > > +                  * Region type 0x1 - QBMAN portals
>> > > +                  */
>> > > +                 ranges = <0x0 0x0 0x0 0x8 0x0c000000 0x4000000
>> > > +                           0x1 0x0 0x0 0x8 0x18000000 0x8000000>;
>> > > +
>> > > +                 /*
>> > > +                  * Define the maximum number of MACs present on the SoC.
>> > > +                  * They won't necessarily be all probed, since the
>> > > +                  * Data Path Layout file and the MC firmware can put
>> > > +                  * fewer actual DPMAC objects on the MC bus.
>> > > +                  */
>> > > +                 dpmacs {
>> > > +                         #address-cells = <1>;
>> > > +                         #size-cells = <0>;
>> > > +
>> > > +                         dpmac1: dpmac@1 {
>> > > +                                 compatible = "fsl,qoriq-mc-dpmac";
>> >
>> > I did not see how this compatible is used by kernel driver.
>>
>> There is no driver yet, but it will be coming soon.  But, does
>> it matter?  Device trees should be describing hardware
>> without regards to some specific kernel use of a node or
>> property.
>
> We need to at least have the bindings documented before we can accept it
> in dts files.

Ah, sorry.  Missed that the bindings are added by patch 1/2.

Shawn
