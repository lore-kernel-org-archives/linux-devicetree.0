From: sricharan@codeaurora.org
Subject: Re: [PATCH v3 04/13] ARM: dts: ipq4019: Update ipq4019-dk01.1 board
 data
Date: Wed, 21 Mar 2018 14:40:43 +0530
Message-ID: <78806c70c85e3cecaadfc94b173cb139@codeaurora.org>
References: <1521518336-5467-1-git-send-email-sricharan@codeaurora.org>
 <1521518336-5467-5-git-send-email-sricharan@codeaurora.org>
 <20180320143131.4eenixtbhciq5fwc@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180320143131.4eenixtbhciq5fwc@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Cochran <richardcochran@gmail.com>
Cc: mark.rutland@arm.com, robh@kernel.org, devicetree@vger.kernel.org, marc.zyngier@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, linux@armlinux.org.uk, bjorn.andersson@linaro.org, david.brown@linaro.org, absahu@codeaurora.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, linux-soc@vger.kernel.org, sboyd@codeaurora.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2018-03-20 20:01, Richard Cochran wrote:
> On Tue, Mar 20, 2018 at 09:28:47AM +0530, Sricharan R wrote:
>> Reviewed-by: Abhishek Sahu <absahu@codeaurora.org>
>> Adds missing memory, reserved-memory nodes.
>> 
>> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
>> ---
>>  arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi | 28 
>> +++++++++++++++++++++++++++
> 
> Q: Does mainline Linux even boot on the DK?
> 
> A: No, it doesn't.

  Yes, i saw that it was booting out of mainline.
  Both DK01 and DK04 boards boots out of mainline.

cat /proc/version
Linux version 4.16.0-rc6 (srichara@srichara-linux) (gcc version 6.3.1 
20170109 (Linaro GCC 6.3-2017.02)) #1677 SMP PREEMPT Wed Mar 21 12:58:14 
IST 2018

  If it does not boot for you, then can you check if your bootloader is 
passing this bootarg ?

     bootargs=console=ttyMSM0,115200n8

   This is the only one required from bootloader to boot.
   That said, there should have been a default 'chosen' node in DTS
   for the serial console atleast which is not there today. I will add 
this
   in my v4 along with other changes.

Regards,
  Sricharan

> 
> Please add the missing basic board support before hacking random stuff
> into the DTS.
> 
