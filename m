From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: Re: [PATCH] mfd: devicetree: bindings: Add Qualcomm RPM regulator
 subnodes
Date: Tue, 24 Feb 2015 17:07:09 -0800
Message-ID: <20150225010708.GC31855@sonymobile.com>
References: <1422582666-32653-1-git-send-email-bjorn.andersson@sonymobile.com>
 <20150213221332.GA19975@qualcomm.com>
 <CAJAp7OjwuOdD=DynygFWnPH6tEVyf_dzOHQbUV_CHjS7OXihdg@mail.gmail.com>
 <54E3FE80.2090202@codeaurora.org>
 <CAJAp7OiheEhCPQEid7Mo1+A08i-t3q5xzpGZhoQW4s0Txa7Xkw@mail.gmail.com>
 <54E4F604.9090800@codeaurora.org>
 <CAJAp7OhwHQnYnd65Lzirk7jQ67+m-+MFVs3ktvPfiH0fs_qLYA@mail.gmail.com>
 <54E54A75.5030200@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <54E54A75.5030200@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Bjorn Andersson <bjorn@kryo.se>, Andy Gross <agross@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Brown <broonie@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed 18 Feb 18:29 PST 2015, Stephen Boyd wrote:

> On 02/18/15 13:08, Bjorn Andersson wrote:
> > On Wed, Feb 18, 2015 at 12:28 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:

After taking a deeper look at this I've come to the following
conclusion:

We can save 2100 bytes of data by spreading out the magic numbers from
the rpm resource tables into the regulator, clock and bus drivers. At
the cost of having this rpm-specific information spread out.

Separate of that we could rewrite the entire regulator implementation to
define all regulators in platform specific tables in the regulators.
This would save about 12-15k of ram.

This can however be done in two ways:
1) We modify the mfd driver to instatiate 3 mfd_cells; one of them
being "qcom,rpm-regulators". We modify the regulator driver to have
tables of the regulators for each platform and matching regulator
parameters by of_node name and registering these.

2) We stick with this binding, we then go ahead and do the same
modification to the mfd as above - passing the rpm of_node to the
regulator driver, that walks the children and match that to the current
compatible list. (in other words, we replace of_platform_populate with
our own mechamism).


The benefit of 2 is that we can use the code that was posted 10 months
ago and merged 3 months ago until someone prioritize those 12kb.


To take either of these paths the issue at the bottom has to be
resolved first.


More answers follows inline:

> 
> We're already maintaining these tables in qcom-rpm.c. I'm advocating for
> removing those tables from the rpm driver and putting the data into the
> regulator driver. Then we don't have to index into a sparse table to
> figure out what values the RPM wants to use. Instead we have the data at
> hand for a particular regulator based on the of_regulator_match.
> 

I do like the "separation of concerns" between the rpm driver and the
children, but you're right in that we're wasting almost 3kb in doing so:

(gdb) p sizeof(apq8064_rpm_resource_table) + sizeof(msm8660_rpm_resource_table) + sizeof(msm8960_rpm_resource_table)
$2 = 6384

vs

(gdb) p sizeof(struct qcom_rpm_resource) * (77 + 74 + 73)
$3 = 3584

The alternative would be to spread those magic constants out in the
three client drivers.

Looking at this from a software design perspective I stand by the
argument that the register layout of the rpm is not a regulator driver
implementation detail and is better kept separate.

As we decided to define the regulators in code but the actual
composition in dt it was not possible to put the individual numbers in
DT. Having reg = <165 68 48> does not make any sense, unless we perhaps
maintain said table in the dt binding documentation.

> I don't understand the maintenance argument either. The data has to go
> somewhere so the maintenance is always there.
> 

Well, you used exactly that argument when you questioned the way I did
pinctrl-msm, with a table per platform.

> From what I can tell, that data is split in two places. The regulator
> type knows how big the data we want to send is (1 or 2) and that is
> checked in the RPM driver to make sure that the two agree (this part
> looks like over-defensive coding).

Yeah, after debugging production code for years I like to be slightly on
the defensive side. But the size could of course be dropped from the
resource-tables; reducing the savings of your suggestion by another 800
bytes...

> Then the DT has a made up number that
> maps to 3 different numbers in the RPM driver.

Reading the following snippet in my dts file makes imidiate sense:

reg = <QCOM_RPM_PM8921_SMPS1>

the following doesn't make any sense:

reg = <116 31 30>;

Maybe it's write-once in a dts so it doesn't matter that much - as long
as the node is descriptive. But I like the properties to be human
understandable.

> The same could be done
> for b-family, where we have two numbers that just so happen to be user
> friendly enough to make sense on their own. Instead of being 165, 68,
> and 48, they're a #define SMPS and 1. We could make a #define SMPS1 and
> map it to a tuple with #define SMPS and 1. It looks like that was how
> you had b-family prototyped at one point.
> 

In family B things are completely different. The reason why I proposed
the similar setup was simply because I wanted to keep the api similar
(or even the same). But the mechanism is completely different;

The regulator driver builds up a key-value-pair list and encapsulte this
in a packet with a header that includes 'type' and 'id' of the resource
to be modified. This is then put in the packet-channel (smd) that goes
to the rpm.

The types are magic numbers but the id correlates to the resource id of
that type - so it doesn't give anything to maintain any tables for
family B.

Family A and B are so different that it doesn't make sense to share any
code, it was however my indention to have the dt bindings follow the
same structure!

> >
> > So for family B, where this is not necessary for the rpm driver, I
> > have revised this to instead be:
> >
> > #address-cells = <2>;
> > smps1 {
> >    reg = <QCOM_SMD_RPM_SMPA 1>;
> > }
> >
> > With #define QCOM_SMD_RPM_SMPA 0x61706d73, this information goes
> > straight into the smd packet and we don't have any tables at all.
> 
> How does the rpm write API look there? Does it take two numbers
> (resource type and resource id) instead of 1 (enum)? Is the plan to keep
> the write API the same as what's in qcom-rpm.c today?
> 

The prototype I have right now is:

int qcom_rpm_smd_write(struct qcom_smd_rpm *rpm,
		int state,
		u32 resource_type,
		u32 resource_id,
		void *buf,
		size_t count)

The function builds a packet - with the payload of "buf" - sends that
off and waits for an ack. There's not the extra steps that needs to be
taken in family A and both type and id are human readable.

> >
> >
> > Josh made an attempt to encode the data needed for family A in the DT
> > in a similar fasion, but we never found a reasonable way to do so.
> 
> With Josh's attempt would this be?
> 
> #address-cells = <3>;
> smps1 {
>     reg = <165 68 48>;
> };
> 

Yes, and with the approach of having this information in DT this would
have been a write-once never understand.

> What's different here from b-family besides another number? If the
> b-family way is reasonable I'm lost how this is not reasonable. Honestly
> it doesn't make much sense to me to have the reg property done like this
> if the value is always the same.

Right, from a RPM perspective the word "smps1" carries this information
with it. But the binding defines the "smps", which needs that additional
information (reg) to know what resource to bind to.

> If the RPM was moving these offsets
> around within the same compatible string it would make sense to put that
> in DT and figure out dynamically what the offsets are because they
> really can be different.

The proposed binding states the following:

- compatible:
        Usage: required
        Value type: <string>
        Definition: must be one of:
                    "qcom,rpm-pm8058-smps"
                    "qcom,rpm-pm8901-ftsmps"
                    "qcom,rpm-pm8921-smps"
                    "qcom,rpm-pm8921-ftsmps"

Doesn't this map to the case you say make sense?

> But given that the values are always the same
> for a given compatible it just means that the reg properties have to be
> a certain value as long as the compatible is qcom,rpm-msmXXXX-regulators.
> 

Yes, if the compatible covers the entire set of regulators. But if we're
going to align this with the other mfds (as you propose) then I don't
think there should be a compatible; mfd already have a way to
instantiate children and the rpm binding would describe every part of
the children as well.

> >
> >>>
> >>> A drawback of both these solutions is that supplies are specified on
> >>> the device's of_node, and hence it is no longer possible to describe
> >>> the supply dependency between our regulators - something that have
> >>> shown to be needed. Maybe we can open code the supply logic in the
> >>> regulator driver or we have to convince Mark about the necessity of
> >>> this.
> >> The supply dependencies are a detail of the PMIC implementation and it
> >> isn't configurable on a board-by-board basis. If we did the individual
> >> nodes and had the container regulators "device" we could specify the
> >> dependencies in C and then vin-supply is not necessary. That sounds like
> >> a win to me because we sidestep adding a new property.
> >>
> > Correct, it's not configurable on a board basis, but if I read the
> > pmic documentation correctly it's handled by external routing, hence
> > is not entirely static per pmic?
> 
> Hmm, yes you're right. It's not entirely static, in the sense that some
> supplies could be configured differently when the pmic is the same.
> 

Static or not, within rpm/pmic regulators there are dependencies that we
have to inform the regulator framework about - or handle ourselves.
Neither the rpm nor pmic will handle these for us.

> >
> > Non the less, we must provide this information to the regulator
> > framework in some way if we want its help.
> > If we define all regulators in code (and just bring their properties
> > from DT) then we could encapsulate the relationship there as well.
> > But with the current suggested solution of having all this data coming
> > from DT I simply rely on the existing infrastructure for describing
> > supply-dependencies in DT.
> >
> >
> 
> Yes I don't see how putting the data in C or in DT or having a
> regulators encapsulating node makes it impossible to specify the supply.
> 

Me neither, a month ago...

Here's the discussion we had with Mark regarding having the regulator
core pick up -supply properties from the individual child of_nodes of a
regulator driver:

https://lkml.org/lkml/2015/2/4/759

As far as I can see this has to be fixed for us to move over to having
one driver registering all our regulators, independently of how we
structure this binding.

Regards,
Bjorn
