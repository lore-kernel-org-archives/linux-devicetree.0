From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 0/8] mailbox: arm/arm64: introduce smc
 triggered mailbox
Date: Fri, 30 Jun 2017 13:56:04 +0100
Message-ID: <7a58855c-7481-320e-19f0-83bd113ef2c0@arm.com>
References: <20170630095608.24943-1-andre.przywara@arm.com>
 <20170630122529.upjigip4hztrq67h@flea>
Reply-To: andre.przywara-5wv7dgnIgG8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDNZNK75ZIKRBZMU3HFAKGQEH4PRKNI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170630122529.upjigip4hztrq67h@flea>
Content-Language: en-GB
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

thanks for having a look!

On 30/06/17 13:25, Maxime Ripard wrote:
> Hi,
> 
> On Fri, Jun 30, 2017 at 10:56:00AM +0100, Andre Przywara wrote:
>> The remaining patches demonstrate usage of this feature to drive SCPI services
>> implemented as part of the ARM Trusted Firmware implementation used for
>> AArch64 based Allwinner SoCs, the Allwinner A64 in this example.
>> It allows to provide DVFS services, sensors support, device power domains
>> and potentially other services like clocks or regulators.
>> This allows to abstract those features in firmware, without the need to
>> implement explicit Linux support for each variant of some SoC design.
>> Those DT changes are not necessarily meant to be merged at this point.
>> I started implementing the firmware side of those services and put a WIP
>> branch on my ATF Github repo [1]. With this branch and these patches here
>> you get DVFS and temperature sensor support for the A64, just with this
>> driver and the generic SCPI support.
> 
> I would go even further, and say that these changes should be done by
> the bootloader itself once it installed the proper monitor.
> 
> These patches represent not a state of the hardware itself, but the
> state the bootloader let the hardware in, and that state will change
> from one bootloader to the other, and one version to the other
> (obviously). This is already what we do for the other things the
> bootloader initializes (like simplefb, or PSCI). It just feels natural
> to do the same thing here.

Yes, indeed that was my thinking as well. I just put those DT changes in
here to demonstrate how it would look like.

Technically ATF (as the provider for the SCPI services) should do the DT
change. That would also assure that those changes are always in sync
with what's implemented. Mainline ATF seems to include libfdt now, but I
haven't checked in detail how much this covers and how easy it is to
use. Also that would mean that the base DT has to be somewhere
accessible by the ATF. So while this is eventually feasible to do (since
the dtb is loaded by U-Boot's SPL, for instance), it's just not trivial
or already implemented, that's why I would revert to provide some static
DT and match that up in some firmware image for the time being.

So indeed this makes those DT change not subject to Linux' concerns -
and might trigger more discussions on the future of DTs in the kernel ;-)

Cheers,
Andre.
