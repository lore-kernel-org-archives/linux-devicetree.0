From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: Re: [PATCH v2 4/5] mfd: arizona: Update DT binding documentation
 for mic detection
Date: Tue, 13 Oct 2015 16:23:31 +0100
Message-ID: <20151013152331.GL8805@ck-lbox>
References: <20151007100017.GB12635@sirena.org.uk>
 <20151007122642.GH17172@x1>
 <20151012084554.GB8805@ck-lbox>
 <20151012134309.GE1542@sirena.org.uk>
 <20151013080218.GV17172@x1>
 <20151013121450.GD8805@ck-lbox>
 <20151013135053.GB32409@x1>
 <561D0E4C.4010205@samsung.com>
 <561D10A6.7040504@samsung.com>
 <20151013141822.GC32409@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20151013141822.GC32409@x1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Mark Brown <broonie@kernel.org>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, myungjoo.ham@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

On Tue, Oct 13, 2015 at 03:18:22PM +0100, Lee Jones wrote:
> On Tue, 13 Oct 2015, Chanwoo Choi wrote:
> > On 2015=EB=85=84 10=EC=9B=94 13=EC=9D=BC 22:59, Chanwoo Choi wrote:
> > > On 2015=EB=85=84 10=EC=9B=94 13=EC=9D=BC 22:50, Lee Jones wrote:
> > >> On Tue, 13 Oct 2015, Charles Keepax wrote:
> > >>
> > >>> On Tue, Oct 13, 2015 at 09:02:18AM +0100, Lee Jones wrote:
> > >>>> On Mon, 12 Oct 2015, Mark Brown wrote:
> > >>>>
> > >>>>> On Mon, Oct 12, 2015 at 09:45:54AM +0100, Charles Keepax wrot=
e:
> > >>>>>> On Wed, Oct 07, 2015 at 01:26:42PM +0100, Lee Jones wrote:
> > >>>>>>> On Wed, 07 Oct 2015, Mark Brown wrote:
> > >> Now I know that jack detection is an Extcon thing and Extcon Ack=
 will
> > >> do just nicely.  However, that begs the question; if they are an
> > >> Extcon thing, why aren't they in the Extcon binding document?
> > >=20
> > > As I knew, the arizona-extcon is one device of the MFD devices=20
> > > for WMxxxx series in the driver/mfd/arizona-core.c. So, If arizon=
a-extcon
> > > driver needs the some property for dt support, some property shou=
ld be
> > > included in MFD device tree node. There is no separate device tre=
e node for
> > > arizona-extcon driver.
> >=20
> > If creating the separate extcon doc for extcon-arizona.c driver, it=
 is possible
> > to make the child device tree node which is located at the below of=
 arizona MFD
> > device tree node.
> >=20
> > I agree about Lee's opinion to make the separate the Extcon doc for=
 extcon-arizona.c.
>=20
> This is how we normally document MFDs.  Extcon doesn't even need to
> have it's own child-node (it can if you want though -- it's however
> you want to represent it), you can just put something like this in th=
e
> MFD binding doc:
>=20
> Optional properties
> this		: Does this
> that		: Does that
>=20
> Also any child device specific property:
> 	GPIO    See: ../extcon/arizona.txt
> 	Extcon  See: ../gpio/arizona.txt
>=20
> Etc.  Or words to that effect.  See some other MFDs for examples.

More accident of history than anything else I will send a patch
to split the binding up into the seperate subsystems shortly.

Thanks,
Charles
