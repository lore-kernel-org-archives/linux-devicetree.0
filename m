From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [PATCH v2 2/2] ARM: at91: add at91sam9_wdt driver to at91sam9260
Date: Thu, 20 Sep 2012 12:07:24 +0200
Message-ID: <20120920100724.GF17667@game.jcrosoft.org>
References: <1348055861-7857-1-git-send-email-fabio.porcedda@gmail.com>
 <1348055861-7857-3-git-send-email-fabio.porcedda@gmail.com>
 <20120920052928.GE17667@game.jcrosoft.org>
 <CAHkwnC9jqUmb+AGCnxV9QeSv=5JjS4+AWnutkm6TZPJJRcxGAA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAHkwnC9jqUmb+AGCnxV9QeSv=5JjS4+AWnutkm6TZPJJRcxGAA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Russell King <linux@arm.linux.org.uk>, linux-watchdog@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Nicolas Ferre <nicolas.ferre@atmel.com>, Wim Van Sebroeck <wim@iguana.be>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 09:52 Thu 20 Sep     , Fabio Porcedda wrote:
> Hi Jean-Christophe,
> 
> On Thu, Sep 20, 2012 at 7:29 AM, Jean-Christophe PLAGNIOL-VILLARD
> <plagnioj@jcrosoft.com> wrote:
> > On 13:57 Wed 19 Sep     , Fabio Porcedda wrote:
> >> Tested on an at91sam9260 board (evk-pro3)
> >>
> >> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> >> ---
> >>  arch/arm/boot/dts/at91sam9260.dtsi | 6 ++++++
> >>  1 file changed, 6 insertions(+)
> >>
> >> diff --git a/arch/arm/boot/dts/at91sam9260.dtsi b/arch/arm/boot/dts/at91sam9260.dtsi
> >> index 66389c1..680b1c8 100644
> >> --- a/arch/arm/boot/dts/at91sam9260.dtsi
> >> +++ b/arch/arm/boot/dts/at91sam9260.dtsi
> >> @@ -233,6 +233,12 @@
> >>                                       trigger-external;
> >>                               };
> >>                       };
> >> +
> >> +                     watchdog@fffffd40 {
> > disable dy default
> 
> All the others watchdog drivers in arch/arm/boot/dts/* are enabled by default.
> IMHO the watchdog driver it's like the "rtstc" and "shdwc" driver,
> they are safe to be enabled by default.
> I'm missing something?
no the other watchdog will not reset if not managed

this one will

so I'm not confortable by enabling it by default

Best Regards,
J.
