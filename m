From: Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Representation of external memory-mapped devices in DT (gpmc)
Date: Thu, 01 Nov 2012 01:08:28 +0100
Message-ID: <5091BD7C.7040105@gmail.com>
References: <508E9513.7050106@gmail.com> <508E9C42.10907@gmail.com>
 <508EBB47.8070405@gmail.com> <508FB10D.9030906@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <508FB10D.9030906-l0cyMroinI0@public.gmane.org>
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
To: Afzal Mohammed <x0148406-l0cyMroinI0@public.gmane.org>
Cc: Afzal Mohammed <afzal-l0cyMroinI0@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, "Nori,
 Sekhar" <nsekhar-l0cyMroinI0@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 30.10.2012 11:50, Afzal Mohammed wrote:
> Hi Daniel,
> 
> On Monday 29 October 2012 10:52 PM, Daniel Mack wrote:
>> On 29.10.2012 16:09, Rob Herring wrote:
> 
>>> You may want a CS0 node with nand as a child node of that.
> 
>> Hmm, I don't see what that would buy us. The question is which way is
>> feasible for storing both the memory region and the cs number in the
>> device tree. The CS number should certainly go to the child node, no?
>>
>> IOW, would it be a good idea to have something like the following layout?
>>
>> 	gpmc: gpmc@50000000 {
>> 		compatible = "ti,gpmc";
>> 		ti,hwmods = "gpmc";
>> 		reg =<0x50000000 0x2000>;
>>
>> 		/* cs-reg stores the setup of the controller's
>> 		   memory map */
>>
>> 			/* offset	size */
>> 		cs-reg =<0x0		0x1000000
>> 			  ....		.....
>> 			  ....		.....>;
>>
>> 		nand: child@0 {
>> 			/* timings */
>> 			/* peripheral specifics */
>> 		};
>> 	};
>>
>> I would actually much prefer that approach.
>>
>> Afzal, because because that way, we can leave the code as-is for now and
>> add the "cs-reg" property once the code is switched to dynamic handling.
>> What do you think?
> 
> I don't know what to say, don't have a good grasp on DT to give
> right suggestion.
> 
> It seems offset field may not be necessary. memory for connected
> peripherals is not fixed, only CS is fixed (as CS pin is hard-wired).
> Physical memory can be anywhere between 0-512MB (with
> alignment constraints depending on size, refer GPMC_CONFIG7
> register), even though right now memory region for peripheral
> seems to be fixed (for boards supported in mainline it will be
> what bootloader configures), it is possible to have it in a different
> region for those peripherals.

The question is whether this is transparent to the client driver at the
end. If the driver needs to know about the address of the external
memory (that's the case for the smsx911x for example), that value should
be in the device tree.

Actually, there's an example here that matches our case quite well:

http://devicetree.org/Device_Tree_Usage#Ranges_.28Address_Translation.29

I think the important part is to get the bindings straight so we don't
have to change them anymore later on; we don't really need to parse the
values from the generic driver and set up the mappings accrodingly -
that can be added easily later on. For a first shot, we can just write
default values to the DT that are computed anyway, right?



Daniel
