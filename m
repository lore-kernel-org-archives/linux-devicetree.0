From: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH] drivers, char: add U-Boot bootcount driver
Date: Mon, 05 Dec 2011 15:39:46 +0100
Message-ID: <4EDCD7B2.5030409@denx.de>
References: <1322991921-21096-1-git-send-email-hs@denx.de>
 <20111204114741.GA5788@pengutronix.de>
Reply-To: hs-ynQEQJNshbs@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <20111204114741.GA5788-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>, Vitaly Bordug <vbordug-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Wolfram,

Wolfram Sang wrote:
> On Sun, Dec 04, 2011 at 10:45:21AM +0100, Heiko Schocher wrote:
>> This driver implements the Linux kernel half of the boot count feature -
>> the boot counter can only be reset after it is clear that the
>> application has been started and is running correctly, which usually
>> can only be determined by the application code itself. Thus the reset
>> of the boot counter must be done by application code, which thus needs
>> an appropriate driver.
> 
> An appropriate mechanism, not necessarily a driver, see below.
> 
>> Required feature by the Carrier Grade Linux Requirements Definition;
>> see for example document "Carrier Grade Linux Requirements Definition
>> Overview V3.0" at
>>
>> http://www.linuxfoundation.org/collaborate/workgroups/cgl/requirements#SMM.6.0_Boot_Cycle_Detection
>>
>>       Description: OSDL CGL specifies that carrier grade Linux
>>       shall provide support for detecting a repeating reboot cycle
>> 	due to recurring failures. This detection should happen in
>> 	user space before system services are started.
> 
> So, technically, a flag would be enough, not necessarily a counter? Although a
> counter probably has more advantages...
> 
>> This driver provides read/write access to the U-Boot bootcounter
>> through PROC FS and/or sysFS file.
> 
> Why ProcFS? Why ProcFS and/or SysFS? Which has priority? Why not /dev?

I drop the ProcFS support for v2.

>> The bootcountregister gets configured via DTS.
>> for example on the enbw_cmc board:
>>
>> bootcount@0x23060 {
>>                   compatible = "uboot,bootcount";
> 
> No. I assume you are not the vendor of what is at 0x23060, the actual device.
> Only the device must be encoded in the compatible-entry which then implies the
> bootcount functionality. Also, keep in mind that your solution should be
> generic for bootloaders.

So I should call it compatible = "generic, bootcount" ?

>>                   reg = <0x23060 0x20>;
> 
> I assume that non-volatile memory would qualify as a boot-counter, so those
> could be tied to I2C busses etc? reg would not fit then.

Currently, mem only supported, add this to the Documentation and log
message.

> I do wonder if it makes more sense to add such functionality to the
> watchdog-core to save the additional device (CCed). Needs a second thought,
> though...

Thanks!

bye,
heiko
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
