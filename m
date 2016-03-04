From: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 1/4] mmc: meson: Document Amlogic Meson MMC DT bindings
Date: Fri, 4 Mar 2016 09:11:31 +0100
Message-ID: <CAOQ7t2a85sgRj4JGV24iVbEZKWqqORmMDFwXvOFOu_y3XkHApg@mail.gmail.com>
References: <1456596108-1406-1-git-send-email-carlo@caione.org>
	<1456596108-1406-2-git-send-email-carlo@caione.org>
	<20160303221744.GA1828@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160303221744.GA1828@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-meson <linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-6IF/jdPJHihWk0Htik3J/w@public.gmane.org, Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 3, 2016 at 11:17 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Sat, Feb 27, 2016 at 07:01:45PM +0100, Carlo Caione wrote:
>> From: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
>>
>> Signed-off-by: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
>> ---
>>  .../devicetree/bindings/mmc/meson-mmc.txt          | 30 ++++++++++++++++++++++
>>  1 file changed, 30 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mmc/meson-mmc.txt
>>
>> diff --git a/Documentation/devicetree/bindings/mmc/meson-mmc.txt b/Documentation/devicetree/bindings/mmc/meson-mmc.txt
>> new file mode 100644
>> index 0000000..328157e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mmc/meson-mmc.txt
>> @@ -0,0 +1,30 @@
>> +* Amlogic Meson MMC controller
>> +
>> +The highspeed MMC host controller on Amlogic SoCs provides an interface
>> +for MMC, SD, SDIO and SDHC types of memory cards.
>> +
>> +Supported maximum speeds are the ones of the eMMC standard 4.41 as well
>> +as the speed of SD standard 2.0.
>> +
>> +Required properties:
>> + - compatible : "amlogic,meson-mmc"
>> + - reg : mmc controller base registers
>> + - interrupts : mmc controller interrupt
>> + - clocks : phandle to clock provider
>> + - pinctrl-names : should contain "sdio_a" or "sdio_b"
>> + - pinctrl-0: Should specify pin control groups used for this controller
>> +
>> +Optional properties:
>> + - meson,sd-port : 0 for port A, 1 for port B
>
> This is different than the pinctrl-names? It needs a better description
> including what is the default if absent.
>

This was already discussed here
http://www.spinics.net/lists/linux-mmc/msg34407.html.
In the previous version (V4) I used pinctrl-names to select the
correct port but discussing with Ulf we decided to switch back to have
a new property in the DTS.
About what this value is, it is a bit up to our interpretation. We use
this value to setup the SDIO_PORT_SEL register and in the register
description in the documentation I read only "SDIO port selection. 0:
SDIO A; 1: SDIO B".
So I'm assuming this is somehow related to the muxing / pin controller
configuration but probably it's better to stay on the safe side and
just have a new property to setup this value.

I'll add the new default value in the next version.

-- 
Carlo Caione
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
