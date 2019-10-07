From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2 2/2] reset: Reset controller driver for Intel LGM SoC
Date: Mon, 7 Oct 2019 21:53:20 +0200
Message-ID: <CAFBinCAEzBk7tT5M-F3H4kLnKURRkK2oSSAmKkrjAn7_wdAROA@mail.gmail.com>
References: <34336c9a-8e87-8f84-2ae8-032b7967928f@linux.intel.com>
 <CAFBinCDfM3ssHisMBKXZUFkfoAFw51TaUuKt_aBgtD-mN+9fhg@mail.gmail.com>
 <657d796d-cb1b-472d-fe67-f7b9bf12fd79@linux.intel.com> <CAFBinCA5sRp1-siqZqJzFL2nuD3BtjrbD65QtpWbnTgtPNXY1A@mail.gmail.com>
 <cebd8f1d-90ab-87e7-9a34-f5c760688ce5@linux.intel.com> <CAFBinCCXo50OX6=8Fz-=nRKuELU_fMOCX=z6iwAcw0_Tfgn1ug@mail.gmail.com>
 <da347f1c-864c-7d68-33c8-045e46651f45@linux.intel.com> <CAFBinCDhLYmiORvHdZJAN5cuUjc6eWJK5n9Qg26B0dEhhqUqVQ@mail.gmail.com>
 <389f360a-a993-b9a8-4b50-ad87bcfec767@linux.intel.com> <CAFBinCBwrTajCrSf-UqZY5gHqUSn0UTmbc_TLPNVZrPyY5jpOA@mail.gmail.com>
 <20191003141955.zi5wqjqf4wa7lhv7@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191003141955.zi5wqjqf4wa7lhv7@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <pza@pengutronix.de>
Cc: Dilip Kota <eswara.kota@linux.intel.com>, "Chuan Hua, Lei" <chuanhua.lei@linux.intel.com>, cheol.yong.kim@intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, qi-ming.wu@intel.com, robh@kernel.org, Hauke Mehrtens <hauke@hauke-m.de>
List-Id: devicetree@vger.kernel.org

Hi Philipp,

On Thu, Oct 3, 2019 at 4:19 PM Philipp Zabel <pza@pengutronix.de> wrote:
[...]
> > because the register layout was greatly simplified for the newer SoCs
> > (for which there is reset-intel) compared to the older ones
> > (reset-lantiq).
> > Dilip's suggestion (in my own words) is that you take his new
> > reset-intel driver, then we will work on porting reset-lantiq over to
> > that so in the end we can drop the reset-lantiq driver.
>
> Just to be sure, you are suggesting to add support for the current
> lantiq,reset binding to the reset-intel driver at a later point? I
> see no reason not to do that, but I'm also not quite sure what the
> benefit will be over just keeping reset-lantiq as is?
according to Chuan and Dilip the current reset-lantiq implementation
is wrong [0].
my understanding is that the Lantiq and Intel LGM reset controllers
are identical except:
- the Lantiq variant uses a weird register layout (reset and status
registers not at consecutive offsets)
- the bits of the reset and status registers sometimes don't match on
the Lantiq variant
- the Intel variant has a dedicated registers area for the reset
controller registers, while the Lantiq variant mixes them with various
other functionality (for example: USB2 PHYs)

> > This approach means more work for me (as I am probably the one who
> > then has to do the work to port reset-lantiq over to reset-intel).
>
> More work than what alternative?
compared to "fixing" the existing reset-lantiq driver (reset callback)
and then (instead of adding a new driver) integrating Intel LGM
support into reset-lantiq

> > I'm happy to do that work if you think that it's worth following this
> > approach.  So I want your opinion on this before I spend any effort on
> > porting reset-lantiq over to reset-intel.
>
> Reset drivers are typically so simple, I'm not quite sure whether it is
> worth to integrate multiple drivers if it complicates matters too much.
> In this case though I expect it would just be adding support for a
> custom .of_xlate and lantiq specific register property parsing?
yes, that's how I understand the Lantiq and Intel reset controllers:
- reset/status/assert/deassert callbacks would be shared across all variants
- register parsing and of_xlate are SoC specific


Martin


[0] https://www.spinics.net/lists/devicetree/msg305951.html
