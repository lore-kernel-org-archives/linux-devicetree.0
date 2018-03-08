From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH v5 1/4] dt-bindings: firmware: Add bindings for ZynqMP
 firmware
Date: Thu, 8 Mar 2018 11:48:09 +0000
Message-ID: <f6a416b7-542f-a3c3-538f-8549cf4e96c3@arm.com>
References: <1519154467-2896-1-git-send-email-jollys@xilinx.com>
 <1519154467-2896-2-git-send-email-jollys@xilinx.com>
 <778329dd-76a7-0151-26d9-30e87e0c888d@arm.com>
 <CY1PR0201MB0764FB23021F5DC694C7F56DB8D80@CY1PR0201MB0764.namprd02.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CY1PR0201MB0764FB23021F5DC694C7F56DB8D80@CY1PR0201MB0764.namprd02.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jolly Shah <JOLLYS@xilinx.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "matt@codeblueprint.co.uk" <matt@codeblueprint.co.uk>, "hkallweit1@gmail.com" <hkallweit1@gmail.com>, "michal.simek@xilinx.com" <michal.simek@xilinx.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, "ard.biesheuvel@linaro.org" <ard.biesheuvel@linaro.org>, "mingo@kernel.org" <mingo@kernel.org>, "keescook@chromium.org" <keescook@chromium.org>, "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>, Rajan Vaja <RAJANV@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



On 07/03/18 22:25, Jolly Shah wrote:
> Hi Sudeep,
> 

[...]

>>> +Examples:
>>> +	firmware {
>>> +		zynqmp_firmware: zynqmp-firmware {
>>> +			compatible = "xlnx,zynqmp-firmware";
>>> +			method = "smc";
>>> +		};
>>> +	};
>>>
>>
>> Do you foresee using SMC/HVC for this firmware even on future platforms?
>> If not, I suggest to keep the protocol part separate from the transport i.e.
>> smc/hvc via ATF. It could be replaced with mailbox or some h/w mechanism in
>> future ?
>>
> 
> We have PSCI and EEMI interfaces exposed to linux from ATF. PSCI is
> an EEMI client. We do not have current plans to switch to mailbox as it
> will require 2 communication channels to PMU as PSCI is through ATF.
> 

OK, but I just saw some bindings that has mailbox interface, honestly
it's getting too confusing with multiple series on the same thing
floating and hence I requested to put it together as one series.
-- 
Regards,
Sudeep
