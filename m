From: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH RFC 0/3] clk: dt: bindings for mux & divider clocks
Date: Fri, 07 Jun 2013 10:52:54 -0700
Message-ID: <20130607175254.10233.7661@quantum>
References: <1370281990-15090-1-git-send-email-mturquette@linaro.org>
 <20130607055128.GA20780@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130607055128.GA20780-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
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
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Quoting Shawn Guo (2013-06-06 22:51:31)
> Mike,
> 
> On Mon, Jun 03, 2013 at 10:53:07AM -0700, Mike Turquette wrote:
> > I am using this code while converting the OMAP4 clock data over to DT
> 
> I see these basic clk bindings can be useful for platforms that have
> a relatively simple clock tree, but I'm a little surprised that you plan
> to move OMAP4 to it.  I'm wondering how many nodes you will have to add
> to OMAP4 device tree.  For imx6q example, it means ~200 nodes addition
> to device tree, which is obviously a bloating of device tree.
> 

Yes, there was a time when I was firmly against doing such a thing.
However I'm not sure it is so bad now.  More and more SoCs are going to
keep getting merged into the kernel and that just means more and more
clock data.  Perhaps DT is best suited to handle this bloat.  I broke
the clock data out into a separate file so that it didn't overwhelm the
existing omap4.dtsi.

Either way I marked this series as RFC precisely due to your point.  I
want feedback on how the OMAP folks feel about this.  So far no has has
NACKed it ;-)

Regards,
Mike

> Shawn
> 
> > and some common boilerplate code can be factored out of several clock
> > drivers if this is merged.
