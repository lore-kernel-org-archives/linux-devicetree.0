From: Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: RFC: Zynq Clock Controller
Date: Fri, 08 Mar 2013 08:12:20 +0100
Message-ID: <51398F54.5080802@metafoo.de>
References: <37032699-343e-485c-80e0-9b23e3706c58@VA3EHSMHS013.ehs.local> <1362570681.5269.98.camel@coredoba.hi.pengutronix.de> <f288874c-d0ae-4581-8d0f-2b9abe4d3117@CO9EHSMHS002.ehs.local> <51385FA3.8080105@metafoo.de> <2a91857c-473f-4f92-b2b1-e7ac4679b72a@AM1EHSMHS007.ehs.local> <51390E92.2080806@metafoo.de> <a6c711bf-7722-4eb0-bb72-0e5c00e4ba9d@CO9EHSMHS016.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a6c711bf-7722-4eb0-bb72-0e5c00e4ba9d@CO9EHSMHS016.ehs.local>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?U8O2cmVuIEJyaW5rbWFubg==?= <soren.brinkmann@xilinx.com>
Cc: =?UTF-8?B?SmFuIEzDvGJiZQ==?= <jlu@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Mike Turquette <mturquette@linaro.org>, Josh Cartwright <josh.cartwright@ni.com>, Michal Simek <michal.simek@xilinx.com>, Peter Crosthwaite <pcrost@xilinx.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, git@xilinx.com
List-Id: devicetree@vger.kernel.org

On 03/08/2013 12:25 AM, S=C3=B6ren Brinkmann wrote:
> On Thu, Mar 07, 2013 at 11:02:58PM +0100, Lars-Peter Clausen wrote:
>> On 03/07/2013 08:11 PM, S=C3=B6ren Brinkmann wrote:
>>> On Thu, Mar 07, 2013 at 10:36:35AM +0100, Lars-Peter Clausen wrote:
>>>> On 03/06/2013 06:27 PM, S=C3=B6ren Brinkmann wrote:
>>>>> Hi Jan,
>>>>> =20
>>>>> what a small world. Good to hear from you.
>>>>>
>>>>> On Wed, Mar 06, 2013 at 12:51:21PM +0100, Jan L=C3=BCbbe wrote:
>>>>>> Hi S=C3=B6ren,
>>>>>>
>>>>>> On Tue, 2013-03-05 at 12:04 -0800, S=C3=B6ren Brinkmann wrote:
>>>>>>> For this reasons, I'd like to propose moving Zynq into the same
>>>>>>> direction. I.e. adding a clock controller with the following DT
>>>>>>> description (details may change but the general idea should bec=
ome
>>>>>>> clear):
>>>>>>> 	clkc: clkc {
>>>>>>>                 #clock-cells =3D <1>;
>>>>>>>                 compatible =3D "xlnx,ps7-clkc";
>>>>>>>                 ps_clk_frequency =3D <33333333>;	# board x-tal
>>>>>>>                 # optional props
>>>>>>>                 gem0_emio_clk_freq =3D <125000000>;
>>>>>>>                 gem1_emio_clk_freq =3D <50000000>;
>>>>>>>                 can_mio_clk_freq_xx =3D <1234>; # this is possi=
ble 54 times with xx =3D 00..53
>>>>>>>         };
>>>>
>>>> I definitely prefer the way it is right now in upstream, where we =
have one
>>>> dt node per clock. It is more descriptive and also more extensible=
=2E And you
>>>> also don't have to remember the clock index, and can use the phand=
le
>>>> directly instead.
>>> The problems I see with that are:
>>>  - with the clock controller we can model the clock tree as we need=
 without changing the DT all the time
>>
>> When do we need to change the clock tree? The clock tree is pretty m=
uch fixed
>> in hardware. And the DT describes the hardware, so I don't so a prob=
lem there.
>>
>>>  - w/o a clock controller there is no block which has knowledge of =
the whole clock tree (unless we parse the DT), and could conduct repare=
nt operations and similar
>>
>> The clk framework builds a representation of the clock tree. Each cl=
ock should
>> be able to handle re-parenting on it's own, without knowing about th=
e other
>> clocks in the tree, the parent is selected by a field in the clocks =
register.
>> It doesn't even have to know who the parents are, the clk framework =
will take
>> care of all of this and just say, ok, switch your input clock to X, =
where X is
>> a simple integer number The clk framework will also take care of re-=
calculating
>> all the updates frequencies after re-parenting.
> Nope, clk_set_parent() takes two 'struct *clk' as argument. So, you h=
ave to have those of the clock to change and all its parents. A device =
driver for example, which gets a clock through clk_get() does not have =
that information and should not, since it should not have to be aware o=
f the SOC's clock hierarchy, IMHO.
>=20

Yes, you global clk_set_parent() method takes two clk structs. But the =
clock
framework takes care of all the magic of mapping that second clk struct=
 to a
integer number, based on the clks parent list. So your set_parent callb=
ack in
your clk_ops takes as parameters your clk and the index of the parent.

>>
>>>  - once the clock controller is properly defined the clock connecti=
on should be contained in a dtsi which never changes. So, regarding rem=
embering outputs, I don't see a problem. I rather see issues with havin=
g a pile of clocks described in the DT. I have currently 44 outputs pro=
posed, and to model the whole tree a lot of more clocks are used (I sta=
rted modeling everything with the clock primitives and removed custom c=
lock implementations, except for the PLLs). Having all those in the DT =
does not really help, IMHO.
>>
>> Well, except if you want to use external clocks for ethernet or CAN.=
 Also you
>> don't need to change the dtsi either if you have a separate node for=
 each clock.
>>
>> To avoid misunderstandings let me clarify that I don't want to have =
one node
>> per clock, but rather one node per clock block (or whatever they are=
 called).
>> The combination of input select + divider + output gate. E.g. the UA=
RT clock
>> block with it's 3 inputs and two outputs.
>>
>> Also the APER clocks should probably be one node with 24 outputs.
> Okay, so instead of having one block encapsulating all clocks, you wa=
nt it on a finer granularity. I don't see huge differences why that sho=
uld be advantageous? It would just mean to create several blocks with t=
heir custom DT bindings instead of a single one. Just the abstraction l=
evel would be a little different.

The DT is supposed to describe the hardware, not the software. These ar=
e the
basic blocks. The are independent of each other and mostly orthogonal. =
It's the
same IP block instantiated a couple of times next to each other (someti=
mes with
slightly different parameters). They just happen to have their register=
 mapped
in the same IO region. The SLCR is just a container which contains all =
these
blocks. Very much the same way the whole SoC is a container which conta=
ins the
different peripheral blocks, etc. By you rationale we could argue, why =
do we
need a dt node for each peripheral and not just simply one ZYNQ node?

- Lars
