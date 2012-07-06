From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Re: OF_DYNAMIC usage
Date: Fri, 06 Jul 2012 08:51:10 +0200
Message-ID: <4FF68ADE.3060609@monstr.eu>
References: <4FF586D1.2050407@monstr.eu> <4FF594AD.6000401@gmail.com>
 <1341521210.6330.16.camel@pasglop> <4FF67F96.1040902@monstr.eu>
 <1341555562.6330.51.camel@pasglop>
Reply-To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1341555562.6330.51.camel@pasglop>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/06/2012 08:19 AM, Benjamin Herrenschmidt wrote:
> On Fri, 2012-07-06 at 08:03 +0200, Michal Simek wrote:
>>>
>>> The way it works at the moment is that when something new is plugged in,
>>> the hypervisor talks to a proprietary crap daemon in userspace which
>>> talks to a special tool (that one we have the source code) which then
>>> obtains via some FW interfaces a "blob" of bits of device-tree to add
>>> (or to remove), using a phyp specific format, and echo that stuff
>>> into /proc/ppc64/ofdt.
>>
>> Where is that source code for the special tool?
>
> I can dig that for you, however ...
>
>> Can you point me to the "phyp specific format"?
>
> Same deal, I don't think there's a public doc, however..

Why is it in the kernel something which does not have any public documentation?
It seems like that it is more proprietary code.


>
>>    From reconfig.c it looks like that there are some key words like
>> add_node/remove_node/add_property... follow by space and node name +
>> options which lookes like dtb format.
>
> Right, I would just recommend you don't do that.
>
> The need to "hotplug" bits of device-tree is going to be generic enough
> that we should come up with something better and more generic than that
> pseries stuff.
>
> IE. Some way to pass bits of ftb blob rather than this specific format
> to begin with, etc...

Can we discuss this a little bit more?

 From my partial reconfiguration understanding is that you have partial bitstream
which you pass through pcap(IP and driver which can do it) to specific location
which they are known.

It means you have to unplug device which is in the same location,
load partial bitstream via pcap
register driver and probe it.

I expect that pcap driver could be aware which driver is at that location
and is able to plug and unplug it based on description.

I will ask Xilinx how this is exactly done and I hope I will get any example
to be able to do some experiments.

>
> So I'd say just ignore the pseries stuff, I can dig the tool etc... if
> you -really- need them but I'd rather you don't base your stuff on it,
> just make up something better&  more generic for you. It will be useful
> to others.

My point here is just to try to understand current working version
to get the better overview how it is done and probably working somehow.

Of course some ideas how this can/should be done will be helpful.

Thanks,
Michal


-- 
Michal Simek, Ing. (M.Eng)
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel 2.6 Microblaze Linux - http://www.monstr.eu/fdt/
Microblaze U-BOOT custodian
