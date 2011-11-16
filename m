From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/5] ARM: vexpress: Add DT support in v2m
Date: Wed, 16 Nov 2011 10:26:46 -0600
Message-ID: <4EC3E446.4030608@gmail.com>
References: <1321036026-23411-1-git-send-email-pawel.moll@arm.com>
 <1321036026-23411-4-git-send-email-pawel.moll@arm.com>
 <20111116154402.GE2073@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20111116154402.GE2073-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/16/2011 09:44 AM, Dave Martin wrote:
> On Fri, Nov 11, 2011 at 06:27:04PM +0000, Pawel Moll wrote:
>> This patch provides hooks for DT-based tile machine implementations
>> and adds Device Tree description for the motherboard.
>>
>> Signed-off-by: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/arm/vexpress    |   92 ++++++++++
>>  arch/arm/boot/dts/vexpress-v2m-legacy.dtsi        |  190 +++++++++++++++++++++
>>  arch/arm/mach-vexpress/Kconfig                    |    4 +
>>  arch/arm/mach-vexpress/core.h                     |    9 +
>>  arch/arm/mach-vexpress/include/mach/motherboard.h |    8 +
>>  arch/arm/mach-vexpress/v2m.c                      |  140 +++++++++++++++-
>>  6 files changed, 442 insertions(+), 1 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/arm/vexpress
>>  create mode 100644 arch/arm/boot/dts/vexpress-v2m-legacy.dtsi
>>
>> diff --git a/Documentation/devicetree/bindings/arm/vexpress b/Documentation/devicetree/bindings/arm/vexpress
> 
> [...]
> 
>> +Required properties in the root node:
>> +- compatible value:
>> +  - for motherboard in "legacy" mode:
>> +	compatible = "arm,vexpress-<model>", "arm,vexpress-legacy", "arm-vexpress";
>> +  - for motherboard in "RS1" mode:
>> +	compatible = "arm,vexpress-<model>", "arm-vexpress";
> 
> So, we have:
> 
> arm,vexpress-* implies arm,vexpress
> arm,vexpress-* may imply arm,vexpress-legacy
> arm,vexpress-legacy implies arm,vexpress
> 
> This means we have no bounded test for RS1-only features:
> the needed test is
> "compatible(node, "arm,vexpress") && !compatible(node, "arm,vexpress-legacy")
> 
> Unfortunately, if there is someday an "rs2" memory map, that will also match
> the above.  Using "inverse compatibility" in this way feels dangerous,
> because the condition will pass for an arbitrary set of future conditions
> that we haven't imagined yet.
> 
> This means it's, impossible even in principle to panic the kernel cleanly if
> presented with a device tree for a platform variant which is too new for the
> kernel to support.
> 
> 
> Can we instead have a specific "arm,vexpress-rs1"?
> 
> 	compatible = "arm,vexpress-<model>", "arm-vexpress-rs1", "arm-vexpress";
> 
> Then, we can be exact about compatibility: universal features are compatible
> with "arm,vexpress"; memory-map-specific features are compatible with either
> "arm,vexpress-legacy" or "arm,vexpress-rs1".
> 

Really, legacy is a bad name. If you defined the property when the
original vexpress was designed, it never would have had legacy in the
name. Generally speaking you never change bindings on old platforms.

So I would have "arm,vexpress" mean legacy and "arm,vexpress-rs1" be the
new memory map.

Rob
