From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v8] reset: Add driver for gpio-controlled reset pins
Date: Fri, 19 Jul 2013 11:23:30 +0800
Message-ID: <20130719032328.GB20889@S2101-09.ap.freescale.net>
References: <20130716015038.GD28375@S2101-09.ap.freescale.net>
 <51E4BF98.8030604@wwwdotorg.org>
 <20130716041056.GA30067@S2101-09.ap.freescale.net>
 <51E56AA7.7020103@wwwdotorg.org>
 <20130717030246.GA4541@S2101-09.ap.freescale.net>
 <51E6CCE4.20705@wwwdotorg.org>
 <20130717213836.GA13324@amd.pavel.ucw.cz>
 <51E719A6.6070105@wwwdotorg.org>
 <20130718112555.GB1021@amd.pavel.ucw.cz>
 <CAOesGMgi0j_mPyeBLVHb_QW+DwtAPoFY697eQO3-yp9tnP1vmA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOesGMgi0j_mPyeBLVHb_QW+DwtAPoFY697eQO3-yp9tnP1vmA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Len Brown <len.brown-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "Rafael J. Wysocki" <rjw-KKrjLPT3xs0@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 18, 2013 at 11:45:29AM -0700, Olof Johansson wrote:
> Hi,
> 
> On Thu, Jul 18, 2013 at 4:25 AM, Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org> wrote:
> 
> > It sound to me like keeping ammount of -EPROBE_DEFER to minimum is
> > still preferred.
> 
> Hand-crafting initcall level ordering of various drivers and subsystem
> is probably an even greater evil though. We've done it in the past,
> but now that we have deferred probe we have the option of not having
> to do it every time, such as this.
> 
> You're spending an awful lot of energy arguing over this, but nobody
> has actually shown data of how much deferral is happening -- and that
> it's a real problem. Until someone does so there's no reason to change
> it from the default module init level at all, I'd say.

On imx6qdl-sabreauto board, there are 3 MAX7310 units as IO expanders to
output 3 x 8 = 24 GPIOs.  18 of them are used for resets, enables and
pin steering for various peripherals on the board.

  BACKLITE_ON
  SAT_SHUTDN_B
  CPU_PER_RST_B
  MAIN_PER_RST_B
  IPOD_RST_B
  MLB_RST_B
  SSI_STEERING
  GPS_RST_B
  
  GPS_PWREN
  VIDEO_ADC_PWRDN_B
  ENET_CAN1_STEER
  EIMD30_BTUART3_STEER
  CAN_STBY
  CAN_EN
  USB_H1_PWR
  
  USB_OTG_PWR_ON
  SAT_RST_B
  NAND_BT_WIFI_STEER

Most of these GPIOs need to set up properly at client device driver's
probe stage - module_init() time.  So if we have all these service
providers resets/enables/steering API registered at module_init() too,
the probes of all these client device drivers stand a good chance to be
deferred.

Shawn
