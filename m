From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH v5 2/4] drivers: firmware: xilinx: Add ZynqMP firmware
 driver
Date: Thu, 15 Mar 2018 17:57:30 +0000
Message-ID: <0a63e5d5-17b6-0be3-88e2-c8e56bcdfeb0@arm.com>
References: <1519154467-2896-1-git-send-email-jollys@xilinx.com>
 <1519154467-2896-3-git-send-email-jollys@xilinx.com>
 <dab419e8-3afe-5bfe-240e-e9ee4f2300f2@arm.com>
 <DM2PR0201MB076735E33069DC6F0C84EFDCB8D80@DM2PR0201MB0767.namprd02.prod.outlook.com>
 <2fb8ee8c-35ac-b7e6-e691-84464b0c8745@arm.com>
 <DM2PR0201MB07673298E409D07F0F748316B8D30@DM2PR0201MB0767.namprd02.prod.outlook.com>
 <4cff1193-5345-0531-d81e-0dd6e0633b19@arm.com>
 <DM2PR0201MB0767229750776EF2AF8455F3B8D00@DM2PR0201MB0767.namprd02.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DM2PR0201MB0767229750776EF2AF8455F3B8D00@DM2PR0201MB0767.namprd02.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jolly Shah <JOLLYS@xilinx.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, "ard.biesheuvel@linaro.org" <ard.biesheuvel@linaro.org>, "mingo@kernel.org" <mingo@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "matt@codeblueprint.co.uk" <matt@codeblueprint.co.uk>, "hkallweit1@gmail.com" <hkallweit1@gmail.com>, "keescook@chromium.org" <keescook@chromium.org>, "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Rajan Vaja <RAJANV@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "michal.simek@xilinx.com" <michal.simek@xilinx.com>
List-Id: devicetree@vger.kernel.org



On 15/03/18 17:53, Jolly Shah wrote:
> Hi Sudeep,
> 

[...]

>>
>> It's opposite, you are just adding whole lot of functions/APIs here with out the
>> users of those APIs. I am unable to visualise how they are getting used. So for
>> me even if you just add handful of above APIs with drivers making call to each
>> one of them along with it, I can better understand it. Without any usage of these
>> APIs in this series, I fail to understand the need of it.
>> So NACK to this patch without the users of the APIs introduced here.
>>
> 
> Ok. I will break series with users in next version.
> 

Thanks. Don't add any APIs which are not used by drivers in the series.
We don't want the whole set of APIs in that structure lying around in
the kernel without users.

-- 
Regards,
Sudeep
