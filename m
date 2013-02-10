From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH] cpuidle: kirkwood: Move out of mach directory, add DT.
Date: Sun, 10 Feb 2013 19:58:12 +0100
Message-ID: <20130210185812.GI20212@lunn.ch>
References: <1356698844-4220-1-git-send-email-andrew@lunn.ch>
 <20130208213441.014343E2C27@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130208213441.014343E2C27@localhost>
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
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, len.brown-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, rafael.j.wysocki-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> > +* QNAP Power Off
> > +
> > +QNAP NAS devices have a microcontroller controlling the main power
> > +supply. This microcontroller is connected to UART1 of the Kirkwood and
> > +Orion5x SoCs. Sending the charactor 'A', at 19200 baud, tells the
> > +microcontroller to turn the power off. This driver adds a handler to
> > +pm_power_off which is called to turn the power off.
> > +
> > +Required Properties:
> > +- compatibile: Should be "qnap,power-off"
> 
> It would do well to have the model number embedded into this compatible
> string since it is unlikely that every single QNAP device will use the
> same controller interface.

Hi Grant

All QNAP devices known to mainline use this same controller interface.

So that would be ts109, ts209, ts409, ts119, ts219, ts419, plus a few
other models which we don't differentiate, like ts219P and ts219P+.

Any suggestions what to use in the compatible string?

    Thanks
	Andrew
