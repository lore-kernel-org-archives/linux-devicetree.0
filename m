From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/8] ARM: support for Moschip MCS814x SoCs
Date: Sat, 28 Jul 2012 00:42:06 +0200
Message-ID: <CACRpkdah3B95C0f7C78E65mWWc7+5VE__ByFQ+vFBv6BA=LKRg@mail.gmail.com>
References: <1342363754-30808-1-git-send-email-florian@openwrt.org>
 <1342363754-30808-2-git-send-email-florian@openwrt.org>
 <20120716142941.666d928c@skate> <6220407.M8CZZfZu0N@bender>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <6220407.M8CZZfZu0N@bender>
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
To: Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 23, 2012 at 9:11 PM, Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org> wrote:

> [Thomas P]
>> I am surprised that this doesn't use the clocksource and clockevents
>> infrastructure. It probably should, and be implemented in
>> drivers/clocksource/.
>
> This may sound like a stupid question, but the big constraint with this SoC is
> that the timers do not reload themselves, and so far, I did not find out how I
> can handle this properly with a clocksource. I suppose that it should not be a
> big problem for the clockevent device however.
>
> Has anyone any example of such particular case?

Gah what horror.

So you don't have *anything* in your platform which is really
continous and sufficiently fast?

Then try to get an IRQ to rearm and retrigger the timer to fire
itself whenever it reloads and pray this doesn't add a skew too much.
Bonus if you can use the NMI for this :-/

Yours,
Linus Walleij
