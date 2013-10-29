From: Shirish S <shirish-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 3/3] drm: exynos: hdmi: Add dt support for hdmiphy settings
Date: Tue, 29 Oct 2013 13:18:56 +0530
Message-ID: <CAHvYUDAcnVYKUtrqaXMz5UDZwSpdFL7PSL7WtFGme0V1_kVJxA@mail.gmail.com>
References: <1382941462-6691-1-git-send-email-s.shirish@samsung.com>
	<1382941462-6691-4-git-send-email-s.shirish@samsung.com>
	<20131028065006.GA3065@kartoffel>
	<CAHvYUDDoP=Q=1dyN4xBWTaATF9KgZhWypo1mX7uRww2Oc28yQA@mail.gmail.com>
	<20131028223831.GA4763@kartoffel>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131028223831.GA4763@kartoffel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Shirish S <s.shirish-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 29, 2013 at 4:08 AM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
> On Mon, Oct 28, 2013 at 10:15:00AM +0000, Shirish S wrote:
>> Hi Mark,
>> Firstly thanks for reviewing.
>
> Hi,
>
> Please could you refrain from replying in HTML and use plaintext, it's rather
> difficult to respond sensibly.
>
Sorry for your troubles,hope with this reply its fine.
>>
>>
>> On Mon, Oct 28, 2013 at 12:20 PM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
>>
>>     Hi,
>>
>>     On Mon, Oct 28, 2013 at 06:24:22AM +0000, Shirish S wrote:
>>     > This patch adds dt support to hdmiphy config settings
>>     > as it is board specific and depends on the signal pattern
>>     > of board.
>>     >
>>     > Signed-off-by: Shirish S <s.shirish-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>     > ---
>>     >  .../devicetree/bindings/video/exynos_hdmi.txt      |   29 ++++++++
>>     >  arch/arm/boot/dts/exynos5250-arndale.dts           |    6 +-
>>     >  drivers/gpu/drm/exynos/exynos_hdmi.c               |   70
>>     ++++++++++++++++++--
>>     >  3 files changed, 98 insertions(+), 7 deletions(-)
>>     >
>>     > diff --git a/Documentation/devicetree/bindings/video/exynos_hdmi.txt b/
>>     Documentation/devicetree/bindings/video/exynos_hdmi.txt
>>     > index 323983b..770f92d 100644
>>     > --- a/Documentation/devicetree/bindings/video/exynos_hdmi.txt
>>     > +++ b/Documentation/devicetree/bindings/video/exynos_hdmi.txt
>>     > @@ -13,6 +13,27 @@ Required properties:
>>     >       b) pin number within the gpio controller.
>>     >       c) optional flags and pull up/down.
>>     >
>>     > +- hdmiphy-confs: following information about the hdmiphy conf settings.
>>
>>     Judging by the other patches, this is a node, not a property.
>>
>>
>> Yes its a node.
>
> My point was that the documentation should reflect this.
>
Its property and not a node, i had misunderstood the concepts.
>>
>>     > +        a) "nr-confs" specifies the number of pixel clocks supported.
>>
>>     Why is this needed? Someone will get it wrong eventually and it can be
>>     figured
>>     out currently by counting the child nodes, testing if they have the
>>     appropriate
>>     properties.
>>
>>
>> Actually i need to get the array size also from dt, hence this is approach i
>> have taken
>
> While this approach works now for perfect DTs, as I pointed out it is encoding
> redundant information and could be broken by future changes. Please fix this.
>
Hope you have had a look at my next patch set (v4), this property is
now more or less optional,
i mean if the user enters wrong number of configs it shall not be
considered and driver shall use the predefined
table provided in the driver.
>>
>>     > +     b) "confX: confX" specifies the phy configuration settings,
>>
>>     This is confusing. What is X?
>>
>>
>> I am trying to generalize, here X means any numerical, and the programmer needs
>> to
>> make sure conf0:conf0, wherein X is 0.I shall provide the values permitted for
>> X in my next patch set.
>
> Please be explicit with your definitions. Experience shows that people will get
> this wrong.
>
Is the way i have documented in patch set v4 still wrong, or its clear?
>>
>>     The label is irrelevant -- none of this patch looks for phandles pointing
>>     at
>>     configurations, nor is the precise name of the label important.
>>
>>     This is a node, not a property.
>>
>>
>> Ideally every conf<numerical value>  a combination of pixel clock and new
>> values for data and clock level.
>
> This answers neither of my concerns.
>
The fact that its a property and not a node,and contains pairs of
pixel clock and config values should answer your concerns.
Please note: in this case(exynos5250) the config values seem to same
for all the pixel clocks, however in the next chipset (exynos5420) the
values vary across pixel clocks, that is the reason why i need to keep
these config values attached to pixel clocks.
>>
>>     > +             "clock-frequency" specifies the pixel clock
>>
>>     Is this a frequency to configure the pixel clock with, or the
>>     pre-determined
>>     frequency of a clock that we will select?
>>
>>
>> No, as the explanation suggests its the pixel clock itself.
>
> That doesn't answer my question. Is this the frequency that the pixel clock is
> fixed at in hardware, or is this a value to configure the pixel clock with?
>
This the frequency that the pixel clock is fixed at in hardware also
note that i have changed the name from clock-frequency to pixel-clock.
>>
>>     > +             "con-de-emphasis-level" specifies the configuration
>>     > +             of Data De-emphasis levels.
>>
>>     Please explain _why_ we need this configuration.
>>
>>
>> Our chipset to undergo HDMI compliance test and noticed that the HDMI
>> Compliance Test id 7-10 was failing
>> for eye diagram test. Hence on further analysis, it was found that altering the
>> data de-emphasis levels and clock
>> level are required to pass the test.And also these values may vary for variuos
>> board revisons, this is the purpose of this whole patch set.
>
> Ok, this sounds reasonable for the DT. Could you please add a description to
> the binding documenting precisely what this property does and why we need it.
>
Ok, i have added it in patch set v4.
>>
>>     Also, "con" is not a good abbreviation of "configuration", "config" would
>>     be
>>     preferable.
>>
>>
>> Agreed, will update the same in next patch set.
>
> Thanks.
>
>>
>>     > +                     0x145D0040h[3:0] permitted values:
>>     > +                             0000 means 760 mVdiff && 1111 means 1400
>>     mVdiff
>>
>>     I assume the 'h' suffix is a redundant description that the constant is
>>     hexadecimal. Please drop it.
>>
>>
>> Agreed, will update the same in next patch set.
>
> Thanks.
>
>>
>>     What is 0x145D0040? The address of the register, or its value?
>>
>>
>> Its the address of the hdmiphy register for data level configuration.
>
> Is the register named in any way? The address is completely opaque, especially
> as we have no documentation linked in the binding document.
>
To configure hdmi phy we use dedicated i2c, the address of hdmiphy is 0x70.
And in this patch i am trying to address the offset of 16 and 23,
there is no name as such.
However i shall give a name, but note its not in the manual.
>>
>>
>>     The description is confusing, 0x145D0040h[3:0] is always 0[3:0].
>>
>>
>> This description is extracted from the one specified in manual, in my first
>> patch set the reviewers had asked me
>> to provide the explaination for every bit, which i have provided.
>
> My comment was invalid given your description that this is an offset, this
> would be far clearer with a name for the register.
>
>>
>>     Why does this need to be the exact value programmed into the register
>>     rather
>>     than separate values the driver can compose?
>>
>>
>> As mentioned above the value is must for clearing the test 7-10, and also its
>> derived by a trial and error method
>> with the HDMI analyser.
>
> While we need the values, the _representation_ in DT does not have to match the
> registers precisely. If you can provide a strong argument for having the opaque
> values, then I will consider it ok.
>
As you can see the documentation describes every bit of these
registers, we have arrived at the mentioned values by trial and error
method. I have described what these opaque values means in the dt
files.Kindly have a look in patch set v4.
>>
>>     > +                     0x145D0040h[7:4] permitted values:
>>     > +                             000     0dB
>>     > +                             0001    -0.25dB
>>     > +                             0010    -0.7dB
>>     > +                             0011    -1.15dB
>>     > +                             1111    -7.45dB
>>
>>     Again, this seems very odd. Why this format?
>>
>>
>> This binary translation of what the bits actually mean.In the final result it
>> was found that at 0.7dB there is no noise in the output.
>
> My argument here was that the DT representation need not be identical to the
> raw values programmed into the hardware.
>
I am not clear, that is the whole reason why we are planning to move to dt.
Instead of duplicating the hdmiphy config structures(which again are
raw values) in the driver, we want to associate these raw values in
the revision specific dt files.
>>
>>     > +             "con-clock-level" specifies the configuration for
>>     > +             the corresponding clock level.
>>
>>     To repeat my comment on "con-de-emphasis-level", "con" is not a good
>>     abbreviation for "configuration".
>>
>>
>> Agreed, will update the same in next patch set.
>
> Thanks.
>
>>
>>     > +                     0x145D005Ch [1:0] permitted values:
>>     > +                             00 means 0 mVdiff && 11 means 60 mVdiff
>>     > +                     0x145D005Ch [7:3] permitted values:
>>     > +                             00000 is 790 mVdiff
>>     > +                             11111 is 1430 mVdiff
>>
>>     Please explain why we must use this exact format rather than one which may
>>     be
>>     understood more easily.
>>
>>
>> I hope by now have made this point clear!
>
> So far I am unsure. However a reposting with the updates you've promised may
> help.
>
> One thing I worry about are the other bits in these registers. Are hey used?
> Are we doing non-destructive modifications to them?
>
The other remaining bits are non writable, and hence we are not doing
any destructive modifications.
>>
>>     >  Example:
>>     >
>>     >       hdmi {
>>     > @@ -20,4 +41,12 @@ Example:
>>     >               reg = <0x14530000 0x100000>;
>>     >               interrupts = <0 95 0>;
>>     >               hpd-gpio = <&gpx3 7 1>;
>>     > +             hdmiphy-confs {
>>     > +                     nr-confs = <1>;
>>     > +                     conf0: conf0 {
>>     > +                             clock-frequency = <25200000>;
>>     > +                             conf-de-emphasis-level =  /bits/ 8 <0x26>;
>>     > +                             conf-clock-level =  /bits/ 8 < 0x66>;
>>
>>     Why are these 8-bit? That wasn't described in the binding at all so far.
>>
>>
>> These are 8 bit by design(as mentioned in the manual) and were not part of
>> device tree to be explained before.
>
> The representation in the device tree is a required element of the binding. The
> fact that a register has a certain width does not imply that its DT
> representation must be, and this _will_ confuse people. Case in point is my
> confusion here.
>
As these values are directly copied into the 8 bit arrays of configs,
i think its better if we go ahead with
the cast, also as dt facilitates us with the /bits/8, to avoid
multiple levels of typecasting in the driver.
>>
>>     > +                     };
>>     > +             }
>>     >       };
>>     > diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts
>>     /exynos5250-arndale.dts
>>     > index c23f16b..436b75a 100644
>>     > --- a/arch/arm/boot/dts/exynos5250-arndale.dts
>>     > +++ b/arch/arm/boot/dts/exynos5250-arndale.dts
>>     > @@ -424,6 +424,9 @@
>>     >
>>     >       hdmi {
>>     >               hpd-gpio = <&gpx3 7 2>;
>>     > +             vdd_osc-supply = <&ldo10_reg>;
>>     > +             vdd_pll-supply = <&ldo8_reg>;
>>     > +             vdd-supply = <&ldo8_reg>;
>>     >               hdmiphy-confs {
>>     >                       nr-confs = <13>;
>>     >                       conf0: conf0 {
>>     > @@ -492,9 +495,6 @@
>>     >                               conf-clock-level =  /bits/ 8 < 0x66>;
>>     >                       };
>>     >               };
>>     > -             vdd_osc-supply = <&ldo10_reg>;
>>     > -             vdd_pll-supply = <&ldo8_reg>;
>>     > -             vdd-supply = <&ldo8_reg>;
>>     >       };
>>     >
>>     >       mmc_reg: voltage-regulator {
>>
>>     Why is this moving? It in no way relates to the rest of the patch, and
>>     wasn't
>>     described in the commit message.
>>
>>
>> Oops that was supposed to be part of previous pach,will update it.
>
> Ok.
>
>>
>>     [...]
>>
>>     > +static int drm_hdmi_dt_parse_phy_conf(struct platform_device *pdev,
>>     > +                                             struct hdmi_context *hdata)
>>     > +{
>>     > +     struct device *dev = &pdev->dev;
>>     > +     struct device_node *dev_np = dev->of_node;
>>     > +     struct device_node *phy_conf, *cfg_np;
>>     > +     int i = 0;
>>     > +
>>     > +     phy_conf = of_find_node_by_name(dev_np, "hdmiphy-confs");
>>     > +     if (phy_conf == NULL) {
>>     > +             DRM_ERROR("Did not find hdmiphy_conf node\n");
>>     > +             return -ENODEV;
>>     > +     }
>>     > +
>>     > +     of_property_read_u32(phy_conf, "nr-confs", &hdata->nr_confs);
>>
>>     This can fail, returning an error code. Either check it, or remove this
>>     property entirely and do this based on the number of children which have
>>     the
>>     appropriate properties.
>>
>>
>> Ok will add a check.
>
> Cheers.
>
>>
>>     > +     hdata->confs = kzalloc((hdata->nr_confs * sizeof
>>     > +                                     (struct hdmiphy_config)),
>>     GFP_KERNEL);
>>
>>     Why the brackets on the first argument of kzalloc? They're superfluous.
>>
>>     What if kzalloc fails?
>>
>>
>> Ok, will put a check.
>
> Thanks.
>
>>
>>     > +
>>     > +     /* Initialize with default config */
>>     > +     hdata->confs = hdmiphy_v14_configs;
>>     > +
>>     > +     for_each_child_of_node(phy_conf, cfg_np) {
>>
>>     What if nr-confs is smaller than the number of child nodes?
>>
>>
>> it basically is the array size and it should be 1 + child nodes as mentioned in
>> the descriptions, i
>> assume that the programmer takes care of it.
>
> Experience has shown people _will_ get this wrong, and it's entirely possible
> to make do without nr-confs. I would very much like to see nr-confs disappear.
>
>>
>>     > +             if (!of_find_property(cfg_np, "clock-frequency", NULL))
>>     > +                     continue;
>>     > +
>>     > +             if (of_property_read_u32_array(cfg_np, "clock-frequency",
>>     > +                                     (u32 *)&hdata->confs[i].
>>     > +                                                     pixel_clock, 1)) {
>>
>>     Don't split &hdata->confs[i].pixel_clock over two lines.
>>
>>     Why is the cast necessary?
>
> Please explain the cast.
>
have removed it.
>>
>>     Why not just of_property_read_u32? This only ever has a single value, and
>>     while
>>     there's no of_property_read_u8, of_property_read_u32 exists.
>>
>>
>> Ok, agreed.
>
> Thanks.
>
>>
>>     > +                             DRM_ERROR("Failed to get pixel clock\n");
>>     > +                             return -EINVAL;
>>     > +             }
>>     > +
>>     > +             /* Overwrite the data de-emphasis and data level */
>>     > +             if (of_property_read_u8_array(cfg_np,
>>     "conf-de-emphasis-level",
>>     > +                                     (u8 *)&hdata->confs[i].conf[16],
>>     1)) {
>>
>>     Why is this cast necessary?
>
> Please explain the cast.
>
have removed the cast.
>>
>>     I don't see why this must be an 8 bit property.
>>
>>
>> As mentioned earlier its by design 8 bits.
>
> The hardware width doesn't necessitate the representation. This should be
> documented if required, or just changed to be a u32 cell so as to confuse fewer
> people.
>
>>
>>     > +                             DRM_ERROR("Failed to get conf\n");
>>     > +                             return -EINVAL;
>>     > +             }
>>     > +             /* Overwrite the clock level diff */
>>     > +             if (of_property_read_u8_array(cfg_np, "conf-clock-level",
>>     > +                                     (u8 *)&hdata->confs[i].conf[23],
>>     1)) {
>>
>>     Why the cast?
>>
>>
>> Same explaination as above.
>
> There was no explanation above. Please explain the cast.
>
> Thanks,
> Mark.
Thanks & Regards,
Shirish S
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
