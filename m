From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson: fix g12a buses
Date: Thu, 17 Jan 2019 21:39:04 +0100
Message-ID: <ba1f56258e7873041a0f75996e376170563c9e6e.camel@baylibre.com>
References: <20190116165236.8330-1-jbrunet@baylibre.com>
         <CAFBinCBFge2tir-MXw+ojTxzW+7n9Uf4FzCahrw0MDzAYV2SSg@mail.gmail.com>
         <f7289814e316ad5879848fb8c379db396f615828.camel@baylibre.com>
         <CAFBinCDhryOWHmRKp7GhWp2O+NpJziEgHoUE4HKVitTPDMrrBQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFBinCDhryOWHmRKp7GhWp2O+NpJziEgHoUE4HKVitTPDMrrBQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 2019-01-17 at 21:27 +0100, Martin Blumenstingl wrote:
> OK, but we had incorrect documentation in the past. did you check this
> with someone from Amlogic?
> 
> I'm curious because there seem to be two different approaches here:
> 1) hiubus name and offsets are being fixed within this patch
> 2) aobus is being dropped here and re-introduced with a different name later
> on
> 

because hiu exist and aobus does not, for which both the name and size was
wrong

> approach 1) can also be used for the "rti" region (at least in my
> opinion, the patch doesn't explain why it can't be done):

THe patch remove aobus (instead of fixing name and size) because, of the
multiple region documented covered by this 'made region', I did not anticipate
which one will be required and I did not want to add them all.

Better to add them as needed, which is want I done for pinctrl as you pointed
out

> rename "aobus" to "rti" and change the size to either 0x1000 or 0xb000
> (both values can be found in mesong12a.dtsi from
> buildroot_openlinux_kernel_4.9_fbdev_20180706)

RTI is added here:
https://lkml.kernel.org/r/20190117103151.3349-1-jbrunet@baylibre.com

I don't really understand the problem ? result is the same
