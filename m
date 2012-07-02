From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] of: support an enumerated-bus compatible value
Date: Mon, 02 Jul 2012 09:59:35 -0600
Message-ID: <4FF1C567.4060809@wwwdotorg.org>
References: <1340924755-31447-1-git-send-email-swarren@wwwdotorg.org>
 <4FF0A6B6.8040902@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4FF0A6B6.8040902-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/01/2012 01:36 PM, Rob Herring wrote:
> On 06/28/2012 06:05 PM, Stephen Warren wrote:
>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> An "enumerated" bus is one that is not memory-mapped, hence hence
>> typically has #address-cells=1, and #size-cells=0. Such buses would be
>> used to group related non-memory-mapped nodes together, often just under
>> the top-level of the device tree. The ability to group nodes into a non-
>> memory-mapped subnode of the root is important, since if nodes exist to
>> describe multiple entities of the same type, the nodes will have the
>> same name, and hence require a unit address to differentiate them. It
>> doesn't make sense to assign bogus unit addresses from the CPU's own
>> address space for this purpose. An example:
>>
>> 	regulators {
>> 		compatible = "enumerated-bus";
>> 		#address-cells = <1>;
>> 		#size-cells = <0>;
>>
>> 		regulator@0 {
>> 			compatible = "regulator-fixed";
>> 			reg = <0>;
>> 		};
>>
>> 		regulator@1 {
>> 			compatible = "regulator-fixed";
>> 			reg = <1>;
>> 		};
>> 	};
>>
>> Finally, because such buses are not memory-mapped, we avoid creating
>> any IO/memory resources for the device.
> 
> This seems like a work-around to use reg instead of using cell-index
> (which is discouraged). reg in this case is really not a hardware
> description. Do you have an intended use or just trying to fix the error
> messages?

I'm not familiar with cell-index; can you please describe it some more.
Looking at some existing files in arch/powerpc/boot/dts, it looks like
something that exists alongside reg rather than replacing it, so I don't
see how it'd solve the problem.

The portion of .dts file quoted above is the use-case. In more general
terms, I need to add a bunch of non-memory-mapped devices to DT. There
are multiple devices of a given type. The DT node names should be named
after the class of device not the instance, and hence all get named the
same. Hence, I need a unit address to differentiate the node names.
Hence I need to use the reg property in order that the unit address
matches the reg property. Is there some other way of solving these
requirements other than using a unit address to make the node names unique?

On 07/01/2012 04:03 PM, Grant Likely wrote:
...
> Besides; if they are enumerated, non-memory mapped devices, then is it
> really appropriate to use platform_{device,driver}? I don't think it
> is.

Hmm, well /everything/ that gets instantiated from DT is a platform
device at present, at least for the platforms and bus types we're using
on Tegra and I believe all/most ARM platforms, except some small amounts
of AMBA. Changing that would hugely impact a ton of working code and
just be churn in my opinion. Do we really want to invent another device
type internal to Linux for this? Besides, doing that would be orthogonal
to this patch; such a change would have no impact on the DT
representation of the devices.
