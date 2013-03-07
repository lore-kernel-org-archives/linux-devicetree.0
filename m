From: Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: RFC: Zynq Clock Controller
Date: Thu, 07 Mar 2013 10:36:35 +0100
Message-ID: <51385FA3.8080105@metafoo.de>
References: <37032699-343e-485c-80e0-9b23e3706c58@VA3EHSMHS013.ehs.local> <1362570681.5269.98.camel@coredoba.hi.pengutronix.de> <f288874c-d0ae-4581-8d0f-2b9abe4d3117@CO9EHSMHS002.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f288874c-d0ae-4581-8d0f-2b9abe4d3117@CO9EHSMHS002.ehs.local>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?U8O2cmVuIEJyaW5rbWFubg==?= <soren.brinkmann@xilinx.com>
Cc: =?UTF-8?B?SmFuIEzDvGJiZQ==?= <jlu@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Mike Turquette <mturquette@linaro.org>, Josh Cartwright <josh.cartwright@ni.com>, Michal Simek <michal.simek@xilinx.com>, Peter Crosthwaite <pcrost@xilinx.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, git@xilinx.com
List-Id: devicetree@vger.kernel.org

On 03/06/2013 06:27 PM, S=C3=B6ren Brinkmann wrote:
> Hi Jan,
> =20
> what a small world. Good to hear from you.
>=20
> On Wed, Mar 06, 2013 at 12:51:21PM +0100, Jan L=C3=BCbbe wrote:
>> Hi S=C3=B6ren,
>>
>> On Tue, 2013-03-05 at 12:04 -0800, S=C3=B6ren Brinkmann wrote:
>>> For this reasons, I'd like to propose moving Zynq into the same
>>> direction. I.e. adding a clock controller with the following DT
>>> description (details may change but the general idea should become
>>> clear):
>>> 	clkc: clkc {
>>>                 #clock-cells =3D <1>;
>>>                 compatible =3D "xlnx,ps7-clkc";
>>>                 ps_clk_frequency =3D <33333333>;	# board x-tal
>>>                 # optional props
>>>                 gem0_emio_clk_freq =3D <125000000>;
>>>                 gem1_emio_clk_freq =3D <50000000>;
>>>                 can_mio_clk_freq_xx =3D <1234>; # this is possible =
54 times with xx =3D 00..53
>>>         };

I definitely prefer the way it is right now in upstream, where we have =
one
dt node per clock. It is more descriptive and also more extensible. And=
 you
also don't have to remember the clock index, and can use the phandle
directly instead.

>>
>> The clock controller should only contain properties for input freque=
ncy
>> (which can obviously not be calculated at run-time).
>>
>> Are the gem*, can* properties inputs? If they are actually outputs, =
the
>> corresponding frequencies should be requested by the clock consumers=
 and
>> not hard-coded in DT.
> They are inputs. GEM and CAN have the option to be clocked through (E=
)MIO pins, i.e. some external clock input which cannot be derived from =
ps_clk like all other clocks. I plan to register a fixed rate, root clo=
ck for each of those properties, if present.

If it is a static external input clock use a "fixed-clock" dt node to
describe it. This also has the advantage that is is also possible to us=
e a
non-static clock.

- Lars
