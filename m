From: "Turquette, Mike" <mturquette-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 1/8] ARM: support for Moschip MCS814x SoCs
Date: Mon, 16 Jul 2012 13:47:01 -0700
Message-ID: <CAJOA=zNEywZ6tbJDuLjekVQeJpr9O2X1u-sTXpp0GYWzc+OHig@mail.gmail.com>
References: <1342363754-30808-1-git-send-email-florian@openwrt.org>
 <1342363754-30808-2-git-send-email-florian@openwrt.org>
 <201207161554.04812.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201207161554.04812.arnd-r2nGTMty4D4@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 16, 2012 at 8:54 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Sunday 15 July 2012, Florian Fainelli wrote:
>
>> diff --git a/arch/arm/mach-mcs814x/Kconfig b/arch/arm/mach-mcs814x/Kconfig
>> new file mode 100644
>> index 0000000..c89422f
>> --- /dev/null
>> +++ b/arch/arm/mach-mcs814x/Kconfig
>> @@ -0,0 +1,11 @@
>> +if ARCH_MCS814X
>> +
>> +config MCS8140
>> +     select CPU_ARM926T
>> +     bool
>> +
>> +menu "Moschip MCS8140 boards"
>> +
>> +endmenu
>> +
>> +endif
>
> What values does the Kconfig file actually provide? I see that you are
> adding the boards here later, but I think it would be nice to just
> make the new platform a single Kconfig option with no individual
> board selection.
>
>> +struct clk {
>> +     struct clk *parent;             /* parent clk */
>> +     unsigned long rate;             /* clock rate in Hz */
>> +     unsigned long divider;          /* clock divider */
>> +     u32 usecount;                   /* reference count */
>> +     struct clk_ops *ops;            /* clock operation */
>> +     u32 enable_reg;                 /* clock enable register */
>> +     u32 enable_mask;                /* clock enable mask */
>> +};
>
> Platforms are now converting to the common clock framework in drivers/clk.
> Mike Turquette as the subsystem maintainer can probably judge better whether
> we should still be allowing new platforms with their own implementation
> of clk, but my feeling is that you should use the subsystem instead
> and add a driver in a subdirectory of drivers/clk instead of in the
> platform.

Hi Florian & Arnd,

Adopting the new clock framework is highly preferable, especially if
MCS814x support is being delayed until 3.7.  There is also a push to
put clock drivers into drivers/clk and I would like to continue that
trend, but I'm less strict on that measure if it proves very difficult
for your platform immediately (e.g. duplicating headers across
platform and generic code, etc).  Migrating code from arch/arm to
drivers/clk can always be done in a future series.

This platform also seems to be making use of DT so it would be very
nice if we use MCS814x to push the state of clk DT bindings and
adoption forward a bit.  There are not a lot of folks using the
patches from Rob/Grant today.  Hopefully delaying these patches by
another merge cycle means that these requests are not asking too much
:-)

Regards,
Mike
