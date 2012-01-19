From: David Vrabel <david.vrabel-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v6 9/9] ARM: vexpress: Add Device Tree for V2P-CA15 core
 tile (TC1 variant)
Date: Thu, 19 Jan 2012 17:00:56 +0000
Message-ID: <4F184C48.2050505@citrix.com>
References: <1323957761-13553-1-git-send-email-pawel.moll@arm.com>	
 <1323957761-13553-10-git-send-email-pawel.moll@arm.com>	
 <4F0C495C.4000103@citrix.com>	
 <1326979652.32197.66.camel@hornet.cambridge.arm.com>	
 <4F181BD9.20401@gmail.com>	
 <1326980594.32197.67.camel@hornet.cambridge.arm.com>	
 <4F182248.7070209@gmail.com>
 <1326984672.32197.68.camel@hornet.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1326984672.32197.68.camel-okZbbLrgpR/YkXV2EHHjLW3o5bpOHsLO@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 19/01/12 14:51, Pawel Moll wrote:
> On Thu, 2012-01-19 at 14:01 +0000, Rob Herring wrote:
>> On 01/19/2012 07:43 AM, Pawel Moll wrote:
>>> On Thu, 2012-01-19 at 13:34 +0000, Rob Herring wrote:
>>>>> You're right - the skeleton.dtsi contains "memory" mode... Funnily
>>>>> enough originally I was using that name, but then Rob Herring suggested
>>>>> changing it to @80000000, which seemed reasonable.
>>>>>
>>>>> Now I wonder - is the "memory" node special and should not contain
>>>>> "@address", or the skelton shouldn't contain the empty "memory" node...
>>>>>
>>>>
>>>> Hummm... I guess you should just use "memory" if you are using
>>>> skeleton.dtsi.
>>>
>>> Well, I don't mind _not_ using skeleton, but I had an impression the
>>> general policy was to use it?
>>
>> Either way is fine. I don't really think it buys you much.
> 
> Ok, /include/ "skeleton.dtsi" is gone then :-)

The problem wasn't with including skeleton.dtsi.  With
CONFIG_ARM_ATAG_DTB_COMPAT the zImage decompressor modifies the appended
DTB using information from the ATAGs (see atags_to_fdt()).

If there's an ATAG giving the amount of RAM the DTB's "memory" node is
replaced with a new one.  Since the vexpress DTBs don't have a "memory"
node it's added and the DTB ends up with two nodes describing memory.

I don't expect any real production vexpress system to use this config
options -- we're using it now when running as a guest under Xen because
Xen doesn't (yet) support device tree and we're using ATAGs to tell the
guest how much RAM it's been allocated.

David
