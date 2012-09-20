From: Fabio Porcedda <fabio.porcedda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] ARM: at91: add at91sam9_wdt driver to at91sam9260
Date: Thu, 20 Sep 2012 12:19:26 +0200
Message-ID: <CAHkwnC8csOuYMVkO2cfgmcVdfm5uYtZ82ibFC-RfMLL8-dynmw@mail.gmail.com>
References: <1348055861-7857-1-git-send-email-fabio.porcedda@gmail.com>
 <1348055861-7857-3-git-send-email-fabio.porcedda@gmail.com>
 <20120920052928.GE17667@game.jcrosoft.org>
 <CAHkwnC9jqUmb+AGCnxV9QeSv=5JjS4+AWnutkm6TZPJJRcxGAA@mail.gmail.com>
 <20120920100724.GF17667@game.jcrosoft.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120920100724.GF17667-RQcB7r2h9QmfDR2tN2SG5Ni2O/JbrIOy@public.gmane.org>
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
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 20, 2012 at 12:07 PM, Jean-Christophe PLAGNIOL-VILLARD
<plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org> wrote:
> On 09:52 Thu 20 Sep     , Fabio Porcedda wrote:
>> Hi Jean-Christophe,
>>
>> On Thu, Sep 20, 2012 at 7:29 AM, Jean-Christophe PLAGNIOL-VILLARD
>> <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org> wrote:
>> > On 13:57 Wed 19 Sep     , Fabio Porcedda wrote:
>> >> Tested on an at91sam9260 board (evk-pro3)
>> >>
>> >> Signed-off-by: Fabio Porcedda <fabio.porcedda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> >> ---
>> >>  arch/arm/boot/dts/at91sam9260.dtsi | 6 ++++++
>> >>  1 file changed, 6 insertions(+)
>> >>
>> >> diff --git a/arch/arm/boot/dts/at91sam9260.dtsi b/arch/arm/boot/dts/at91sam9260.dtsi
>> >> index 66389c1..680b1c8 100644
>> >> --- a/arch/arm/boot/dts/at91sam9260.dtsi
>> >> +++ b/arch/arm/boot/dts/at91sam9260.dtsi
>> >> @@ -233,6 +233,12 @@
>> >>                                       trigger-external;
>> >>                               };
>> >>                       };
>> >> +
>> >> +                     watchdog@fffffd40 {
>> > disable dy default
>>
>> All the others watchdog drivers in arch/arm/boot/dts/* are enabled by default.
>> IMHO the watchdog driver it's like the "rtstc" and "shdwc" driver,
>> they are safe to be enabled by default.
>> I'm missing something?
> no the other watchdog will not reset if not managed
>
> this one will
>
> so I'm not confortable by enabling it by default

Ok, i will send an updated patch.

Thanks for the review
-- 
Fabio Porcedda
