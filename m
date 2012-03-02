From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 6/6] ARM: at91: add Shutdown Controller (SHDWC) DT support
Date: Fri, 2 Mar 2012 20:24:19 +0000
Message-ID: <201203022024.19488.arnd@arndb.de>
References: <20120302192844.GB21255@game.jcrosoft.org>
 <1330718048-9314-6-git-send-email-plagnioj@jcrosoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1330718048-9314-6-git-send-email-plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday 02 March 2012, Jean-Christophe PLAGNIOL-VILLARD wrote:
> +       }
> +
> +       if (of_device_is_compatible(np, "atmel,at91sam9x5-shdwc")) {
> +               have_rtt = false;
> +               have_rtc = true;
> +       } else if (of_device_is_compatible(np, "atmel,at91sam9rl-shdwc")) {
> +               have_rtt = true;
> +               have_rtc = true;
> +       } else {
> +               have_rtt = true;
> +               have_rtc = false;
> +       }
> +
> +       if (have_rtc && of_property_read_bool(np, "atmel,wakeup-rtc-timer"))
> +                       mode |= AT91_SHDW_RTCWKEN;
> +
> +       if (have_rtt && of_property_read_bool(np, "atmel,wakeup-rtt-timer"))
> +                       mode |= AT91_SHDW_RTTWKEN;
> +
> +       at91_shdwc_write(AT91_SHDW_MR, wakeup_mode | mode);
> +

Hi Jean-Christophe,

I don't understand why you check the specific part here. Isn't it enough to
check the property when you already mandate that they can only be present
on devices that support the specific wakeup?

If there is a good explanation for that, maybe add a code comment why it's
required.

	Arnd
