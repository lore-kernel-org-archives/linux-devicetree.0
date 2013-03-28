From: Christian Daudt <csd_b-jCriFORwCPHYtjvyW6yDsg@public.gmane.org>
Subject: Re: [PATCH V7 1/2] ARM: bcm281xx: Add timer driver (driver portion)
Date: Thu, 28 Mar 2013 09:03:47 -0700
Message-ID: <CAGFynZ-8hQLLYuny6V6=9c+dqtAHs51BcH_wPb=k7WdY9FXS3Q@mail.gmail.com>
References: <1363210048-3334-1-git-send-email-csd@broadcom.com>
 <51410BF4.4040400@linaro.org>
 <alpine.LFD.2.02.1303140951580.22263@ionos>
 <201303141603.02401.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201303141603.02401.arnd-r2nGTMty4D4@public.gmane.org>
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
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Christian Daudt <csd-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 14, 2013 at 9:03 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Thursday 14 March 2013, Thomas Gleixner wrote:
>> > But if its arch specific for hardware I don't have, I'd really prefer the arch
>> > maintainer be the upstream path.
>> >
>> > Thomas: Am I being too obstinate here?  If not, should we drop "F:
>> > drivers/clocksource" from the MAINTAINERS entry?
>
> The idea of moving drivers out of arch/* into drivers/* is definitely to
> have someone who understands the subsystem act as the gatekeeper. There
> should be very little architecture specific knowledge in those drivers,
> and I think it's more important to ensure that they are following a
> sensible understanding of how timekeeping is done than that they
> are following specific architecture maintainer's preferences.
>
>> Maybe we should move the ARM specific ones into
>> drivers/clocksource/arm/ ?
>
> About half the IP blocks we use on ARM are also used on at least
> one ARM64/AVR32/MIPS/PowerPC/x86/SH/Hexagon/c6x/etc part. Grouping them
> by which CPU architecture first starts using them or happens to be
> more popular at the time does not seem too helpful here.
>
> Maybe it's better to have a subdirectory for those clock sources
> that are used on any SoC, or have subdirectories based on the
> company that created that part, as we do for ethernet drivers.
> I wouldn't bother with that until there are a couple of dozen
> different clock source drivers.

So it seems the (weak...) consensus is that it should go through the
clocksource tree. John, can you please apply the patch ?

 Thanks,
   csd
