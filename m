From: Fu Wei <fu.wei@linaro.org>
Subject: Re: [non-pretimeout,4/7] Watchdog: introduce ARM SBSA watchdog driver
Date: Wed, 24 Jun 2015 00:17:19 +0800
Message-ID: <CADyBb7seRmCFu3jhzUTJu7XemH=GjXRopx6EjfSzBypp95tn=w@mail.gmail.com>
References: <1433958452-23721-5-git-send-email-fu.wei@linaro.org>
	<20150611162810.GA22711@roeck-us.net>
	<CADyBb7uGT9bTNiG7524wrd14xiFfgwoDNMq1_J2HDxiK-ogc8Q@mail.gmail.com>
	<20150623152131.GA9990@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20150623152131.GA9990@roeck-us.net>
Sender: linux-doc-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>, Linaro ACPI Mailman List <linaro-acpi@lists.linaro.org>, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Wei Fu <tekkamanninja@gmail.com>, G Gregory <graeme.gregory@linaro.org>, Al Stone <al.stone@linaro.org>, Hanjun Guo <hanjun.guo@linaro.org>, Timur Tabi <timur@codeaurora.org>, Ashwin Chaugule <ashwin.chaugule@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Vipul Gandhi <vgandhi@codeaurora.org>, Wim Van Sebroeck <wim@iguana.be>, Jon Masters <jcm@redhat.com>, Leo Duran <leo.duran@amd.com>, Jon Corbet <corbet@lwn.net>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, rjw@rjwysocki.net
List-Id: devicetree@vger.kernel.org

Hi Guenter,

you always can provide help very quickly, thank you very much :-)

On 23 June 2015 at 23:21, Guenter Roeck <linux@roeck-us.net> wrote:
> On Tue, Jun 23, 2015 at 09:26:35PM +0800, Fu Wei wrote:
>> Hi Guenter,
> [ ...]
>
>> >
>> >> + *       When the first timeout occurs, WS0(SPI or LPI) is trigg=
ered,
>> >> + *       the second timeout period(as long as the first timeout =
period) starts.
>> >
>> > no longer accurate if WOR is used for the second period.
>> >
>> >> + *       In WS0 interrupt routine, panic() will be called for co=
llecting
>> >> + *       crashdown info.
>> >> + *       If system can not recover from WS0 interrupt routine, t=
hen second
>> >> + *       timeout occurs, WS1(reset or higher level interrupt) is=
 triggered.
>> >> + *       The two timeout period can be set by WOR(32bit).
>> >
>> > The second timeout period is determined by ...
>> >
>> >> + *       WOR gives a maximum watch period of around 10s at the m=
aximum
>> >> + *       system counter frequency.
>> >> + *       The System Counter shall run at maximum of 400MHz.
>> >
>> > "... at the maximum system counter frequency of 400 MHz.", and dro=
p the
>> > last sentence.
>>
>> For the second timeout period,  I have discussed with a kdump develo=
pers,
>> (1)10s maybe not good enough for all the case of panic + kdump, so
>> maybe we still need to use WCV in the second timeout period
>> (2)in the second timeout period, maybe we need to programme WCV for
>> two reason: a, trigger WS1 to reboot system ASAP; b, feed the watchd=
og
>> without cleanning WS0 flag.
>>
>> WHY we want to feed the watchdog (keepalive) without cleanning WS0 f=
lag??
>> REASON:
>> (1)if the system context is large, we may need to feed the dog until
>> we get all the things backed up.
>> (2)if system goes wrong,  WS0 triggered, then panic--> kdump. if we
>> feed the dog by WRR or programming WOR, WS0 flag will be cleaned. On=
ce
>> system goes wrong again, then panic again.....
>> So this system will be in a panic--kdump--panic--kdump loop, have no=
t
>> chance to reset.
>>
>> So if we are in the second timeout period, we may need to always pro=
gramme WCV.
>>
> The crashdump kernel is supposed to reload the watchdog driver, which=
 will ping
> the watchdog. If it isn't able to do that in 10 seconds, something is=
 wrong.

yes, 10s maybe not enough for all case.
When I tested kdump on arm64, sometimes , it took 20s. So I am
thinking : can we make the max value of pretimeout > 10s in this
driver.


>
>> >> +
>> >> +     status =3D readl_relaxed(gwdt->control_base + SBSA_GWDT_WCS=
);
>> >> +     if (status & SBSA_GWDT_WCS_WS1) {
>> >> +             dev_warn(dev, "System reset by WDT(WCV: %llx)\n",
>> >> +                      sbsa_gwdt_get_wcv(wdd));
>> >
>> > WCV here only tells us how many clock cycles were executed since t=
he
>> > system started (or something like that). So I still don't understa=
nd
>> > why it is valuable to print that number.
>>
>> this number provides the time of system reset, I thinks that may hel=
p
>> admin to analyse the system failure.
>>
> It doesn't mean anything to anyone but you since it is not in a well =
defined
> time scale.

maybe I should convert it to second?
I think the original value is better?

> Also, I would be somewhat surprised if WCV would retain its value
> on reset. Much more likely it is the time (in clock cycles) since res=
et.

yes, It has been mentioned in SBSA:
---------------------
If WS0 is asserted and a timeout refresh occurs then the following must=
 occur:
=EF=82=B7 If the system is compliant to SBSA level 0 or level 1 then it=
 is
IMPLEMENTATION DEFINED as to whether the
   compare value is loaded with the sum of the zero-extended watchdog
offset register and the current
  generic timer system count value, or whether it retains its current v=
alue.
=EF=82=B7 If the system is compliant to SBSA level 2 or higher the comp=
are
value must retain its current value. This
   means that the compare value records the time that WS1 is asserted.
---------------------

Hope I understand it correctly. please let me know , if I
misunderstand something, thanks

>
> Guenter



--=20
Best regards,

=46u Wei
Software Engineer
Red Hat Software (Beijing) Co.,Ltd.Shanghai Branch
Ph: +86 21 61221326(direct)
Ph: +86 186 2020 4684 (mobile)
Room 1512, Regus One Corporate Avenue,Level 15,
One Corporate Avenue,222 Hubin Road,Huangpu District,
Shanghai,China 200021
