From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2 2/2] reset: Reset controller driver for Intel LGM SoC
Date: Thu, 19 Sep 2019 21:51:48 +0200
Message-ID: <CAFBinCBwrTajCrSf-UqZY5gHqUSn0UTmbc_TLPNVZrPyY5jpOA@mail.gmail.com>
References: <90cc600d6f7ded68f5a618b626bd9cffa5edf5c3.1566531960.git.eswara.kota@linux.intel.com>
 <3813e658-1600-d878-61a4-29b4fe51b281@linux.intel.com> <CAFBinCA_B9psNGBeDyhkewhoutNh6HsLUN+TRfO_8vuNqhis4Q@mail.gmail.com>
 <48b90943-e23d-a27a-c743-f321345c9151@linux.intel.com> <CAFBinCD1oKxYm8QD7XfZUWq_HC5A4GLMmLCnZrcRvpTxrKo30w@mail.gmail.com>
 <19719490-178a-18fd-64f2-f77d955897f7@linux.intel.com> <CAFBinCDmi4HN4Ayg4T8aKUeu4hrUmVQ+z-hTN-6XMhiOCUcHjg@mail.gmail.com>
 <34336c9a-8e87-8f84-2ae8-032b7967928f@linux.intel.com> <CAFBinCDfM3ssHisMBKXZUFkfoAFw51TaUuKt_aBgtD-mN+9fhg@mail.gmail.com>
 <657d796d-cb1b-472d-fe67-f7b9bf12fd79@linux.intel.com> <CAFBinCA5sRp1-siqZqJzFL2nuD3BtjrbD65QtpWbnTgtPNXY1A@mail.gmail.com>
 <cebd8f1d-90ab-87e7-9a34-f5c760688ce5@linux.intel.com> <CAFBinCCXo50OX6=8Fz-=nRKuELU_fMOCX=z6iwAcw0_Tfgn1ug@mail.gmail.com>
 <da347f1c-864c-7d68-33c8-045e46651f45@linux.intel.com> <CAFBinCDhLYmiORvHdZJAN5cuUjc6eWJK5n9Qg26B0dEhhqUqVQ@mail.gmail.com>
 <389f360a-a993-b9a8-4b50-ad87bcfec767@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <389f360a-a993-b9a8-4b50-ad87bcfec767@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dilip Kota <eswara.kota@linux.intel.com>, p.zabel@pengutronix.de
Cc: "Chuan Hua, Lei" <chuanhua.lei@linux.intel.com>, cheol.yong.kim@intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, qi-ming.wu@intel.com, robh@kernel.org, Hauke Mehrtens <hauke@hauke-m.de>
List-Id: devicetree@vger.kernel.org

Hi Dilip,

(sorry for the late reply)

On Thu, Sep 12, 2019 at 8:38 AM Dilip Kota <eswara.kota@linux.intel.com> wrote:
[...]
> The major difference between the vrx200 and lgm is:
> 1.) RCU in vrx200 is having multiple register regions wheres RCU in lgm
> has one single register region.
> 2.) Register offsets and bit offsets are different.
>
> So enhancing the intel-reset-syscon.c to provide compatibility/support
> for vrx200.
> Please check the below dtsi binding proposal and let me know your view.
>
> rcu0:reset-controller@00000000 {
>      compatible= "intel,rcu-lgm";
>      reg = <0x0000000 0x80000>, <reg_set2 size>, <reg_set3 size>,
> <reg_set4 size>;
I'm not sure that I understand what are reg_set2/3/4 for
the first resource (0x80000 at 0x0) already covers the whole LGM RCU,
so what is the purpose of the other register resources

>     intel,global-reset = <0x10 30>;
>     #reset-cells = <3>;
> };
>
> "#reset-cells":
>    const:3
>    description: |
>      The 1st cell is the reset register offset.
>      The 2nd cell is the reset set bit offset.
>      The 3rd cell is the reset status bit offset.
I think this will work fine for VRX200 (and even older SoCs)
as you have described in your previous emails we can determine the
status offset from the reset offset using a simple if/else

for LGM I like your initial suggestion with #reset-cells = <2> because
it's easier to read and write.

> Reset driver takes care of parsing the register address "reg" as per the
> ".data" structure in struct of_device_id.
> Reset driver takes care of traversing the status register offset.
the differentiation between two and three #reset-cells can also happen
based on the struct of_device_id:
- the LGM implementation would simply also use the reset bit as status
bit (only two cells are needed)
- the implementation for earlier SoCs would parse the third cell and
use that as status bit

Philipp, can you please share your opinion on how to move forward with
the reset-intel driver from this series?
The reset_control_ops from the reset-intel driver are (in my opinion)
a bug-fixed and improved version of what we already have in
drivers/reset/reset-lantiq.c. The driver is NOT simply copy and paste
because the register layout was greatly simplified for the newer SoCs
(for which there is reset-intel) compared to the older ones
(reset-lantiq).
Dilip's suggestion (in my own words) is that you take his new
reset-intel driver, then we will work on porting reset-lantiq over to
that so in the end we can drop the reset-lantiq driver. This approach
means more work for me (as I am probably the one who then has to do
the work to port reset-lantiq over to reset-intel). I'm happy to do
that work if you think that it's worth following this approach.
So I want your opinion on this before I spend any effort on porting
reset-lantiq over to reset-intel.


Martin
