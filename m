From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: RFC v2: Zynq Clock Controller
Date: Mon, 25 Mar 2013 17:33:10 -0600
Message-ID: <5150DEB6.7070208@wwwdotorg.org>
References: <27dae808-1d3a-4001-8eb2-b0a6e2a34b8f@AM1EHSMHS013.ehs.local> <515093B4.2090701@wwwdotorg.org> <8fd7278d-37c5-48ff-8d06-edc64d532a96@VA3EHSMHS037.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8fd7278d-37c5-48ff-8d06-edc64d532a96@VA3EHSMHS037.ehs.local>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?U8O2cmVuIEJyaW5rbWFubg==?= <soren.brinkmann@xilinx.com>
Cc: Mike Turquette <mturquette@linaro.org>, Josh Cartwright <josh.cartwright@ni.com>, Michal Simek <michal.simek@xilinx.com>, Peter Crosthwaite <pcrost@xilinx.com>, Lars-Peter Clausen <lars@metafoo.de>, Prashant Gaikwad <pgaikwad@nvidia.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, git@xilinx.com, =?UTF-8?B?SmFuIEzDvA==?= =?UTF-8?B?YmJl?= <jlu@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Peter De Schrijver <pdeschrijver@nvidia.com>
List-Id: devicetree@vger.kernel.org

On 03/25/2013 12:27 PM, S=C3=B6ren Brinkmann wrote:
> Hi Stephen,
>=20
> On Mon, Mar 25, 2013 at 12:13:08PM -0600, Stephen Warren wrote:
>> On 03/20/2013 05:56 PM, S=C3=B6ren Brinkmann wrote:
>>> Hi,
>>>
>>> I spent some time working on this and incorporating feedback. Here'=
s an updated proposal for a clock controller for Zynq:
>>>
>>> Required properties:
>>>  - #clock-cells : Must be 1
>>>  - compatible : "xlnx,ps7-clkc"  (this may become 'xlnx,zynq-clkc' =
terminology differs a bit between Xilinx internal and mainline)
>>>  - ps-clk-frequency : Frequency of the oscillator providing ps_clk =
in HZ
>>>                      (usually 33 MHz oscillators are used for Zynq =
platforms)
>>
>> This may have been mentioned before, but shouldn't the input clock b=
e
>> represented as an actual clock in DT, and hence as an entry in this
>> node's clocks property? The crystal/... itself can be represented in=
 DT
>> as a fixed-clock.
> Lars-Peter brought that up, too. Please refer to my answer to him.
>=20
>>
>>>  - clock-output-names : List of strings used to name the clock outp=
uts. Shall be a list of the outputs given below.
>>
>> That shouldn't be required.
>
> When I want to support of_clk_get_parent_name() for my clocks, I thin=
k
> it is. And I'm inclined to not brake this functionality.

The solution here is to make clock parent names irrelevant.

Also note that device tree is supposed to describe HW. As such, this
kind of internal implementation detail of the Linux clock driver should
have basically zero effect on the DT binding definition.

>>> Optional properties:
>>>  - clocks : as described in the clock bindings
>>>  - clock-names : as described in the clock bindings
>>
>> I think clocks should be required, with at least the main crystal cl=
ock
>> input always present, but perhaps having some optional entries for t=
he
>> (E)MIO feature you mention.
>
> This is why I have the xtal separate. This way these props are purely
> optional and the xtal frequency is obtained separately. It also makes=
 it
> a little easier internally, because I don't have to cope with a varia=
ble
> name for the xtal this way.
>=20
> Describing the xtal as fixed clock in DT means a mandatory entry for
> 'clocks' and 'clock-names' and a variable name for the xtal clock. I
> wanted to avoid this.

I don't see any benefit with some properties being purely optional.
Having optional entries in a property seems just fine to me.

The name of the crystal clock should be irrelevant; that issue simply
needs to be fixed. It's driving too much of this discussion, and it wil=
l
be irrelevant once it's fixed.

>>> Example:
>>>         clkc: clkc {
>>>                 #clock-cells =3D <1>;
>>>                 compatible =3D "xlnx,ps7-clkc";
>>>                 ps-clk-frequency =3D <33333333>;
>>>                 clock-output-names =3D "armpll", "ddrpll", "iopll",=
 "cpu_6or4x", "cpu_3or2x", "cpu_2x", "cpu_1x", "ddr2x", "ddr3x", "dci",=
 "lqspi", "smc", "pcap", "gem0", "gem1", "fclk0", "fclk1", "fclk2", "fc=
lk3", "can0", "can1", "sdio0", "sdio1", "uart0", "uart1", "spi0", "spi1=
", "dma", "usb0_aper", "usb1_aper", "gem0_aper", "gem1_aper", "sdio0_ap=
er", "sdio1_aper", "spi0_aper", "spi1_aper", "can0_aper", "can1_aper", =
"i2c0_aper", "i2c1_aper", "uart0_aper", "uart1_aper", "gpio_aper", "lqs=
pi_aper", "smc_aper", "swdt", "dbg_trc", "dbg_apb";  /* long list... ex=
planation below */
>>>                 /* optional props */
>>>                 clocks =3D <&clkc 16>, <&clk_foo>;
>>>                 clock-names =3D "gem1_emio_clk", "can_mio_clk_23";
>>>         };
>>>
>>> The downside of supporting this is, that I don't see a way around e=
xplicitly listing the clock output names in the DT.
>>
>> (Please wrap your emails to ~74 characters or so)
> I changed my settings.
>=20
>>
>> As Mike mentioned off-list, one can create a new clk registration AP=
I
>> that takes a struct clk* as parent rather than a char *clk_name.
>
> Then we also have to make sure clocks are probed in a specific order.=
 To
> obtain a 'struct clk *' through clk_get() the requested clock has to =
be
> already been probed. Currently clock probing relies purely on data pr=
esent
> in DT. This makes this proposal not that trivial, IMHO.

Simply use deferred probe.
