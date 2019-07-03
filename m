From: Angus Ainslie <angus@akkea.ca>
Subject: Re: [PATCH v3] arm64: dts: imx8mq: Add sai3 and sai6 nodes
Date: Wed, 03 Jul 2019 07:58:32 -0600
Message-ID: <8ebfeaae8541132ad39e4109d135cd5f@www.akkea.ca>
References: <20190702132353.18632-1-andradanciu1997@gmail.com>
 <9ea5109f8645c3f27a9e350c5f9b2d4c@www.akkea.ca>
 <CAEnQRZDCpPju7xBBY9=e0dWt=A9c3t3g88pEw+teoZmmOiiKXQ@mail.gmail.com>
 <9e196ce51eac9ce9c327198c4a2911a8@www.akkea.ca>
 <CAEnQRZCoOyyZVs0=BjXB5=wYe3XW9GOF9JvwjhSU9BsChh08uA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAEnQRZCoOyyZVs0=BjXB5=wYe3XW9GOF9JvwjhSU9BsChh08uA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Andra Danciu <andradanciu1997@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, Anson Huang <Anson.Huang@nxp.com>, andrew.smirnov@gmail.com, Carlo Caione <ccaione@baylibre.com>, =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, Devicetree List <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Daniel,

On 2019-07-03 07:25, Daniel Baluta wrote:
> On Wed, Jul 3, 2019 at 4:12 PM Angus Ainslie <angus@akkea.ca> wrote:
>> 
>> Hi Daniel,
>> 
>> On 2019-07-03 07:10, Daniel Baluta wrote:
>> > On Wed, Jul 3, 2019 at 4:01 PM Angus Ainslie <angus@akkea.ca> wrote:
>> >>
>> >> Hi Andra,
>> >>
>> >> I tried this out on linux-next and I'm not able to record or play
>> >> sound.
>> >>
>> >> I also added the sai2 entry to test out our devkit and get a PCM
>> >> timeout
>> >> with that.
>> >
>> > Hi Angus,
>> >
>> > There are still lots of SAI patches that need to be upstream. Me and
>> > Andra
>> > will be working on that over this summer.
>> >
>> >>
>> >> On 2019-07-02 07:23, Andra Danciu wrote:
>> >> > SAI3 and SAI6 nodes are used to connect to an external codec.
>> >> > They have 1 Tx and 1 Rx dataline.
>> >> >
>> >> > Cc: Daniel Baluta <daniel.baluta@nxp.com>
>> >> > Signed-off-by: Andra Danciu <andradanciu1997@gmail.com>
>> >> > ---
>> >> > Changes since v2:
>> >> >       - removed multiple new lines
>> >> >
>> >> > Changes since v1:
>> >> >       - Added sai3 node because we need it to enable audio on pico-pi-8m
>> >> >       - Added commit description
>> >> >
>> >> >  arch/arm64/boot/dts/freescale/imx8mq.dtsi | 29
>> >> > +++++++++++++++++++++++++++++
>> >> >  1 file changed, 29 insertions(+)
>> >> >
>> >> > diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
>> >> > b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
>> >> > index d09b808eff87..736cf81b695e 100644
>> >> > --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
>> >> > +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
>> >> > @@ -278,6 +278,20 @@
>> >> >                       #size-cells = <1>;
>> >> >                       ranges = <0x30000000 0x30000000 0x400000>;
>> >> >
>> >> > +                     sai6: sai@30030000 {
>> >> > +                             compatible = "fsl,imx8mq-sai",
>> >>
>> >> I don't find this compatible string in sound/soc/fsl/fsl_sai.c. Aren't
>> >> the registers at a different offset from "fsl,imx6sx-sai".
>> >
>> > Yes, you are right on this. We are trying to slowly push all our
>> > internal-tree
>> > patches to mainline. Obviously, with started with low hanging fruits,
>> > DTS
>> > nodes and small SAI fixes.
>> >
>> > Soon, we will start to send patches for SAI IP ipgrade for imx8.
>> >
>> >>
>> >> How is this supposed to work ?
>> >>
>> >
>> > For the moment it won't work unless we will upstream all our SAI
>> > internal patches.
>> > But we will get there hopefully this summer.
>> >
>> 
>> Shouldn't a working driver be upstream before enabling it in the
>> devicetree ?
> 
> I see your point here and maybe your suggestion is the ideal
> way to do things.
> 
> Anyhow, I don't see a problem with adding the node in dts
> because CONFIG_FSL_SAI is not set in the default config.
> 

I think the assumption is that devices in the devicetree are tested and 
working. That's not currently the case for sai on imx8mq.

> We try to speedup the upstreaming process giving the fact
> that SAI patches will go through audio maintainer's tree and
> the DTS patches will most likely go through Shawn's tree.
> 

Ok I can see them being committed concurrently but I haven't even seen a 
v1 of the sai patches.

Thanks
Angus

> thanks,
> Daniel.
