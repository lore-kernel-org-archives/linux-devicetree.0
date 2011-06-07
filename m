From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: l2x0: Add OF based initialization
Date: Tue, 07 Jun 2011 11:54:47 -0500
Message-ID: <4DEE57D7.1030704@gmail.com>
References: <1307456541-11026-1-git-send-email-robherring2@gmail.com>	<1307456541-11026-4-git-send-email-robherring2@gmail.com>
	<BANLkTi=7rHjKV=+hNKzEHvZMeDPwknOWtg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <BANLkTi=7rHjKV=+hNKzEHvZMeDPwknOWtg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Olof,

On 06/07/2011 11:20 AM, Olof Johansson wrote:
> On Tue, Jun 7, 2011 at 7:22 AM, Rob Herring<robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  wrote:
>
>> +- aux-value : Value to set the Auxillary Control register to. Setting masked
>> +  bits is undefined. Default value is 0.
>> +- aux-mask : Mask of bits to preserve in the Auxillary Control register.
>> +  Default value is 0xffffffff.
>
> The device tree should describe the hardware, not the way the linux
> kernel drives the hardware. In the case of the AUX register, it's
> mostly a collection of options that are either turned on or off. I
> don't think they should necessarily be described as an opaque 32-bit
> word, but instead as separate attributes.

Unfortunately, the meaning of the bits depends on the model and there 
doesn't seem to be any commonality or subset of options as to what each 
platform is setting up.

>
> At least the geometry should be specified that way.

That's probably the only part that doesn't get changed. :)

>
> For feature enable bits, it depends on what features should be enabled
> and from the kernel side. I'm not sure that belongs in the device tree
> at all.

I don't think it can be decided what the kernel needs to setup by the 
device tree. The main reason it's needed in the kernel at all is 
probably because the bootloader didn't setup aux_ctrl or set it up 
incorrectly.

Perhaps the magic values should just be left in the platforms and 
continue to be passed into the OF init function:

l2x0_of_init(__u32 aux_val, __u32 aux_mask);

Rob
