From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH] arm64: dts: meson: fix g12a buses
Date: Thu, 17 Jan 2019 22:20:23 +0100
Message-ID: <CAFBinCAdJu2C-LWspiHR4vVr=PUD2HGNi4zz+CSJP96ZE4GoJw@mail.gmail.com>
References: <20190116165236.8330-1-jbrunet@baylibre.com> <CAFBinCBFge2tir-MXw+ojTxzW+7n9Uf4FzCahrw0MDzAYV2SSg@mail.gmail.com>
 <f7289814e316ad5879848fb8c379db396f615828.camel@baylibre.com>
 <CAFBinCDhryOWHmRKp7GhWp2O+NpJziEgHoUE4HKVitTPDMrrBQ@mail.gmail.com> <ba1f56258e7873041a0f75996e376170563c9e6e.camel@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ba1f56258e7873041a0f75996e376170563c9e6e.camel@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, jianxin.pan@amlogic.com
List-Id: devicetree@vger.kernel.org

On Thu, Jan 17, 2019 at 9:39 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> On Thu, 2019-01-17 at 21:27 +0100, Martin Blumenstingl wrote:
> > OK, but we had incorrect documentation in the past. did you check this
> > with someone from Amlogic?
> >
> > I'm curious because there seem to be two different approaches here:
> > 1) hiubus name and offsets are being fixed within this patch
> > 2) aobus is being dropped here and re-introduced with a different name later
> > on
> >
>
> because hiu exist and aobus does not, for which both the name and size was
> wrong
>
> > approach 1) can also be used for the "rti" region (at least in my
> > opinion, the patch doesn't explain why it can't be done):
>
> THe patch remove aobus (instead of fixing name and size) because, of the
> multiple region documented covered by this 'made region', I did not anticipate
> which one will be required and I did not want to add them all.
>
> Better to add them as needed, which is want I done for pinctrl as you pointed
> out
>
> > rename "aobus" to "rti" and change the size to either 0x1000 or 0xb000
> > (both values can be found in mesong12a.dtsi from
> > buildroot_openlinux_kernel_4.9_fbdev_20180706)
>
> RTI is added here:
> https://lkml.kernel.org/r/20190117103151.3349-1-jbrunet@baylibre.com
>
> I don't really understand the problem ? result is the same
the actual problem is "me" as I have conflicting information:
- Amlogic's buildroot kernel (for G12A) uses similar bus definitions
as the GX SoCs (for which there are public datasheets) - this is how
Jianxin added it to meson-g12a.dtsi originally
- this patch does it different - but cannot check if this is correct
(no public datasheet is available for G12A or AXG) nor do I have a
"big picture" of upcoming changes

Cc'ing Jianxin: can you please review Jerome's patch and give some
more details on the memory map on G12A so further contributions can be
reviewed easier?


Regards
Martin
