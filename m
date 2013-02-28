From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/4] documentation: add palmas dts definition
Date: Thu, 28 Feb 2013 11:51:22 -0700
Message-ID: <512FA72A.4060303@wwwdotorg.org>
References: <1361164283-3133-1-git-send-email-j-keerthy@ti.com>
 <512E5144.9020105@wwwdotorg.org> <512F1ADF.90906@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <512F1ADF.90906-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, J Keerthy <j-keerthy-l0cyMroinI0@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org" <gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 02/28/2013 01:52 AM, Laxman Dewangan wrote:
> On Thursday 28 February 2013 12:02 AM, Stephen Warren wrote:
>> On 02/17/2013 10:11 PM, J Keerthy wrote:
>> +- interrupt-parent : The parent interrupt controller.
>> +
>> +Optional node:
>> +- Child nodes contain in the palmas. The palmas family is made of
>> several
>> +  variants that support a different number of features.
>> +  The child nodes will thus depend of the capability of the variant.
>> Are there DT bindings for those child nodes anywhere?
>>
>> Representing each internal component as a separate DT node feels a
>> little like designing the DT bindings to model the Linux-internal MFD
>> structure. DT bindings should be driven by the HW design and OS-agnostic.
>>
>>  From a DT perspective, is there any need at all to create a separate DT
>> node for each component? This would only be needed or useful if the
>> child IP blocks (and hence DT bindings for those blocks) could be
>> re-used in other top-level devices that aren't represented by this
>> top-level ti,palmas DT binding. Are the HW IP blocks here re-used
>> anywhere, or will they be?
> 
> 
> I dont think that child IP block can be used outside of the palma
> although other mfd device may have same IP.

That sounds like pretty much the definition of re-using the IP block...

> The child driver very much used the palma's API for register access and
> they can not be separated untill driver is write completely independent
> of palmas API. Currently, child driver include the palma header, uses
> palma mfd stcruture and plama's api for accessing registers.

The DT binding and compatible values should not be influenced by
OS-specific driver implementation details. DT bindings are supposed to
be (as near as possible) a pure HW description, which (many different)
OSs parse, and map to their internal driver structure as appropriate.

The above is of course just a comment on how DT is supposed to work; I'm
not saying anything here re: what's the most appropriate DT structure
for this device.

>>> +    palmas_pmic {
>> Just "pmic" seems simpler, although I dare say the node name isn't
>> really used for anything.
> 
> Stephen,
> Just curios, why do we require the palma_pmic node at all, We can start
> with regulator node directly. Is it not too much nested here?

That was the question I was asking in my original email. But I also
commented on the patch as written, in case the answer to my question was
that the child DT nodes made sense.
