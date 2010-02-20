From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 8/9 V3] Add documentation for the new DTS language.
Date: Sat, 20 Feb 2010 09:13:13 -0700
Message-ID: <fa686aa41002200813o3fea9a34s198be367ad81b367@mail.gmail.com>
References: <1222460748-20127-1-git-send-email-jdl@jdl.com>
	<1222460748-20127-3-git-send-email-jdl@jdl.com>
	<1222460748-20127-4-git-send-email-jdl@jdl.com>
	<1222460748-20127-5-git-send-email-jdl@jdl.com>
	<1222460748-20127-6-git-send-email-jdl@jdl.com>
	<1222460748-20127-7-git-send-email-jdl@jdl.com>
	<1222460748-20127-8-git-send-email-jdl@jdl.com>
	<1222460748-20127-9-git-send-email-jdl@jdl.com>
	<20080930145537.GJ18313@secretlab.ca>
	<20081001034656.GF30810@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20081001034656.GF30810-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Okay, I'm going to reach way into the past here and reopen an old argument.=
..

Here's a link to the original conversation:

http://www.mail-archive.com/devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org/msg00161.html

On Tue, Sep 30, 2008 at 8:46 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Tue, Sep 30, 2008 at 08:55:37AM -0600, Grant Likely wrote:
>> On Fri, Sep 26, 2008 at 03:25:47PM -0500, Jon Loeliger wrote:
>> > From: Jon Loeliger <jdl-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>> >
>> > Signed-off-by: Jon Loeliger <jdl-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>> > ---
>> > =A0Documentation/manual.txt | =A0500 +++++++++++++++++++++++++++++++++=
+++++++++----
>> > =A01 files changed, 463 insertions(+), 37 deletions(-)

[snip Jon's new language proposal]

>> I'm not convinced about the approach of interleaving the executable and
>> data syntaxes. =A0The whole design of the existing syntax is to represent
>> the data structure. =A0Adding additional syntax to define executable
>> elements doesn't feel right to me. =A0I think many people will find the
>> resulting file structure to be confusing.

[Snip the rest of my comments]

> The current device tree description is purely declarative, but this
> proposal would make it a rather odd hybrid of declarative and
> imperative components. =A0I do think this could be confusing,
> particularly to device tree newcomers who may not realise which
> components are compile time evaluated and which go into the output
> tree. =A0I had in mind a rather more functional-programming style for
> macros/computed properties to ameliorate this.

[snip the rest of David's comments]

Now that I've had about a year and a half to simmer about it, I think
I have a counter proposal on a dts syntax extension.

First, I should state the problems I'm trying to solve.  I have two
use cases that interest me:

1) Multiple boards that use the same SoC.
Right now each dts file carries around the full dts definition, even
though 95% of it is 'stock' description of the soc.  For example,
arch/powerpc/boot/dts/*5200* and arch/powerpc/boot/dts/*8349*.  I want
a way to put all the common description into an SoC dts file, and then
be able to tailor it (add nodes, change properties, etc) for the
specific board.

2) FPGA designs
The Xilinx FPGA toolchain will generate a dts file to describe a
PowerPC or Microblaze FPGA design.  However, the generated file is
usually not complete.  Properties need to be modified (ie. console
device or kernel command line) and additional devices need to be added
(devices hanging off the i2c, mdio and spi busses, gpio connections).
The tool doesn't have a way to tailor the device tree generation, and
the FPGA toolchain doesn't know about board level details.  I want a
way for the developer to write a board-level .dts file that "wraps" or
includes the generated file so that it doesn't need to be modified by
hand.

I also have some design goals for the proposed solution.  First, I
want to avoid design a new programming language.  If we need full
programmatic generation of device trees, there are plenty of general
purpose languages that can do the job.  I already know of two existing
device tree generators; I wrote a prototype generator written in
Python, and the Michal wrote the Xilinx dts generator using TCL.  I
don't want users to have to learn a new language, and I don't want it
to be more complex than is needed to solve the specific use cases.  As
such, I've got no loops, no macros, and no conditionals.

The model that I'm using to approach the problem is to add syntax for
including .dts files (exactly how Jon proposed) and syntax for going
back after the tree is parsed and changing things.  I'm not an expert
on syntax, so I'm open to changes in the details, but this is what I'm
thinking.  Add the following directives to the syntax:

/include/ Include a file
/cd/ Change the 'working node', accepts a full or relative path to a
node.  Also accepts labels.
/delete-node/ Delete a child node.  Similar to /cd/, accepts a full
path, a relative path, or a label.
/delete-property/ Delete a property from the working node.

So, for example, I might have the following for the pcm030.dts:

/dts-v1/;
/include/ mpc5200.dtsi;  /* dts include file */
/* at this point the basic structure of an mpc5200 board is layed down */

/* Change some properties in the chosen and memory nodes. */
/cd/ /chosen;
linux,stdout-path =3D &psc1;
/cd/ /memory
reg =3D <0 0x10000000>;

/* Add some devices to the i2c bus */
/cd/ &i2c1;   /* "i2c1" is a label from mpc5200.dtsi */
rtc@51 {
        compatible =3D "nxp,pcf8563";
        reg =3D <0x51>;
};
eeprom@52 {
        compatible =3D "catalyst,24c32";
        reg =3D <0x52>;
};

/* Remove the first i2c bus because it isn't used */
/delete-node/ &i2c0

/* The watchdog doesn't work, so remove the fsl,has-wdt property */
/cd/ &timer0;
/delete-prop/ fsl,has-wdt;

And that's it.  I think this covers the functionality that I need.
What does everyone think?  Are there other important use cases that I
should also be addressing?

Cheers,
g.
