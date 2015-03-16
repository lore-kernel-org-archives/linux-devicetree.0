From: Peter Hurley <peter@hurleysoftware.com>
Subject: Re: [REGRESSION] "of: Fix premature bootconsole disable with 'stdout-path'"
 breaks console on tty0
Date: Mon, 16 Mar 2015 18:36:45 -0400
Message-ID: <55075AFD.7000001@hurleysoftware.com>
References: <55070544.9010908@redhat.com> <550717A0.3060603@hurleysoftware.com> <55071D0C.2050700@redhat.com> <55071F87.1050706@hurleysoftware.com> <5507227D.8020408@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <5507227D.8020408@redhat.com>
Sender: stable-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Grant Likely <grant.likely@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>, Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable <stable@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 03/16/2015 02:35 PM, Hans de Goede wrote:
> Hi,
> 
> On 16-03-15 19:23, Peter Hurley wrote:
>> On 03/16/2015 02:12 PM, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 16-03-15 18:49, Peter Hurley wrote:
>>>> Hi Hans,
>>>>
>>>> On 03/16/2015 12:31 PM, Hans de Goede wrote:
>>>>> Hi All,
>>>>>
>>>>> While updating my local working tree to 4.0-rc4 this morning I noticed that I no longer
>>>>> get console / kernel messages output on the hdmi output of my ARM board / on tty0
>>>>>
>>>>> This is caused by:
>>>>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/drivers/of?id=2fa645cb2703d9b3786d850db815414dfeefa51d
>>>>>
>>>>> Reverting this commit fixes this for me.
>>>>>
>>>>> What is happening here is that the "add_preferred_console("stdout-path", 0, NULL);"
>>>>> happens before the tty0 registers stopping tty0 from becoming part of the console list
>>>>> since there already is a preferred console at that time.
>>>>>
>>>>> This is an undesirable behavior change caused by the commit in question, on boards
>>>>> where there is both video output, and a serial console configured through stdout-path
>>>>> we want to have console output on both as we do not know which of the 2 will actually
>>>>> be hooked up by the user.
>>>>
>>>> I don't see this as a regression, but rather a misconfiguration.
>>>
>>> As said it is an undesirable behavior change, whether you want to call that a regression
>>> or not is not all that interesting. Fixing it however is important, as e.g. Fedora
>>> ARM images rely on this behavior, both "regular" arm as well as aarch64.
>>
>> What dts file is causing this problem?
>> Is it in mainline or distributed only in Fedora?
> 
> This is on allwinner (sunxi) devices such as Allwinner A10 or A20 based boards, currently
> the setting of stdout-path on these boards is done by (an unmodified) upstream u-boot.

You forgot to mention my patch is not very likely to break anything
in the wild since _you_ upstreamed the dependency only 3 weeks ago [1].

And what "Fedora ARM images rely on this behavior"?

I don't appreciate the deception.

Regards,
Peter Hurley

[1] git log from u-boot repo

commit f3133962f469a8b6b9ba237ba670f0ca7c88a02e
Author: Hans de Goede <hdegoede@redhat.com>
Date:   Fri Feb 20 16:55:12 2015 +0100

    sunxi: Set the /chosen/stdout-path fdt property for sunxi boards
    
    While discussing with some people how to get the Linux kernel to do the
    right thing wrt sending output to both the serial console and the
    hdmi out / lcd screen when booting on ARM devices, Grant Likely pointed out
    that there already is a solution for this.
    
    All we need to do is set the /chosen/stdout-path fdt property, and if no
    console= arguments were specified on the kernel commandline the kernel
    will honor this and add this device as a console (next to the primary
    video output on hdmi).
    
    And u-boot already has support for setting this, all we need to do is
    define OF_STDOUT_PATH and then everything will just work ootb, without
    people needing to meddle with adding console= arguments in extlinux.conf .
    
    Signed-off-by: Hans de Goede <hdegoede@redhat.com>
    Acked-by: Ian Campbell <ijc@hellion.org.uk>
    Reviewed-by: Tom Rini <trini@ti.com>

diff --git a/include/configs/sunxi-common.h b/include/configs/sunxi-common.h
index f5efebb..0b4f0a0 100644
--- a/include/configs/sunxi-common.h
+++ b/include/configs/sunxi-common.h
@@ -210,6 +210,20 @@ extern int soft_i2c_gpio_scl;
 #define CONFIG_CONS_INDEX              1       /* UART0 */
 #endif
 
+#if CONFIG_CONS_INDEX == 1
+#ifdef CONFIG_MACH_SUN9I
+#define OF_STDOUT_PATH		"/soc/serial@07000000:115200"
+#else
+#define OF_STDOUT_PATH		"/soc@01c00000/serial@01c28000:115200"
+#endif
+#elif CONFIG_CONS_INDEX == 2 && defined(CONFIG_MACH_SUN5I)
+#define OF_STDOUT_PATH		"/soc@01c00000/serial@01c28400:115200"
+#elif CONFIG_CONS_INDEX == 5 && defined(CONFIG_MACH_SUN8I)
+#define OF_STDOUT_PATH		"/soc@01c00000/serial@01f02800:115200"
+#else
+#error Unsupported console port nr. Please fix stdout-path in sunxi-common.h.
+#endif
+
 /* GPIO */
 #define CONFIG_SUNXI_GPIO
 #define CONFIG_SPL_GPIO_SUPPORT
