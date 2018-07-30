From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v10 00/10] drivers: Introduce firmware dnd clock river for
 ZynqMP core
Date: Mon, 30 Jul 2018 14:50:42 +0200
Message-ID: <e5448935-770a-5c14-438c-23a652b17822@xilinx.com>
References: <1531857547-16652-1-git-send-email-jollys@xilinx.com>
 <2c3aad45-37ce-2446-4b90-bddb477286ed@xilinx.com>
 <CY1PR02MB2138E21A3FFBD5FEEAA7D6D4B8550@CY1PR02MB2138.namprd02.prod.outlook.com>
 <19376df2-fdd4-12e3-da4c-37106fffed19@xilinx.com>
 <153262301567.48062.15432354725863055071@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <153262301567.48062.15432354725863055071@swboyd.mtv.corp.google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, "ard.biesheuvel@linaro.org" <ard.biesheuvel@linaro.org>, "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "hkallweit1@gmail.com" <hkallweit1@gmail.com>, "keescook@chromium.org" <keescook@chromium.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "matt@codeblueprint.co.uk" <matt@codeblueprint.co.uk>, "mingo@kernel.org" <mingo@kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "sboyd@codeaurora.org" <sboyd@codeaurora.org>, "sudeep.holla@arm.com" <sudeep.holla@arm.com>, Jolly Shah <JOLLYS@xilinx.com>, Michal Simek <michal.simek@xilinx.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rajan Vaja <RAJANV@xilinx.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 26.7.2018 18:36, Stephen Boyd wrote:
> Quoting Michal Simek (2018-07-25 02:51:14)
>> On 24.7.2018 20:14, Jolly Shah wrote:
>>>>>  create mode 100644 drivers/firmware/xilinx/zynqmp-debug.h
>>>>>  create mode 100644 drivers/firmware/xilinx/zynqmp.c  create mode
>>>>> 100644 include/dt-bindings/clock/xlnx,zynqmp-clk.h
>>>>>  create mode 100644 include/linux/firmware/xlnx-zynqmp.h
>>>>>
>>>>
>>>> It looks pretty calm over the last several series that's why when I get an answer
>>>> from Stephen or Mike I will take this series via my tree and arm-soc tree.
>>>>
>>>> I have applied 01-08 here
>>>>  https://github.com/Xilinx/linux-xlnx/commits/zynqmp/soc
>>>>
>>>> Thanks,
>>>> Michal
>>>
>>>
>>> Thanks for merging the patches. 
>>> By mistake I added “Reviewed-by: Stephen Boyd sboyd@kernel.org” for firmware bindings (Patch01).  Stephen had reviewed clock bindings only.  Please suggest if I should send a new version with that fix.
>>
>> I have fixed that in my branch and I have asked Shephen to look at clk
>> over chat.
>>
> 
> I have some unresolved review comments on v9. I'll give reviewed-by when
> that discussion is resolved.

ok. Do you want to take them via clk tree or via arm-soc tree?

Thanks,
Michal
