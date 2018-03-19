Return-Path: <SRS0=tqBq=GJ=gmail.com=jacek.anaszewski@kernel.org>
Subject: Standardized LED function names [was: Re: [PATCH v3] leds: add LED
 driver for CR0014114 board]
References: <20180312155829.12365-1-oleg@kaa.org.ua>
 <20180313124548.12074-1-oleg@kaa.org.ua>
 <20180318124925.i4yuxigkfu6spv26@rob-hp-laptop>
 <fbe35381-45a6-7084-c1f9-5ede1eb88bab@gmail.com>
 <CAL_JsqKdCa_FV13fEw8V-avojUCN_PB+2djsnCsGDH-5qAOEcA@mail.gmail.com>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <f8cd9de6-839b-b874-40af-d84b9f7de296@gmail.com>
Date: Mon, 19 Mar 2018 22:18:02 +0100
MIME-Version: 1.0
In-Reply-To: <CAL_JsqKdCa_FV13fEw8V-avojUCN_PB+2djsnCsGDH-5qAOEcA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
To: Rob Herring <robh@kernel.org>
Cc: Oleh Kravchenko <oleg@kaa.org.ua>, devicetree@vger.kernel.org, Linux LED Subsystem <linux-leds@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>
List-ID: <devicetree@vger.kernel.org>

On 03/19/2018 12:38 AM, Rob Herring wrote:
> On Sun, Mar 18, 2018 at 3:03 PM, Jacek Anaszewski
> <jacek.anaszewski@gmail.com> wrote:
>> On 03/18/2018 01:49 PM, Rob Herring wrote:
>>> On Tue, Mar 13, 2018 at 02:45:48PM +0200, Oleh Kravchenko wrote:
>>>> This patch adds a LED class driver for the RGB LEDs found on
>>>> the Crane Merchandising System CR0014114 LEDs board.
>>>>
>>>> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
>>>> ---
>>>>  .../devicetree/bindings/leds/leds-cr0014114.txt    |  46 ++++
>>>>  .../devicetree/bindings/vendor-prefixes.txt        |   1 +
>>>
>>> Please split to separate patch.
>>>
>>>>  drivers/leds/Kconfig                               |  13 +
>>>>  drivers/leds/Makefile                              |   1 +
>>>>  drivers/leds/leds-cr0014114.c                      | 292 +++++++++++++++++++++
>>>>  5 files changed, 353 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/leds/leds-cr0014114.txt
>>>>  create mode 100644 drivers/leds/leds-cr0014114.c
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/leds/leds-cr0014114.txt b/Documentation/devicetree/bindings/leds/leds-cr0014114.txt
>>>> new file mode 100644
>>>> index 000000000000..977a9929b04f
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/leds/leds-cr0014114.txt
>>>> @@ -0,0 +1,46 @@
>>>> +Crane Merchandising System - cr0014114 LED driver
>>>> +-------------------------------------------------
>>>> +
>>>> +This LED Board is widely used in vending machines produced
>>>> +by Crane Merchandising Systems.
>>>> +
>>>> +Required properties:
>>>> +- compatible: "cms,cr0014114"
>>>> +- reg: chip select address for the device
>>>> +- spi-cpha: shifted clock phase mode is required
>>>> +
>>>> +LED sub-node properties:
>>>> +- label : (optional)
>>>> +    see Documentation/devicetree/bindings/leds/common.txt
>>>> +- linux,default-trigger : (optional)
>>>> +    see Documentation/devicetree/bindings/leds/common.txt
>>>> +
>>>> +Example
>>>> +-------
>>>> +
>>>> +cr0014114@0 {
>>>
>>> leds@...
>>
>> In [0] you required it to be led-controller and the rest like below:
> 
> Ah yes, you're right. That's what I get for trying to go off my memory.
> 
>>
>>
>> led-controller@12 {
>>   reg = <12>;
>>
>>   led@0 {
>>     reg = <0>;
>>   };
>>   led@1 {
>>     reg = <1>;
>>   };
>> };
>>
>>
>> Since that time I started to require adhering to this naming pattern
>> for LED controller node and led@address for child nodes, where
>> applicable.
>>
>> I plan on submitting a patch for common LED bindings, that will
>> switch device names to led-controller in DT examples.
>>
>> With this scheme another problem arises, because now we have:
>>
>> - label: The label for this LED. If omitted, the label is taken from
>>          the node name (excluding the unit address).
>>
>> With that DT child node name is useless, because it is "led" for
>> each sub-led. Therefore I propose to make label property required,
>> and avoid using child DT node name as a fallback.
> 
> There was never any guarantee that the same child node name was not
> used elsewhere.
> 
> I think the OS needs to be able to cope with no label or even that
> label is not unique. Suppose you have an overlay for a addon board and
> you can have multiple boards connected. They'd all have the same
> label.

LED subsystem is already protected against duplicated LED names:
a96aa64cb572 ("leds/led-class: Handle LEDs with the same name").

> So moving to label only reduces the problem. You could use the
> reg property and/or compatible of the parent to construct the names.
> Or just append an IDR value to the name like we do on platform
> devices. If the user didn't specify a label, then they shouldn't
> really care what the name is, so just use "led.X". Though likely folks
> will care if the name changes on them.

OK, so my main intention was to get rid of the part:

"If omitted, the label is taken from the node name (excluding
the unit address).",

because it won't make a sense after imposing an explicit requirement
on the child nodes to have only "led" in the main part of their names.

In effect, we need to change the fallback definition to make it sane.
You proposed reg property and/or compatible, but:

- reg property is not applicable in all cases (think of gpio LEDs).
- compatible on the other hand will have much in common with devicename,
  you once mentioned would be good to get rid of [0]:

"
A case I care about is I have a family of boards that all have a
common defined set of 4 LEDs. They could be driven by anything, but I
want the same interface presented to userspace across boards.
"

We also had a discussion about standardized LED function names, so I
retrieved all LED function names from dts files present in kernel,
and after unifying some similar occurrences I got something like
below. Perhaps it doesn't make a sense to add all of the below
definitions to the standard header, but some of them could certainly
find their place in e.g. include/dt-bindings/leds/led-functions.h.

Then we could have LED names in the form function:color, and below
defines could be used in dts files to avoid spawning similar LED names
describing the same function.

Of course in case of the names presented here with numerical suffixes
we could skip the suffix.


#define LED_FUNCTION_ACTIVITY "activity"
#define LED_FUNCTION_ADSL "adsl"
#define LED_FUNCTION_ALARM "alarm"
#define LED_FUNCTION_ALIVE "alive"
#define LED_FUNCTION_ALL "all"
#define LED_FUNCTION_APP "app"
#define LED_FUNCTION_AUX "aux"
#define LED_FUNCTION_BACKUP "backup"
#define LED_FUNCTION_BEEP "beep"
#define LED_FUNCTION_BLUETOOTH "bluetooth"
#define LED_FUNCTION_BOOT "boot"
#define LED_FUNCTION_BOTTOM "bottom"
#define LED_FUNCTION_BRICK-STATUS "brick-status"
#define LED_FUNCTION_BT "bt"
#define LED_FUNCTION_CEL "cel"
#define LED_FUNCTION_CEL-PWR "cel-pwr"
#define LED_FUNCTION_CEL-RESET "cel-reset"
#define LED_FUNCTION_CHRG "chrg"
#define LED_FUNCTION_COM "com"
#define LED_FUNCTION_COPY "copy"
#define LED_FUNCTION_CORE_MODULE "core_module"
#define LED_FUNCTION_CPU "cpu"
#define LED_FUNCTION_D "d"
#define LED_FUNCTION_DEBUG "debug"
#define LED_FUNCTION_DIA "dia"
#define LED_FUNCTION_DISK "disk"
#define LED_FUNCTION_DOWN "down"
#define LED_FUNCTION_DSL "dsl"
#define LED_FUNCTION_ENOCEAN "enocean"
#define LED_FUNCTION_ENTER "enter"
#define LED_FUNCTION_ERROR "error"
#define LED_FUNCTION_ESATA "esata"
#define LED_FUNCTION_ETHERNET-STATUS "ethernet-status"
#define LED_FUNCTION_FAIL "fail"
#define LED_FUNCTION_FAULT "fault"
#define LED_FUNCTION_FRONT "front"
#define LED_FUNCTION_FUNC "func"
#define LED_FUNCTION_G "g"
#define LED_FUNCTION_GHZ "ghz"
#define LED_FUNCTION_GHZ-1 "ghz-1"
#define LED_FUNCTION_GHZ-2 "ghz-2"
#define LED_FUNCTION_GPIO "gpio"
#define LED_FUNCTION_GSM "gsm"
#define LED_FUNCTION_HD "hd"
#define LED_FUNCTION_HDD "hdd"
#define LED_FUNCTION_HDDERR "hdderr"
#define LED_FUNCTION_HEALTH "health"
#define LED_FUNCTION_HEART "heart"
#define LED_FUNCTION_HEARTBEAT "heartbeat"
#define LED_FUNCTION_HOME "home"
#define LED_FUNCTION_INET "inet"
#define LED_FUNCTION_INFO "info"
#define LED_FUNCTION_INTERNET "internet"
#define LED_FUNCTION_KEYPAD "keypad"
#define LED_FUNCTION_L "l"
#define LED_FUNCTION_LAN "lan"
#define LED_FUNCTION_LEDB "ledb"
#define LED_FUNCTION_LEFT "left"
#define LED_FUNCTION_L_HDD "l_hdd"
#define LED_FUNCTION_LIVE "live"
#define LED_FUNCTION_LOGO "logo"
#define LED_FUNCTION_MICROSD "microsd"
#define LED_FUNCTION_MISC "misc"
#define LED_FUNCTION_MMC "mmc"
#define LED_FUNCTION_NAND "nand"
#define LED_FUNCTION_NETWORK "network"
#define LED_FUNCTION_ON "on"
#define LED_FUNCTION_ORANGE "orange"
#define LED_FUNCTION_OS "os"
#define LED_FUNCTION_PANEL "panel"
#define LED_FUNCTION_PMU_STAT "pmu_stat"
#define LED_FUNCTION_POWER "power"
#define LED_FUNCTION_PROG "prog"
#define LED_FUNCTION_PROGRAMMING "programming"
#define LED_FUNCTION_PROXIMITYSENSOR "proximitysensor"
#define LED_FUNCTION_PULSE "pulse"
#define LED_FUNCTION_PWR "pwr"
#define LED_FUNCTION_QSS "qss"
#define LED_FUNCTION_REBUILD "rebuild"
#define LED_FUNCTION_R_HDD "r_hdd"
#define LED_FUNCTION_RIGHT "right"
#define LED_FUNCTION_ROUTER "router"
#define LED_FUNCTION_RS "rs"
#define LED_FUNCTION_RX "rx"
#define LED_FUNCTION_SATA "sata"
#define LED_FUNCTION_SATA-L "sata-l"
#define LED_FUNCTION_SATA-R "sata-r"
#define LED_FUNCTION_SD "sd"
#define LED_FUNCTION_SLEEP "sleep"
#define LED_FUNCTION_STANDBY "standby"
#define LED_FUNCTION_STATE "state"
#define LED_FUNCTION_STATUS "status"
#define LED_FUNCTION_SW "sw"
#define LED_FUNCTION_SWRDY "swrdy"
#define LED_FUNCTION_SYS "sys"
#define LED_FUNCTION_SYSTEM "system"
#define LED_FUNCTION_SYSTEM-STATUS "system-status"
#define LED_FUNCTION_TEL "tel"
#define LED_FUNCTION_TOP "top"
#define LED_FUNCTION_TV "tv"
#define LED_FUNCTION_TX "tx"
#define LED_FUNCTION_UP "up"
#define LED_FUNCTION_USB "usb"
#define LED_FUNCTION_USB_1 "usb_1"
#define LED_FUNCTION_USB_2 "usb_2"
#define LED_FUNCTION_USB_COPY "usb_copy"
#define LED_FUNCTION_USB-PORT1 "usb-port1"
#define LED_FUNCTION_USB-PORT2 "usb-port2"
#define LED_FUNCTION_USER "user"
#define LED_FUNCTION_USR "usr"
#define LED_FUNCTION_WAN "wan"
#define LED_FUNCTION_WIFI "wifi"
#define LED_FUNCTION_WIFI_AP "wifi_ap"
#define LED_FUNCTION_WIFI-STATUS "wifi-status"
#define LED_FUNCTION_WIRELESS "wireless"
#define LED_FUNCTION_WLAN "wlan"
#define LED_FUNCTION_WLAN_G "wlan_g"
#define LED_FUNCTION_WMODE "wmode"
#define LED_FUNCTION_WPS "wps"


[0] https://patchwork.kernel.org/patch/10089047/
-- 
Best regards,
Jacek Anaszewski
