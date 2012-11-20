From: Fabio Porcedda <fabio.porcedda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 3/8] watchdog: orion_wdt: add timeout-sec property
 binding
Date: Tue, 20 Nov 2012 13:50:46 +0100
Message-ID: <CAHkwnC-2MXtNODnqjOvFuHt7ToqvMqeDjnqdGyGfMacKBWzoLw@mail.gmail.com>
References: <1353334243-16703-1-git-send-email-fabio.porcedda@gmail.com>
 <1353334243-16703-4-git-send-email-fabio.porcedda@gmail.com>
 <20121119160643.GI22106@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20121119160643.GI22106-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 19, 2012 at 5:06 PM, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org> wrote:
> On Mon, Nov 19, 2012 at 03:10:38PM +0100, Fabio Porcedda wrote:
>> Only compile tested.
>>
>> Signed-off-by: Fabio Porcedda <fabio.porcedda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
>> Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/watchdog/marvel.txt | 5 +++++
>>  drivers/watchdog/orion_wdt.c                          | 8 +++-----
>>  2 files changed, 8 insertions(+), 5 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/watchdog/marvel.txt b/Doc=
umentation/devicetree/bindings/watchdog/marvel.txt
>> index 0b2503a..5dc8d30 100644
>> --- a/Documentation/devicetree/bindings/watchdog/marvel.txt
>> +++ b/Documentation/devicetree/bindings/watchdog/marvel.txt
>> @@ -5,10 +5,15 @@ Required Properties:
>>  - Compatibility : "marvell,orion-wdt"
>>  - reg                : Address of the timer registers
>>
>> +Optional properties:
>> +
>> +- timeout-sec        : Contains the watchdog timeout in seconds
>> +
>>  Example:
>>
>>       wdt@20300 {
>>               compatible =3D "marvell,orion-wdt";
>>               reg =3D <0x20300 0x28>;
>> +             timeout-sec =3D <10>;
>>               status =3D "okay";
>>       };
>> diff --git a/drivers/watchdog/orion_wdt.c b/drivers/watchdog/orion_wdt.c
>> index c20f96b..446a3e9 100644
>> --- a/drivers/watchdog/orion_wdt.c
>> +++ b/drivers/watchdog/orion_wdt.c
>> @@ -162,12 +162,10 @@ static int __devinit orion_wdt_probe(struct platfo=
rm_device *pdev)
>>
>>       wdt_max_duration =3D WDT_MAX_CYCLE_COUNT / wdt_tclk;
>>
>> -     if ((heartbeat < 1) || (heartbeat > wdt_max_duration))
>> -             heartbeat =3D wdt_max_duration;
>> -
>> -     orion_wdt.timeout =3D heartbeat;
>>       orion_wdt.min_timeout =3D 1;
>> +     orion_wdt.timeout =3D wdt_max_duration;
>>       orion_wdt.max_timeout =3D wdt_max_duration;
>> +     watchdog_init_timeout(&orion_wdt, heartbeat, pdev->dev.of_node);
>
> Hi Fabio,
>
> There are many boards using pdata, !CONFIG_OF.  Have you compile-tested
> this without CONFIG_OF?

Hi Jason,

I've tested with and without the CONFIG_OF define.

The first time I=92ve used the kirkwood_defconfig without modifications,
the second time I=92ve enabled only the CONFIG_MACH_SHEEVAPLUG and
disabled USE_OF.

In both cases the orion_wdt driver compile without any warning.

Thanks for the review.

Best regards

> thx,
>
> Jason.
>
>>
>>       watchdog_set_nowayout(&orion_wdt, nowayout);
>>       ret =3D watchdog_register_device(&orion_wdt);
>> @@ -177,7 +175,7 @@ static int __devinit orion_wdt_probe(struct platform=
_device *pdev)
>>       }
>>
>>       pr_info("Initial timeout %d sec%s\n",
>> -             heartbeat, nowayout ? ", nowayout" : "");
>> +             orion_wdt.timeout, nowayout ? ", nowayout" : "");
>>       return 0;
>>  }
>>
>> --
>> 1.8.0
>>
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--
Fabio Porcedda
