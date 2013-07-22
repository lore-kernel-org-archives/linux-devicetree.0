From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH v8] reset: Add driver for gpio-controlled reset pins
Date: Mon, 22 Jul 2013 15:47:35 +0800
Message-ID: <20130722074733.GA20271@S2101-09.ap.freescale.net>
References: <20130716041056.GA30067@S2101-09.ap.freescale.net>
 <51E56AA7.7020103@wwwdotorg.org>
 <20130717030246.GA4541@S2101-09.ap.freescale.net>
 <51E6CCE4.20705@wwwdotorg.org>
 <20130717213836.GA13324@amd.pavel.ucw.cz>
 <51E719A6.6070105@wwwdotorg.org>
 <20130718112555.GB1021@amd.pavel.ucw.cz>
 <CAOesGMgi0j_mPyeBLVHb_QW+DwtAPoFY697eQO3-yp9tnP1vmA@mail.gmail.com>
 <20130719032328.GB20889@S2101-09.ap.freescale.net>
 <51E95F10.5070006@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <51E95F10.5070006@wwwdotorg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Marek Vasut <marex@denx.de>, Fabio Estevam <fabio.estevam@freescale.com>, Mike Turquette <mturquette@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Len Brown <len.brown@intel.com>, Pavel Machek <pavel@denx.de>, Sascha Hauer <s.hauer@pengutronix.de>, Grant Likely <grant.likely@secretlab.ca>, "Rafael J. Wysocki" <rjw@sisk.pl>, Philipp Zabel <p.zabel@pengutronix.de>, Olof Johansson <olof@lixom.net>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 19, 2013 at 09:45:20AM -0600, Stephen Warren wrote:
> That sounds like it /could/ well be an issue. Do you have all that
> actually hooked up through device tree so you can demonstrate the amount
> of deferred probing that /actually/ happens though?
> 
> In order to push the probe order in the right direction, I would
> personally prefer to see some kind of explicit hinting or outright
> representation of probe order in the DT.

I do not have a kernel supporting all those devices yet.

Shawn
