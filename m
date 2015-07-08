From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v6] usb: common: add API to set usb otg capabilities by
 device tree
Date: Wed, 08 Jul 2015 14:05:39 -0600
Message-ID: <559D8293.7020904@wwwdotorg.org>
References: <1434590302-18066-1-git-send-email-jun.li@freescale.com>	<20150618103650.7c3d1b8ceb134388b0d8b093@ti.com>	<20150618084747.GD15280@shlinux2>	<20150618150748.db2217278ae71f01df625ff2@ti.com>	<20150618133703.GF15280@shlinux2>	<20150622124122.a3155a04430083b24d775aa4@ti.com>	<20150622104535.GA25349@shlinux2>	<20150622163256.418a1b05d9848a7342669fe4@ti.com>	<20150622143638.GC25349@shlinux2>	<20150623104328.5aac8e83bc23050c7541aee8@ti.com>	<20150623083548.GD25349@shlinux2> <20150623145606.f3f617586c9253036c4d6022@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150623145606.f3f617586c9253036c4d6022-l0cyMroinI0@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
Cc: Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/23/2015 05:56 AM, Roger Quadros wrote:
> + Kukjin, Stephen,
>
> for board specific USB question.
>
> On Tue, 23 Jun 2015 16:35:49 +0800
> Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
>
>> On Tue, Jun 23, 2015 at 10:43:28AM +0300, Roger Quadros wrote:
>>>>>
>>>>> If the dr_mode was "otg" for such case and we want OTG disabled then it is really the DT fault.
>>>>
>>>> It's ID pin detect for dual role switch as many current OTG controllers have.
>>>> not DT fault, its dt only has a dr_mode = "otg".
>>>>
>>>>> We don't need to tackle this case. Just fix up the DT to dr_mode = "peripheral" if
>>>>> OTG behaviour is not needed.
>>>>>
>>>> OTG behaviour is not needed, so we need disable HNP/SRP/ADP. but dr_mode =
>>>> "otg" as it already works fine with ID pin detect.
>>>
>>> Do you know which platform has plain non-otg dual-role working as of today
>>> with dr_mode set to "otg"?
>>
>> I don't know.
>> The dt property dr_mode is already there, and currently there are some platforms
>> as its user, so I assume those platforms either are non-otg dual-role, or real OTG
>> with HNP supported, I guess most are the former cases; chipidea is the later case.
>>
>>> For TI platforms none of them have it working currently.
>>>
>> So for Ti platforms, some enables non-otg dual-role function but do not use
>> dr_mode = "otg"?
>
> for TI we have only musb based and dwc3 based platforms. MUSB based are OTG.
> dwc3 doesn't support dual-role or OTG yet so we use either "peripheral" or "Host"
>
>>
>> For those only have non-otg dual-role platforms, no matter using dr_mode or not,
>> we need keep it's real OTG disabled for legacy users after it's controller
>> driver adds real OTG later.
>
> I wouldn't even bother about platforms expecting dual-role behaviour
> with dr_mode not set to "otg". That is just plain wrong and can't be supported.
>
> These are the dts files having dr_mode == "otg".
> I've sorted them as per Soc vendor and USB controller
...
> Nvidia
> ------
> arm/boot/dts/tegra20-seaboard.dts:		dr_mode = "otg";
> 	compatible = "nvidia,tegra20-ehci", "usb-ehci";
> arm/boot/dts/tegra30-colibri-eval-v3.dts:		dr_mode = "otg";
> 	compatible = "nvidia,tegra30-ehci", "usb-ehci";
>
> I couldn't find gadget side implementation for this.
> Stephen, any comments on whether this board supports true OTG operation or just dual-role operation?

Sorry for the slow reply; I was on vacation.

I'm not sure what the difference is?

I won't be able to answer for the Colibri board since I'm not familiar 
with the HW. I have the schematics for Seaboard, so I should be able to 
answer once I understand the question:-)
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
