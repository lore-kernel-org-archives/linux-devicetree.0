From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [GIT PULL v4] ARM: kirkwood: fdt conversion progress
Date: Thu, 8 Mar 2012 09:53:06 -0800
Message-ID: <CAOesGMikpxMd+MtnjKix7D0KiHD+e8s2YFjB3j9a=7i7S9J+0g@mail.gmail.com>
References: <20120307221012.GH5050@titan.lakedaemon.net>
 <201203081610.21493.arnd@arndb.de>
 <CAOesGMh2etdQSOjktDGcWGfnsMhyFnVuebWRQeYuR6fvm1_DSA@mail.gmail.com>
 <20120308173029.GK5050@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120308173029.GK5050-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jason <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, michael-QKn5cuLxLXY@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, Mar 8, 2012 at 9:30 AM, Jason <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org> wrote:
> On Thu, Mar 08, 2012 at 09:15:08AM -0800, Olof Johansson wrote:
>> Hi,
>>
>> On Thu, Mar 8, 2012 at 8:10 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
>> > On Wednesday 07 March 2012, Jason Cooper wrote:
>> >> The following changes since commit d65b4e98d7ea3038b767b70fe8be959b29=
13f16d:
>> >>
>> >> =A0 Linux 3.3-rc3 (2012-02-08 19:21:53 -0800)
>> >>
>> >> are available in the git repository at:
>> >> =A0 git://git.infradead.org/users/jcooper/linux-kirkwood.git kirkwood=
_dt
>> >>
>> >> ---
>> >> Arnd,
>> >>
>> >> My first two should match up with what you have already, the only
>> >> outlier is that Jean-Christophe's patch is needed, but I don't think
>> >> everyone agrees on it yet.
>> >>
>> >
>> > Right now, Olof is handling the pull requests. I would suggest that he
>> > can use your branch to replace the current staging branch but still ke=
ep
>> > it in staging until everyone agrees or you replace it with a better ve=
rsion.
>>
>> Jason,
>>
>> Looking at the new pull request I see some differences in device
>> support. For example, the DT conversion of orion-spi and wdt is not in
>> the new branch.
>>
>> Is that intentional? If not I'll hold off replacing your branch.
>
> Yes, Andrew Lunn is working on adding common clock support to
> plat-orion, which mach-kirkwood depends on. =A0So, I'm holding off on
> changes to drivers which get passed tclk. =A0Once Andrew's clock code is
> up, then I'll add fdt support to it and re-introduce those driver
> changes.
>
> clock gating is a separate issue that is further down the road.
>
> Basically, we're trying to avoid merge conflicts. =A0:-)

Ok, great. I'll replace the branch then.

> The following patches should be fine to merge into stable (for 3.4):
>
> af42511 ARM: orion: spi: remove enable_clock_fix which is not used
> d93b2ca ARM: Kirkwood: Remove tclk from kirkwood_asoc_platform_data.
> 2bb9207 ARM: kirkwood: fdt: use mrvl ticker symbol
> ec0ec68 ARM: kirkwood: fdt: absorb kirkwood_init()
> ...
> b5c25c3 ARM: kirkwood: rtc-mv devicetree bindings
> 5e40593 ARM: kirkwood: use devicetree for rtc-mv
> ...

Excellent. Can you build up one or more stable branches that I can
pull those from?

> I'm still working on the interrupt controller and dma. =A0orion-ehci,
> mv_cesa and sata_mv depend on one or both of those to work.

Cool.


-Olof
