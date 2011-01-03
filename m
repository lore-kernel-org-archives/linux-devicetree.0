From: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH 03/15] x86/dtb: Add a device tree for CE4100
Date: Mon, 03 Jan 2011 12:28:24 +0100
Message-ID: <4D21B2D8.8040509@linutronix.de>
References: <1292600033-12271-1-git-send-email-bigeasy@linutronix.de>
	<1292600033-12271-4-git-send-email-bigeasy@linutronix.de>
	<20101230085122.GE11721@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20101230085122.GE11721-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
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

>> diff --git a/arch/x86/platform/ce4100/falconfalls.dts b/arch/x86/platform/ce4100/falconfalls.dts
>> new file mode 100644
>> index 0000000..24e67ca
>> --- /dev/null
>> +++ b/arch/x86/platform/ce4100/falconfalls.dts
>> +
>> +				i2c@15a00 {
>> +					#address-cells = <1>;
>> +					#size-cells = <0>;
>> +					reg = <0x15a00 0x0 0x0 0x0>;
>> +
>> +
>> +					i2c@0 {
>> +						reg = <0>;
>> +					};
>> +
>> +					i2c@1 {
>> +						#address-cells = <1>;
>> +						#size-cells = <0>;
>> +						reg = <1>;
>> +
>> +						pcf8575@26 {
>> +							compatible = "ti,pcf8575";
>> +							reg = <0x26>;
>> +						};
>> +					};
>> +
>> +					i2c@2 {
>> +						#address-cells = <1>;
>> +						#size-cells = <0>;
>> +						reg = <2>;
>> +
>> +						pcf8575@26 {
>> +							compatible = "ti,pcf8575";
>> +							reg = <0x26>;
>> +						};
>> +					};
> 
> All these i2c bus controllers should have a compatible value so that
> the OS knows what driver to bind to them.

The node i2c@15a00 is the PCI device. This PCI device has three bars, each
bar is a complete i2c controller. All three controller share one IRQ. The
device is probed via its pci-id and therefore I have no compatible value
here. Do you want me to add compatible values based on "Vendor ID, Device
ID, Subsystem Vendor ID, ..." as mention in the PCI-bindings?

The child nodes here (i2c@0,...) represent the bars. I probably should
replace i2c@0 with bar@0 and the reg property with a bar property. Would
that be okay?

> Also, the node names for the i2c devices should reflect what the
> device does, not what the part number is (grep ePAPR for 'generic
> names')
Okay. This probably also means that I should replace pic@ with 
interrupt-controller and so on.

Sebastian
