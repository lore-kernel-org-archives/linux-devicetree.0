From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: [U-Boot] Merging device trees at runtime for module-based systems
Date: Wed, 31 Oct 2012 19:02:54 -1000
Message-ID: <5092027E.1060806@firmworks.com>
References: <5087B919.2010006@gmail.com> <508AD8F9.8030105@wwwdotorg.org>
 <5091AD78.3060701@gmail.com> <5091BAAA.5010809@firmworks.com>
 <5091FC38.2020806@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <5091FC38.2020806-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/31/2012 6:36 PM, Stephen Warren wrote:
> On 10/31/2012 05:56 PM, Mitch Bradley wrote:
>> On 10/31/2012 1:00 PM, Daniel Mack wrote:
>>> cc devicetree-discuss. Here's a reference to the full thread:
>>>
>>>   http://thread.gmane.org/gmane.comp.boot-loaders.u-boot/145221/
>>>
>>> On 26.10.2012 20:39, Stephen Warren wrote:
>>>> On 10/24/2012 03:47 AM, Daniel Mack wrote:
>>>>> Hi,
>>>>>
>>>>> a project I'm involved in uses a module/baseboard combo, and components
>>>>> on either board are described in DT. I'm currently using separate dts
>>>>> files which build upon each other with include statements, which works
>>>>> fine for development.
>>>>>
>>>>> In production though, we will certainly have running changes (and hence
>>>>> different versions) over the lifetime of the product for both the
>>>>> baseboard and the module, and the hardware has support for identifying
>>>>> the versions of both sides at runtime.
> ...
>>> I start to believe that the cleanest solution to this would be to
>>> have full DTC functionality in U-Boot and compile the tree
>>
>> ... which is exactly the way that Open Firmware does it, since the
>> invention of the device tree.  The model is that the boot firmware,
>> which needs to know the system configuration to do its job anyway,
>> exports that configuration via the device tree.
> 
> Doesn't OF generate the DT from internal data structures (although I
> don't know where those come from...), whereas what Daniel mentions above
> is more like the bootloader having access to a bunch of .dts fragments,
> selecting the appropriate subset of those to use, parsing them into an
> internal data structure (i.e. running dtc), and then generating a DTB
> from it. The overall result is that the bootloader causes a DTB to be
> generated at run-time, so at that level it's the same, but the
> implementation seems pretty different.

Yes, which is why I cut the cited sentence at the place I did (before
the part about dts fragments).

> 
