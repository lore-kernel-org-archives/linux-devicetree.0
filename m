From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 6/6] ARM: at91: add Shutdown Controller (SHDWC) DT support
Date: Wed, 7 Mar 2012 18:49:36 +0000
Message-ID: <201203071849.36867.arnd@arndb.de>
References: <20120302192844.GB21255@game.jcrosoft.org>
 <201203022024.19488.arnd@arndb.de> <20120307173828.GD17087@game.jcrosoft.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20120307173828.GD17087@game.jcrosoft.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Cc: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wednesday 07 March 2012, Jean-Christophe PLAGNIOL-VILLARD wrote:
> On 20:24 Fri 02 Mar     , Arnd Bergmann wrote:
> > On Friday 02 March 2012, Jean-Christophe PLAGNIOL-VILLARD wrote:
> > > +       }
> > > +
> > > +       if (of_device_is_compatible(np, "atmel,at91sam9x5-shdwc")) {
> > > +               have_rtt = false;
> > > +               have_rtc = true;
> > > +       } else if (of_device_is_compatible(np, "atmel,at91sam9rl-shdwc")) {
> > > +               have_rtt = true;
> > > +               have_rtc = true;
> > > +       } else {
> > > +               have_rtt = true;
> > > +               have_rtc = false;
> > > +       }
> > > +
> > > +       if (have_rtc && of_property_read_bool(np, "atmel,wakeup-rtc-timer"))
> > > +                       mode |= AT91_SHDW_RTCWKEN;
> > > +
> > > +       if (have_rtt && of_property_read_bool(np, "atmel,wakeup-rtt-timer"))
> > > +                       mode |= AT91_SHDW_RTTWKEN;
> > > +
> > > +       at91_shdwc_write(AT91_SHDW_MR, wakeup_mode | mode);
> > > +
> > 
> > Hi Jean-Christophe,
> > 
> > I don't understand why you check the specific part here. Isn't it enough to
> > check the property when you already mandate that they can only be present
> > on devices that support the specific wakeup?
> > 
> > If there is a good explanation for that, maybe add a code comment why it's
> > required.
> some wake update source exist on few soc and we are not supposed to set the
> bit otherwise
> 

I still don't understand: Doesn't the property already give the information?
In general, you should try to encode these things in specific properties instead of
checking the compatible property.

	Arnd
