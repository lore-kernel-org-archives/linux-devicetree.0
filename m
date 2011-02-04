From: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH TIP v2 03/14] x86/dtb: Add a device tree for CE4100
Date: Fri, 04 Feb 2011 11:06:17 +0100
Message-ID: <4D4BCF99.2000108@linutronix.de>
References: <1295843342-1122-1-git-send-email-bigeasy@linutronix.de>
	<1295843342-1122-4-git-send-email-bigeasy@linutronix.de>
	<20110127050027.GB23443@yookeroo>
	<20110202185841.GA28674@www.tglx.de>
	<20110203210746.GI6180@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110203210746.GI6180-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Grant Likely wrote:
> You can go ahead and keep the revision history above the s-o-b and ---
> lines.  It turns out that having the revision history in the commit
> text is actually useful when trying to figure out what version of a
> patch actually got applied.
Okay.

>> diff --git a/arch/x86/platform/ce4100/falconfalls.dts b/arch/x86/platform/ce4100/falconfalls.dts
>> new file mode 100644
>> index 0000000..e888657
>> --- /dev/null
>> +++ b/arch/x86/platform/ce4100/falconfalls.dts
>> @@ -0,0 +1,424 @@

>> +	soc@0 {
>> +		#address-cells = <1>;
>> +		#size-cells = <1>;
>> +		compatible = "intel,ce4100-cp";
> 
> You'll need to add blurbs to Documentation/devicetree/bindings
> (Documentation/powerpc/dts-bindings in Linus' tree; renamed in
> linux-next) for each of these new compatible bindings to document the
> part that they describe and any special properties that go with each
> compatible value (if any).  You can send it as a followup patch.

Good point, will do.

>> +				gpio@b,1 {
>> +					compatible = "pci8086,2e67.2",
>> +						   "pci8086,2e67",
>> +						   "pciclassff0000",
>> +						   "pciclassff00";
>> +
>> +					reg = <0x15900 0x0 0x0 0x0 0x0>;
>> +					interrupts = <15 1>;
>> +				};
> 
> You'll probably want to make use of the gpio-controller binding for
> the gpio nodes so that other nodes can reference it.  Not a
> showstopper for this patch though.

Right. I'll make it follow-up once I get to the gpio functionality.

> Otherwise looks good to me.
thanks.

> g.

Sebastian
