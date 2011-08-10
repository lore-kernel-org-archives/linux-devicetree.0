From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 3/3] ARM: gic: add OF based initialization
Date: Wed, 10 Aug 2011 13:30:00 -0500
Message-ID: <4E42CE28.3050501@gmail.com>
References: <1312921020-6820-1-git-send-email-robherring2@gmail.com>
	<1312921020-6820-4-git-send-email-robherring2@gmail.com>
	<4E423C98.3040305@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4E423C98.3040305-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 08/10/2011 03:08 AM, Marc Zyngier wrote:
> On 09/08/11 21:17, Rob Herring wrote:
>> From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>>
>> This adds gic initialization using device tree data. An example device tree
>> binding looks like this:
>>
>> intc: interrupt-controller@fff11000 {
>>         compatible = "arm,cortex-a9-gic";
>>         #interrupt-cells = <1>;
>>         interrupt-controller;
>>         reg = <0xfff11000 0x1000>,
>>               <0xfff10100 0x100>;
>> };
> 
> I'm afraid I still object to this. PPIs are an important part of the
> GIC, and this binding totally ignores the per-cpu aspect.

BTW, we've already got 2 flavors of gic bindings in the dts files.

> How do you represent the connection between a CPU local timer and the
> GIC? Even worse, how to represent a device connected to only *one* of
> the CPUs? PPIs are difficult to represent on the Linux side. But we
> shouldn't ignore them in the DT binding.
> 

Do you have an updated gic binding patchset based on your latest PPI
patch series?

This problem also extends to the TWD itself. How do we represent that?
Is it 1 node per core or 1 node total. Then is timer and watchdog in 1
node, or is it split to separate nodes?

Rob
