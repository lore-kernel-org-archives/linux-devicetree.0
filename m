From: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RESEND PATCH v5 0/6] IR support for A83T
Date: Sun, 15 Jul 2018 16:08:04 +0200
Message-ID: <aa2d50b1-9ff5-01e7-8202-e35dc6e039ea@gmail.com>
References: <20180213122952.8420-1-embed3d@gmail.com>
 <85ddc129-d0f8-6299-dca0-81f79f3d04a9@gmail.com>
 <20180710083637.6s36rfbi2old5uxo@gofer.mess.org>
Reply-To: embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Return-path: <linux-sunxi+bncBD257DPK24NRBT5KVXNAKGQEOLP3BWA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180710083637.6s36rfbi2old5uxo-3XSxi2G4b3iXFJAUJl40Xg@public.gmane.org>
Content-Language: en-US
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Sean Young <sean-hENCXIMQXOg@public.gmane.org>
Cc: mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Sorry, that got lost...

I will resubmit / update the patches next week.

Philipp

On 10.07.2018 10:36, Sean Young wrote:
> On Fri, Mar 02, 2018 at 01:11:34PM +0100, Philipp Rossak wrote:
>>
>>
>> On 13.02.2018 13:29, Philipp Rossak wrote:
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
>>> changes since v4:
>>> * rename cir pin from cir_pins to r_cir_pin
>>> * drop unit-adress from r_cir_pin
>>> * add a83t compatible to the cir node
>>> * move muxing options to dtsi
>>> * rename cir label and reorder it in the bananpim3.dts file
>>>
>>> changes since v3:
>>> * collecting all acks & reviewd by
>>> * fixed typos
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
>>>     the dtb the driver uses the default base clock frequency.
>>> * the driver prints out the the selected base clock frequency.
>>> * changed devicetree property from base-clk-frequency to clock-frequency
>>>
>>> Regards,
>>> Philipp
>>>
>>> Philipp Rossak (6):
>>>     media: rc: update sunxi-ir driver to get base clock frequency from
>>>       devicetree
>>>     media: dt: bindings: Update binding documentation for sunxi IR
>>>       controller
>>>     arm: dts: sun8i: a83t: Add the cir pin for the A83T
>>>     arm: dts: sun8i: a83t: Add support for the cir interface
>>>     arm: dts: sun8i: a83t: bananapi-m3: Enable IR controller
>>>     arm: dts: sun8i: h3-h5: ir register size should be the whole memory
>>>       block
>>>
>>>    Documentation/devicetree/bindings/media/sunxi-ir.txt |  3 +++
>>>    arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts         |  5 +++++
>>>    arch/arm/boot/dts/sun8i-a83t.dtsi                    | 18 ++++++++++++++++++
>>>    arch/arm/boot/dts/sunxi-h3-h5.dtsi                   |  2 +-
>>>    drivers/media/rc/sunxi-cir.c                         | 19 +++++++++++--------
>>>    5 files changed, 38 insertions(+), 9 deletions(-)
>>>
>>
>> I talked yesterday with Maxime about this patch series. And he told me if
>> the first to patches got merged, he will apply the dts patches to the sunxi
>> tree.
>>
>> Sean, can you merge the first two patches through the rc-core?
> 
> So I merged the first two patches, but the rest never made it upstream.
> 
> Should they be resubmitted?
> 
> Thanks,
> 
> Sean
> 
