From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Re: OF_DYNAMIC usage
Date: Fri, 06 Jul 2012 08:03:02 +0200
Message-ID: <4FF67F96.1040902@monstr.eu>
References: <4FF586D1.2050407@monstr.eu> <4FF594AD.6000401@gmail.com>
 <1341521210.6330.16.camel@pasglop>
Reply-To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1341521210.6330.16.camel@pasglop>
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

On 07/05/2012 10:46 PM, Benjamin Herrenschmidt wrote:
> On Thu, 2012-07-05 at 08:20 -0500, Rob Herring wrote:
>> On 07/05/2012 07:21 AM, Michal Simek wrote:
>>> Hi,
>>>
>>> can someone tell me usage of OF_DYNAMIC?
>>> How this can be used by user?
>>>
>>> Is it possible to exchange device node?
>>> Add new one, delete one, etc?
>>>
>>> Any user guide/log will be helpful to see what I can do with it.
>>
>> 2nd question on OF_DYNAMIC in a week... I haven't really looked at it. I
>> would suggest looking at the existing users (only powerpc iseries and
>> pseries). My concern using would be that the reference counting is not
>> correct for many drivers as of_node_get/put is a nop without OF_DYNAMIC.
>>
>> You can also activate/deactivate nodes with the status property.
>>
>
> No doc that I know of. It's used by pseries only (iseries is gone btw)
> for "DLPAR" (aka Dynamic Reconfiguration aka hotplug).

ok. This is for Xilinx partial reconfiguration.

>
> The way it works at the moment is that when something new is plugged in,
> the hypervisor talks to a proprietary crap daemon in userspace which
> talks to a special tool (that one we have the source code) which then
> obtains via some FW interfaces a "blob" of bits of device-tree to add
> (or to remove), using a phyp specific format, and echo that stuff
> into /proc/ppc64/ofdt.

Where is that source code for the special tool?

Can you point me to the "phyp specific format"?

 From reconfig.c it looks like that there are some key words like
add_node/remove_node/add_property... follow by space and node name +
options which lookes like dtb format.

>
> It's pretty fugly...

Yes, I see.

>
> Because nodes can come and go, we thus add refcounting. There's various
> places where the refcounting is not quite right but mostly things that
> don't get plugged/unplugged, actual vio devices or PCI devices tend to
> get it right.

Some driver validation has to be made to get it work. I have done some correction
for xilinx drivers in past.

>
> Also we don't have good rules for properties lifetime, as it is, it's
> assumed to be the same as the node and there's no proper way to
> add/remove/modify a property "live". I would recommend at least
> something RCUish if you're going to try to be safe to delay the freeing
> of the old value in the dynamic case.
>
> There's definitely room for improvements in that area...

:-)

Thanks,
Michal


-- 
Michal Simek, Ing. (M.Eng)
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel 2.6 Microblaze Linux - http://www.monstr.eu/fdt/
Microblaze U-BOOT custodian
