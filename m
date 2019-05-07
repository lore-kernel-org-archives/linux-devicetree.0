From: "Claus H. Stovgaard" <cst@phaseone.com>
Subject: Re: [PATCH 3/3] usb: dwc3: gadget: Add support for disabling U1 and
 U2 entries
Date: Tue, 7 May 2019 15:17:28 +0200
Message-ID: <1557235048.114189.22.camel@phaseone.com>
References: <1556792423-4833-1-git-send-email-anurag.kumar.vulisha@xilinx.com>
         <1556792423-4833-4-git-send-email-anurag.kumar.vulisha@xilinx.com>
         <30102591E157244384E984126FC3CB4F639E7BA8@us01wembx1.internal.synopsys.com>
         <1557176302.18203.20.camel@phaseone.com>
         <BYAPR02MB55918A76A1567C3209860748A7310@BYAPR02MB5591.namprd02.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR02MB55918A76A1567C3209860748A7310@BYAPR02MB5591.namprd02.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anurag Kumar Vulisha <anuragku@xilinx.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "v.anuragkumar@gmail.com" <v.anuragkumar@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Anurag

> > > Please use "-" rather than "_" in the property names.
> > I have thought about this feature over the weekend, and think the
> > naming should be
> > changed to something like "snps,bos-u1-exit-lat-in-us"
> > and named the same in the code. And then be the value used by the
> > get_config_params. E.g. the device-tree is used to set the values
> > directly used for
> > bUxdevExitLat instead of named something not related to exit
> > latency.
> > 
> > With this the name and function is a 1 to 1 match, and you can
> > among others set it to
> > 0 for optaining what Anurag wants.
> > 
> Your suggestion looks good but the problem is the U1 and U2 exit
> latencies are
> fixed values in dwc3 controller(can be found in HCSPARAMS3). Adding
> different
> exit latencies may modify the U1SEL/U2SEL values sent from the host
> but the real
> dwc3 controller exit latencies are not getting changed. Because of
> this reason I
> had opted "snps,dis_u1_entry_quirk", so that the U1/U2 exit latency
> values
> reported in BOS descriptor can be either be zero (when U1/U2 entries
> needs to be
> disabled) or non-zero value (reported in HCSPARAMS3) when U1/U2
> states allowed.
> Based on this I think it is better if we can continue with "snps,dis-
> u1-entry-quirk"
> instead of the "snps,bos-u1-exit-lat-in-us". Please  provide your
> opinion on this.

With this in mind I can see why having direct control over the exit
latency value might not be optimum in many situations.
Regarding the name, I think the snps,dis_u1_entry_quirk will be a good
name, if it is combined with the DCTL control. E.g. remove the configfs
part of my patch, and merge the DCTL control with your patches.
If the dt-binding still only control the bos descriptor I think a
better name is something with u1_force_exist_lat_0 or similar.

I don't think setting bos to 0 or controlling DCTL will be used
individual, so to keep things simple I will vote for
snps,dis_u1_entry_quirk, and then just control all elements regarding
disabling U1/U2 from this dt-binding.

Please cut what your need from my patch.

BR Claus
