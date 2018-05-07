From: Dinh Nguyen <dinh.linux@gmail.com>
Subject: Re: [PATCHv2 3/3] arm64: dts: stratix10: add sdram ecc
Date: Mon, 7 May 2018 16:10:01 -0500
Message-ID: <CADhT+weL=8ODk1JVLwUXtFG3e4iKfzBMpZmo4Y0UwoK0=H=Zhg@mail.gmail.com>
References: <1524854238-19394-1-git-send-email-thor.thayer@linux.intel.com>
 <1524854238-19394-4-git-send-email-thor.thayer@linux.intel.com>
 <20180507165943.GE733@pd.tnic>
 <CADhT+weyJFhMyPbVt0n2EVe7OpeHHLjhxjw7aY2_8GBZ-7h7Xg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CADhT+weyJFhMyPbVt0n2EVe7OpeHHLjhxjw7aY2_8GBZ-7h7Xg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Borislav Petkov <bp@alien8.de>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, thor.thayer@linux.intel.com, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh+dt@kernel.org>, mchehab@kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Boris,

On Mon, May 7, 2018 at 3:50 PM, Dinh Nguyen <dinh.linux@gmail.com> wrote:
> On Mon, May 7, 2018 at 11:59 AM, Borislav Petkov <bp@alien8.de> wrote:
>> On Fri, Apr 27, 2018 at 01:37:18PM -0500, thor.thayer@linux.intel.com wrote:
>>> From: Thor Thayer <thor.thayer@linux.intel.com>
>>>
>>> Add the Stratix10 ECC Manager and SDRAM EDAC nodes to the
>>> device tree.
>>>
>>> Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
>>> ---
>>> v2  Remove unused SysMan syscon
>>>     Remove unused SDRAM ECC register defines
>>>     Remove unused address, size and range from device tree.
>>> ---
>>>  arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi | 12 ++++++++++++
>>>  1 file changed, 12 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
>>> index c89d0c307f8d..688391f3bf78 100644
>>> --- a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
>>> +++ b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
>>> @@ -387,5 +387,17 @@
>>>                       resets = <&rst WATCHDOG3_RESET>;
>>>                       status = "disabled";
>>>               };
>>> +
>>> +             eccmgr {
>>> +                     compatible = "altr,socfpga-s10-ecc-manager";
>>> +                     interrupts = <0 15 4>, <0 95 4>;
>>> +                     interrupt-controller;
>>> +                     #interrupt-cells = <2>;
>>> +
>>> +                     sdramedac {
>>> +                             compatible = "altr,sdram-edac-s10";
>>> +                             interrupts = <16 4>, <48 4>;
>>> +                     };
>>> +             };
>>>       };
>>>  };
>>> --
>>> 2.7.4
>>>
>>> --
>>
>> Hey Rob,
>>
>> ACK here too?
>>
>> Also, this one:
>>
>> https://lkml.kernel.org/r/1525203036-21774-1-git-send-email-thor.thayer@linux.intel.com
>>
>> ?
>>
>
> Just in case you need mine, since the edits here match what was in the
> in the bindings doc.
>
> Acked-by: Dinh Nguyen <dinguyen@kernel.org>
>

Do you mind if I take this patch through arm-soc? I have a pull
request to arm-soc that is pending.

http://lists.infradead.org/pipermail/linux-arm-kernel/2018-April/573133.html

In that pull request, there is a patch:

https://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git/commit/?h=socfpga_for_next_v4.18_dts_v1&id=d93101abe41e9596555a0f7f6f775e543b71c441

This patch has some major changes to the socfpga_stratix10.dtsi file
that will conflict with this patch.

If it's okay with you.

Thanks,
Dinh
