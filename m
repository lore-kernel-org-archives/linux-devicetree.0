From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v2 4/7] tegra: fdt: Add NAND controller binding
	and definitions
Date: Fri, 13 Apr 2012 15:22:53 -0600
Message-ID: <4F88992D.102@wwwdotorg.org>
References: <1334341777-2681-1-git-send-email-sjg@chromium.org>
	<1334341777-2681-5-git-send-email-sjg@chromium.org>
	<4F8873D1.2010701@freescale.com> <4F88937D.3090809@wwwdotorg.org>
	<4F8898E4.4000505@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <4F8898E4.4000505@freescale.com>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Scott Wood <scottwood@freescale.com>
Cc: Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, U-Boot Mailing List <u-boot@lists.denx.de>, Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <twarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

On 04/13/2012 03:21 PM, Scott Wood wrote:
> On 04/13/2012 03:58 PM, Stephen Warren wrote:
>> On 04/13/2012 12:43 PM, Scott Wood wrote:
>>> On 04/13/2012 01:29 PM, Simon Glass wrote:
>>>> Add a NAND controller along with a bindings file for review.
>>>>
>>>> Signed-off-by: Simon Glass<sjg@chromium.org>
>>
>>>> +++ b/doc/device-tree-bindings/nand/nvidia-nand.txt
>>
>>>> +wp-gpio : GPIO of write-protect line, three cells in the format:
>>>> +        phandle, parameter, flags
>>>
>>> nvidia,nand-wp-gpio
>>
>> I'm not convinced about this. For example many SDHCI bindings use just
>> "wp-gpios" not "shdci-wp-gpios". Is there really a need to keep the
>> property names unique across all bindings, even though a given node only
>> relies on one binding?
>>
> 
> Yeah, there's a lot of bad practice in the existing trees.  But the
> general recommendation for a while now has been to namespace properties
> that aren't defined in standardized, device-indpendent way.  That way we
> don't get conflicts if we want to use that name for a standard property
> in the future, and there's less confusion if multiple people use the
> same name in different devices with different semantics.

I thought that's what the "nvidia," vendor prefix was for. Presumably
standardized properties wouldn't have that?
