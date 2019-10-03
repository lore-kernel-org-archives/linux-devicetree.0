From: Philipp Zabel <pza@pengutronix.de>
Subject: Re: [PATCH v2 2/2] reset: Reset controller driver for Intel LGM SoC
Date: Thu, 3 Oct 2019 16:19:55 +0200
Message-ID: <20191003141955.zi5wqjqf4wa7lhv7@pengutronix.de>
References: <34336c9a-8e87-8f84-2ae8-032b7967928f@linux.intel.com>
 <CAFBinCDfM3ssHisMBKXZUFkfoAFw51TaUuKt_aBgtD-mN+9fhg@mail.gmail.com>
 <657d796d-cb1b-472d-fe67-f7b9bf12fd79@linux.intel.com>
 <CAFBinCA5sRp1-siqZqJzFL2nuD3BtjrbD65QtpWbnTgtPNXY1A@mail.gmail.com>
 <cebd8f1d-90ab-87e7-9a34-f5c760688ce5@linux.intel.com>
 <CAFBinCCXo50OX6=8Fz-=nRKuELU_fMOCX=z6iwAcw0_Tfgn1ug@mail.gmail.com>
 <da347f1c-864c-7d68-33c8-045e46651f45@linux.intel.com>
 <CAFBinCDhLYmiORvHdZJAN5cuUjc6eWJK5n9Qg26B0dEhhqUqVQ@mail.gmail.com>
 <389f360a-a993-b9a8-4b50-ad87bcfec767@linux.intel.com>
 <CAFBinCBwrTajCrSf-UqZY5gHqUSn0UTmbc_TLPNVZrPyY5jpOA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAFBinCBwrTajCrSf-UqZY5gHqUSn0UTmbc_TLPNVZrPyY5jpOA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Dilip Kota <eswara.kota@linux.intel.com>, "Chuan Hua, Lei" <chuanhua.lei@linux.intel.com>, cheol.yong.kim@intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, qi-ming.wu@intel.com, robh@kernel.org, Hauke Mehrtens <hauke@hauke-m.de>
List-Id: devicetree@vger.kernel.org

Hi Martin, Dilip,

On Thu, Sep 19, 2019 at 09:51:48PM +0200, Martin Blumenstingl wrote:
> Hi Dilip,
> 
> (sorry for the late reply)

Same, sorry for the delay.

> On Thu, Sep 12, 2019 at 8:38 AM Dilip Kota <eswara.kota@linux.intel.com> wrote:
> [...]
> > The major difference between the vrx200 and lgm is:
> > 1.) RCU in vrx200 is having multiple register regions wheres RCU in lgm
> > has one single register region.
> > 2.) Register offsets and bit offsets are different.
> >
> > So enhancing the intel-reset-syscon.c to provide compatibility/support
> > for vrx200.
> > Please check the below dtsi binding proposal and let me know your view.
> >
> > rcu0:reset-controller@00000000 {
> >      compatible= "intel,rcu-lgm";
> >      reg = <0x0000000 0x80000>, <reg_set2 size>, <reg_set3 size>,
> > <reg_set4 size>;
> I'm not sure that I understand what are reg_set2/3/4 for
> the first resource (0x80000 at 0x0) already covers the whole LGM RCU,
> so what is the purpose of the other register resources
> 
> >     intel,global-reset = <0x10 30>;
> >     #reset-cells = <3>;
> > };
> >
> > "#reset-cells":
> >    const:3
> >    description: |
> >      The 1st cell is the reset register offset.
> >      The 2nd cell is the reset set bit offset.
> >      The 3rd cell is the reset status bit offset.
> I think this will work fine for VRX200 (and even older SoCs)
> as you have described in your previous emails we can determine the
> status offset from the reset offset using a simple if/else
> 
> for LGM I like your initial suggestion with #reset-cells = <2> because
> it's easier to read and write.
>
> > Reset driver takes care of parsing the register address "reg" as per the
> > ".data" structure in struct of_device_id.
> > Reset driver takes care of traversing the status register offset.
> the differentiation between two and three #reset-cells can also happen
> based on the struct of_device_id:
> - the LGM implementation would simply also use the reset bit as status
> bit (only two cells are needed)
> - the implementation for earlier SoCs would parse the third cell and
> use that as status bit
> 
> Philipp, can you please share your opinion on how to move forward with
> the reset-intel driver from this series?

That all sounds reasonable for VRX200/LGM to me.

> because the register layout was greatly simplified for the newer SoCs
> (for which there is reset-intel) compared to the older ones
> (reset-lantiq).
> Dilip's suggestion (in my own words) is that you take his new
> reset-intel driver, then we will work on porting reset-lantiq over to
> that so in the end we can drop the reset-lantiq driver.

Just to be sure, you are suggesting to add support for the current
lantiq,reset binding to the reset-intel driver at a later point? I
see no reason not to do that, but I'm also not quite sure what the
benefit will be over just keeping reset-lantiq as is?

> This approach means more work for me (as I am probably the one who
> then has to do the work to port reset-lantiq over to reset-intel).

More work than what alternative?

> I'm happy to do that work if you think that it's worth following this
> approach.  So I want your opinion on this before I spend any effort on
> porting reset-lantiq over to reset-intel.

Reset drivers are typically so simple, I'm not quite sure whether it is
worth to integrate multiple drivers if it complicates matters too much.
In this case though I expect it would just be adding support for a
custom .of_xlate and lantiq specific register property parsing?

regards
Philipp
