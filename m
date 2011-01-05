From: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH 03/15] x86/dtb: Add a device tree for CE4100
Date: Wed, 5 Jan 2011 11:01:12 +0100
Message-ID: <20110105100112.GA670@www.tglx.de>
References: <1292600033-12271-1-git-send-email-bigeasy@linutronix.de>
	<1292600033-12271-4-git-send-email-bigeasy@linutronix.de>
	<20101230085122.GE11721@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

* Grant Likely | 2010-12-30 01:51:22 [-0700]:

>> diff --git a/arch/x86/platform/ce4100/falconfalls.dts b/arch/x86/platform/ce4100/falconfalls.dts
>> new file mode 100644
>> index 0000000..24e67ca
>> --- /dev/null
>> +++ b/arch/x86/platform/ce4100/falconfalls.dts
>> @@ -0,0 +1,212 @@
>> +/*
>> + * CE4100 on Falcon Falls
>> + *
>> + * (c) Copyright 2010 Intel Corporation
>> + *
>> + * This program is free software; you can redistribute it and/or modify it
>> + * under the terms of the GNU General Public License as published by the
>> + * Free Software Foundation; version 2 of the License.
>> + */
>> +/dts-v1/;
>> +/ {
>> +	model = "Intel,FalconFalls";
>> +	compatible = "Intel,FalconFalls";
>
>To-date the convention has been to use all lowercase in compatible
>properties.  Ditto throughout this file.
done

>> +	soc@0 {
>> +		#address-cells = <1>;
>> +		#size-cells = <1>;
>> +		device_type = "soc";
>
>Drop device_type property.
done

>> +		ioapic1: pic@fec00000 {
>> +			#interrupt-cells = <2>;
>> +			compatible = "Intel,ioapic";
>> +			interrupt-controller;
>> +			device_type = "interrupt-controller";
>
>Ditto
done

>> +		pci@3fc {
>> +			#address-cells = <3>;
>> +			#interrupt-cells = <1>;
>> +			#size-cells = <2>;
>> +			compatible = "Intel,ce4100-pci", "pci";
>> +			device_type = "pci";
>
>I'd like to say ditto here, but it might require a change to the
>current kernel code.  I believe ePAPR specified a compatible value
>alternative to 'device_type = "pci";'.
I have the pci property. So I drop the device_type once it is possible.

>> +			isa@0 {
>> +				#address-cells = <2>;
>> +				#size-cells = <1>;
>> +				compatible = "isa";
>> +				ranges = <1 0 0 0 0 0x100>;
>> +
>> +				rtc@70 {
>> +					compatible = "motorola,mc146818";
>> +					interrupts = <8 3>;
>> +					interrupt-parent = <&ioapic1>;
>
>If you put an interrupt-parent property in the root node, then it will
>become the default interrupt controller for the system which is
>usually convenient to have.
Okay, I mode it once I have more common devices. I have two interrupt
controller and most devices are attached to the second one (and are
assigned via interrupt-map).

>> +			/* Secondary IO-APIC */
>> +			ioapic2: pic@bffff000 {
>> +				#interrupt-cells = <2>;
>> +				compatible = "Intel,ioapic-ce4100", "Intel,ioapic";
>> +				interrupt-controller;
>> +				device_type = "interrupt-controller";
>
>Drop device_type.
done

Sebastian
