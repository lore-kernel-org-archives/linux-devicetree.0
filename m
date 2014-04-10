From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [RFC PATCH v2] edac: synopsys: Added EDAC support for zynq ddr
 ecc controller
Date: Thu, 10 Apr 2014 11:49:57 +0200
Message-ID: <5e0042b6-f169-4025-8fd7-9d70c2ed0cf6@AM1EHSMHS012.ehs.local>
References: <1220b715-6fc2-42ed-8393-b9859fc0deb9@TX2EHSMHS021.ehs.local> <20140408204047.GQ30077@pd.tnic> <534633C0.9090905@monstr.eu> <20140410092144.GD29093@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140410092144.GD29093@pd.tnic>
Sender: linux-kernel-owner@vger.kernel.org
To: Borislav Petkov <bp@alien8.de>
Cc: Michal Simek <monstr@monstr.eu>, Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>, dougthompson@xmission.com, linux-edac@vger.kernel.org, michal.simek@xilinx.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net, sorenb@xilinx.com, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kpc528@gmail.com, kalluripunnaiahchoudary@gmail.com, punnaia@xilinx.com
List-Id: devicetree@vger.kernel.org

On 04/10/2014 11:21 AM, Borislav Petkov wrote:
> On Thu, Apr 10, 2014 at 08:01:36AM +0200, Michal Simek wrote:
>> Just add it to Zynq maintainer fragment as we are doing for non
>> zynq/xilinx drivers.
> 
> Yep, as a file pattern F:

yep.

>> At least the is the first time when someone saying that only some
>> functions should be documented.
> 
> I don't see the need to document simple functions which are *obvious*.
> But if you want to do that, I'm not going to stop you so be my guest.

ok. thanks.


>> I don't think this is good to do. When we remove this prefix entirely
>> it is bigger chance that the same function name will be used by
>> another driver. It is not a problem with linking but the same
>> functions names will be listed in System.map which will complicate
>> debugging.
> 
> Ok, fair enough. You probably still want to make them shorter, though,
> so that your code doesn't have to be line-broken too much. For example,
> since we only load a single edac driver per system, you can shorten the
> prefix to "edac_" only.

I agree with you that we can use shorter name.
I have checked this with Punnaiah and I can't see any problem to have
more edac drivers in the system.
For zynq there is primary ddr controller which is target by this driver.
Then we are talking about L2 in another thread.
Because zynq has programmable logic next to chip where you can add
soft memory controller (we have these hw designs) on the same bus
then there could be others edac drivers.
I would say how many you like till pins on the package.

Thanks,
Michal
