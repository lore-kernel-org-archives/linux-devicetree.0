From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [PATCHv4] video: backlight: gpio-backlight: Add DT support.
Date: Tue, 22 Oct 2013 17:34:45 +0200
Message-ID: <20131022153445.GD17512@ns203013.ovh.net>
References: <20131019104555.GI18477@ns203013.ovh.net>
 <1382346813-8449-1-git-send-email-denis@eukrea.com>
 <20131022045833.GB17512@ns203013.ovh.net>
 <20131022072307.GA8681@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20131022072307.GA8681@ulmo.nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jingoo Han <jg1.han@samsung.com>, Sascha Hauer <kernel@pengutronix.de>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, Rob Herring <rob.herring@calxeda.com>, Denis Carikli <denis@eukrea.com>, Richard Purdie <rpurdie@rpsys.net>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Eric B??nard <eric@eukrea.com>, linux-arm-kernel@lists.infradead.org, Lothar Wa??mann <LW@KARO-electronics.de>
List-Id: devicetree@vger.kernel.org

On 09:23 Tue 22 Oct     , Thierry Reding wrote:
> On Tue, Oct 22, 2013 at 06:58:33AM +0200, Jean-Christophe PLAGNIOL-VILLAR=
D wrote:
> > On 11:13 Mon 21 Oct     , Denis Carikli wrote:
> > > Cc: Richard Purdie <rpurdie@rpsys.net>
> > > Cc: Jingoo Han <jg1.han@samsung.com>
> > > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Cc: Rob Herring <rob.herring@calxeda.com>
> > > Cc: Pawel Moll <pawel.moll@arm.com>
> > > Cc: Mark Rutland <mark.rutland@arm.com>
> > > Cc: Stephen Warren <swarren@wwwdotorg.org>
> > > Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
> > > Cc: devicetree@vger.kernel.org
> > > Cc: Sascha Hauer <kernel@pengutronix.de>
> > > Cc: linux-arm-kernel@lists.infradead.org
> > > Cc: Lothar Wa=DFmann <LW@KARO-electronics.de>
> > > Cc: Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>
> > > Cc: Eric B=E9nard <eric@eukrea.com>
> > > Signed-off-by: Denis Carikli <denis@eukrea.com>
> > > ---
> > > ChangeLog v3->v4:
> > > - The default-brightness property is now optional, it defaults to 1 i=
f not set.
> > by default we set OFF not ON
> > =

> > do not actiate driver or properti by default you can not known to conse=
quence
> > on the hw
> =

> Turning on a backlight by default is what pretty much every backlight
> driver does. I personally think that's the wrong default, I even tried
> to get some discussion started recently about how we could change this.
> However, given that this has been the case for possibly as long as the
> subsystem has existed, suddenly changing it might cause quite a few of
> our users to boot the new kernel and not see their display come up. As
> with any other ABI, this isn't something we can just change without a
> very good migration path.

I'm sorry but the blacklight descibe in DT have nothing to do with the comm=
on
pratice that the current driver have today

put on by default if wrong specially without the property define. Even put =
it
on by default it wrong as the bootloader may have set it already for splash
screen and to avoid glitch the drivers need to detect this.

For me this should not even be a property but handled by the driver them
selves in C.

Best Regards,
J.
> =

> In my opinion every backlight should be hooked up to a display panel,
> and the display panel driver should be the one responsible for turning
> the backlight on or off. That's the only way we can guarantee that the
> backlight is turned on at the right moment so that glitches can be
> avoided.
> =

> One possible migration path would be to update all display panel drivers
> to cope with an associated backlight device, but even if somebody would
> even find the time to write the code to do that, I can imagine that we'd
> have a hard time getting this tested since a lot of the boards that rely
> on these backlight drivers are legacy and probably no longer very
> actively used.
> =

> Thierry
