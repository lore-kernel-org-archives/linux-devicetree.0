From: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 0/6] arm: sunxi: IR support for A83T
Date: Tue, 9 Jan 2018 09:02:43 +0100
Message-ID: <bdaaea4c-4145-3b93-2f97-00c5c6449ddd@gmail.com>
References: <20171219080747.4507-1-embed3d@gmail.com>
 <20180105120253.zvwaz25scuk76bnt@gofer.mess.org>
 <20180105145913.ddb5l5dyt7yn3kwc@flea.lan>
Reply-To: embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Return-path: <linux-sunxi+bncBD257DPK24NRBJ7O2HJAKGQECOOBLCA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180105145913.ddb5l5dyt7yn3kwc-ZC1Zs529Oq4@public.gmane.org>
Content-Language: en-US
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sean Young <sean-hENCXIMQXOg@public.gmane.org>
Cc: mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 05.01.2018 15:59, Maxime Ripard wrote:
> Hi,
> 
> On Fri, Jan 05, 2018 at 12:02:53PM +0000, Sean Young wrote:
>> On Tue, Dec 19, 2017 at 09:07:41AM +0100, Philipp Rossak wrote:
>>> This patch series adds support for the sunxi A83T ir module and enhances
>>> the sunxi-ir driver. Right now the base clock frequency for the ir driver
>>> is a hard coded define and is set to 8 MHz.
>>> This works for the most common ir receivers. On the Sinovoip Bananapi M3
>>> the ir receiver needs, a 3 MHz base clock frequency to work without
>>> problems with this driver.
>>>
>>> This patch series adds support for an optinal property that makes it able
>>> to override the default base clock frequency and enables the ir interface
>>> on the a83t and the Bananapi M3.
>>>
>>> changes since v2:
>>> * reorder cir pin (alphabetical)
>>> * fix typo in documentation
>>>
>>> changes since v1:
>>> * fix typos, reword Documentation
>>> * initialize 'b_clk_freq' to 'SUNXI_IR_BASE_CLK' & remove if statement
>>> * change dev_info() to dev_dbg()
>>> * change naming to cir* in dts/dtsi
>>> * Added acked Ackedi-by to related patch
>>> * use whole memory block instead of registers needed + fix for h3/h5
>>>
>>> changes since rfc:
>>> * The property is now optinal. If the property is not available in
>>>    the dtb the driver uses the default base clock frequency.
>>> * the driver prints out the the selected base clock frequency.
>>> * changed devicetree property from base-clk-frequency to clock-frequency
>>>
>>> Regards,
>>> Philipp
>>>
>>>
>>> Philipp Rossak (6):
>>>    media: rc: update sunxi-ir driver to get base clock frequency from
>>>      devicetree
>>>    media: dt: bindings: Update binding documentation for sunxi IR
>>>      controller
>>>    arm: dts: sun8i: a83t: Add the cir pin for the A83T
>>>    arm: dts: sun8i: a83t: Add support for the cir interface
>>>    arm: dts: sun8i: a83t: bananapi-m3: Enable IR controller
>>>    arm: dts: sun8i: h3-h8: ir register size should be the whole memory
>>>      block
>>
>> I can take this series (through rc-core, i.e. linux-media), but I need an
>> maintainer Acked-by: for the sun[x8]i dts changes (all four patches).
> 
> We'll merge them through our tree. We usually have a rather big number
> of patches around, so we'd be better off avoiding conflicts :)
> 
> Philipp, can you resubmit the DTs as soon as -rc1 is out?
> 
> Thanks!
> Maxime
> 
Yes, I can do this!

Regards,
Philipp
