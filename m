From: Fabio Porcedda <fabio.porcedda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v7 0/6] watchdog: dt: add support for the timeout-sec dt
 property
Date: Thu, 31 Jan 2013 12:24:46 +0100
Message-ID: <CAHkwnC-mLG9mehc8eRwEZGf1o8S7x16abtjoZLZTCmJ+UZYgMw@mail.gmail.com>
References: <1357639455-21935-1-git-send-email-fabio.porcedda@gmail.com>
 <20130108153447.GC7360@game.jcrosoft.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130108153447.GC7360-RQcB7r2h9QmfDR2tN2SG5Ni2O/JbrIOy@public.gmane.org>
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
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 8, 2013 at 4:34 PM, Jean-Christophe PLAGNIOL-VILLARD
<plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org> wrote:
> On 11:04 Tue 08 Jan     , Fabio Porcedda wrote:
>> Hi all,
>> this patchset add the timeout-sec property to the watchdog core,
>> to the at91sam9_wdt driver and on all framework enabled watchdog driver
>> with dt support.
>> The at91sam9_wdt is tested on evk-pr3,
>> the other drivers are compile tested only.
>>
>
> I'll prefer a macro to abstract the string in every driver

I know but Rob Herring dislikes that macro/function. I had to remove that part.

> except this fine by me

On Fri, Dec 21, 2012 at 12:32 PM, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org> wrote:
>> Ping.
>>
>> The dependency is already merged.
>
> Will not be for this merge window. Will review next week.

Hi Wim,

Ping.

Best regards
Fabio Porcedda

> Best Regards,
> J.
>
>> Best regards
>> Fabio Porcedda
>>
>> changes:
>> v7:
>>   - rebase over v3.8-rc2
>>   - remove the patch already merged
>> v6:
>>   - remove patch for function of_get_timeout_sec as aked by Rob Herring
>>   - add Acked-by: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
>>   - add Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
>> v5:
>>   - fix codestyle for compilance ti checkpatch.pl about
>>     "ERROR: do not initialise statics to 0 or NULL"
>>     for s3c2410_wdt.c:56 and at91sam9_wdt.c:63
>> v4:
>>   - add of_get_timeout_sec
>>   - add s3c2410_wdt driver
>>   - split driver patch
>>   - fixed watchdog_init_timeout handling of min_timeout and max_timeout
>> v3:
>>   - rename watchdog_probe_dt_timeout ->  watchdog_init_timeout
>>   - move the watchdog_init_timeout function from inline to watchdog_core.c
>>   - add timeout parameter handling code to watchdog_init_timeout
>>   - add timeout-sec property to the pnx4008-wdt driver
>>   - add two small commit for fixup and cleanup
>> v2:
>>   - change "timeout" to "timeout-sec" as asked by Jean-Christophe
>>   - at91sam9_wdt: use the new helper function
>>   - at91sam9_wdt: add bounds checking
>>   - watchdog.h: add bounds checking
>>
>> Fabio Porcedda (6):
>>   watchdog: core: dt: add support for the timeout-sec dt property
>>   watchdog: orion_wdt: add timeout-sec property binding
>>   watchdog: pnx4008: add timeout-sec property binding
>>   watchdog: s3c2410_wdt: add timeout-sec property binding
>>   watchdog: at91sam9_wdt: add timeout-sec property binding
>>   watchdog: orion_wdt: move the min_timeout initialization
>>
>>  .../devicetree/bindings/watchdog/atmel-wdt.txt     |  4 +++
>>  .../devicetree/bindings/watchdog/marvel.txt        |  5 +++
>>  .../devicetree/bindings/watchdog/pnx4008-wdt.txt   |  4 +++
>>  .../devicetree/bindings/watchdog/samsung-wdt.txt   |  3 ++
>>  Documentation/watchdog/watchdog-kernel-api.txt     | 10 ++++++
>>  drivers/watchdog/Kconfig                           |  1 +
>>  drivers/watchdog/at91sam9_wdt.c                    | 16 ++++++++--
>>  drivers/watchdog/orion_wdt.c                       | 10 +++---
>>  drivers/watchdog/pnx4008_wdt.c                     |  7 ++--
>>  drivers/watchdog/s3c2410_wdt.c                     |  6 ++--
>>  drivers/watchdog/watchdog_core.c                   | 37 ++++++++++++++++++++++
>>  include/linux/watchdog.h                           |  3 ++
>>  12 files changed, 91 insertions(+), 15 deletions(-)
>>
>> --
>> 1.8.0.3
>>



--
Fabio Porcedda
