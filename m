From: Rob Herring <robherring2@gmail.com>
Subject: Re: [RFC 1/5] of: Add support for ePAPR "stdout-path" property
Date: Fri, 28 Mar 2014 16:56:28 -0500
Message-ID: <CAL_Jsq+xTeocLtS9GFWLCkoV+USACma+w0=O_ysekvTGhYVhZg@mail.gmail.com>
References: <1396022885-6102-1-git-send-email-grant.likely@linaro.org>
	<1396022885-6102-2-git-send-email-grant.likely@linaro.org>
	<1396042396.11529.27.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1396042396.11529.27.camel@pasglop>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Christoffer Dall <christoffer.dall@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Olof Johansson <olof@lixom.net>, Rob Herring <rob.herring@linaro.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 28, 2014 at 4:33 PM, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> On Fri, 2014-03-28 at 09:08 -0700, Grant Likely wrote:
>> ePAPR 1.1 defines the "stdout-path" property for specifying the console
>> device, but Linux currently only handles the older "linux,stdout-path"
>> property. This patch adds parsing for the new property name.
>
> Generally a good idea I think, but of course I need time to review and
> test ... :-)
>
> One thing that's been annoying me lately with the existing code which
> you don't address is ... in a few cases my consoles are usable *VERY*
> early. For example PAPR hvc and OPAL hvc can be used before we even turn
> the MMU on on powerpc (and thus before we unflatten the device-tree).
>
> It would be nice to be able to have the console going that early,
> unfortunately that would imply using the flat device-tree for the
> parsing / matching of the stdout-path in those drivers.

I'm working on getting just that working. See my series for "generic
earlycon". I'm working on cleaning up the FDT part still, but have
something functional. The "hardest" part with FDT is doing the address
translation for serial devices, but I just stole that from u-boot.

> Right now, I have this explicit config option to hard wire "early debug"
> but there are a few cases of field bugs that can happen in early init
> code which I'd like to see logged properly on those systems, and early
> debug isn't suitable for field use...

We have the same issue with multi-platform ARM kernels.

Rob
