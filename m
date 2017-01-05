From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [PATCH 1/5] ARM: dts: armada388-clearfog: add phy reset gpio-hog
Date: Thu, 5 Jan 2017 10:31:35 +0000
Message-ID: <20170105103134.GS14217@n2100.armlinux.org.uk>
References: <E1cO4UH-0008SR-GW@rmk-PC.armlinux.org.uk>
 <E1cO4Vz-00005t-8n@rmk-PC.armlinux.org.uk>
 <871swig5b3.fsf@free-electrons.com>
 <20170105101620.GR14217@n2100.armlinux.org.uk>
 <87zij5dckj.fsf@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <87zij5dckj.fsf@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 05, 2017 at 11:29:48AM +0100, Gregory CLEMENT wrote:
> Hi Russell King,
>  
>  On jeu., janv. 05 2017, Russell King - ARM Linux <linux@armlinux.org.uk> wrote:
> 
> > On Wed, Jan 04, 2017 at 05:26:08PM +0100, Gregory CLEMENT wrote:
> >> Hi Russell,
> >>  
> >>  On lun., janv. 02 2017, Russell King <rmk+kernel@armlinux.org.uk> wrote:
> >> 
> >> 
> >> It would be nice to have some word here about this patch. Especially why
> >> we need it now. I guess it is for being less dependent on the
> >> initialization done by the bootloader but maybe you have other reasons.
> >
> > I'm not sure I follow.  This is adding it to the new platform, not the
> > old one.  I guess I should've rolled this into the patch creating the
> > clearfog-base dts file, and this question wouldn't have come up.
> >
> 
> Indeed I missed the fact that it was on the new board as all the other
> patches were related to the common part.
> 
> Do you agree that I squash this patch into the "ARM: dts:
> armada388-clearfog: add base model DTS file" patch?

Yep, thanks.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
