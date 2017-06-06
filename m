From: Stefani Seibold <stefani@seibold.net>
Subject: Re: [PATCH] external references for device tree overlays
Date: Tue, 06 Jun 2017 21:22:54 +0200
Message-ID: <1496776974.3821.6.camel@seibold.net>
References: <1496667567-13266-1-git-send-email-stefani.seibold.ext@huawei.com>
         <593657AF.8050208@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <593657AF.8050208@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>, Stefani Seibold <stefani.seibold.ext@huawei.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Holm Rauchfuss <holm.rauchfuss@huawei.com>
List-Id: devicetree@vger.kernel.org

Hi Frank,

On 06.06.2017, 00:20 -0700 Frank Rowand wrote::
> On 06/05/17 05:59, Stefani Seibold wrote:
> > From: Stefani Seibold <stefani@seibold.net>
> > 
> > This patch enables external references for symbols which are not
> > exported by the current device tree. For example
> > 
> > // RASPI example (only for testing)
> > /dts-v1/;
> > /plugin/;
> > 
> > / {
> >     compatible = "brcm,bcm2835", "brcm,bcm2708", "brcm,bcm2709";
> > 
> >     fragment@0 {
> >         target-path = "/soc/i2s@7e203000";
> >         __overlay__ {
> >             #address-cells = <0x00000001>;
> >             #size-cells = <0x00000001>;
> >             test = "test";
> >             timer = <&timer>;
> >         };
> >     };
> > 
> >     __external_symbols__ {
> >         timer = "/soc/timer@7e003000";
> >     };
> > };
> 
> My hope is that the dtc compiler will stop supporting specification
> of the
> __symbols__ node in dts source, and only generate it automatically in
> the dtb.
> That change to dtc would not allow any node name specified in a dts
> to begin
> with an underscore.  Thus node __external_symbols__ would not be
> allowed.
> 

The name is not so important to me, only the solution.

> > In case of the RASPI device tree this could be simple fixed by
> > modifing
> > the device tree source, but when the device tree is provided by a
> > closed
> > source BIOS this kind of missing symbol could not be fixed.
> 
> Is there a real example of this issue, or is this a theoretical
> concern?
> If this is a real example, we should be discouraging such behavior.
> 

Yes, I have a BIOS on some ARM64 servers which provides broken device tree. It also lacks some devices in this tree which needs references to other devices which lacks a phandle.


> The suggestion by Pantelis should work, but that is just a hack to
> get
> you out of a bad situation, not a good practice.
> 

I tried it, but it doesn't work. Look at my post to Pantelis.

- Stefani
