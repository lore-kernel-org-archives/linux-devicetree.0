From: Anton Vorontsov <anton@enomsg.org>
Subject: Re: [Patch V5] drivers: power: Add support for bq24735 charger
Date: Fri, 25 Oct 2013 15:55:48 -0700
Message-ID: <20131025225548.GA6095@teo>
References: <1381526143-20800-1-git-send-email-rklein@nvidia.com>
 <525C361C.1020703@wwwdotorg.org>
 <525C376A.3000009@nvidia.com>
 <525C3A9A.5000207@wwwdotorg.org>
 <20131025224841.GB1157@teo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20131025224841.GB1157@teo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Rhyland Klein <rklein@nvidia.com>, David Woodhouse <dwmw2@infradead.org>, Darbha Sriharsha <dsriharsha@nvidia.com>, Manish Badarkha <badarkhe.manish@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <Mark.Rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 25, 2013 at 03:48:41PM -0700, Anton Vorontsov wrote:
> On Mon, Oct 14, 2013 at 12:40:26PM -0600, Stephen Warren wrote:
> > >>> diff --git a/Documentation/devicetree/bindings/power_supply/ti,bq24735.txt b/Documentation/devicetree/bindings/power_supply/ti,bq24735.txt
> > >>
> > >>> +Optional properties :
> > >>
> > >>> + - ti,ac-detect-gpios : This GPIO is optionally used to read the AC adapter
> > >>> +   presence.
> > >>
> > >> Is that actually a property of the BQ24735 chip itself (i.e. is it an
> > >> output signal from the chip), or part of the board/system?
> > > 
> > > The gpio itself is actually what the IRQ line is tied to from the
> > > bq24735 -> tegra (in this case). In other words this is a Host GPIO that
> > > is configured as an input and connected to the bq24735.
> > 
> > Ok, so this is the ACOK output pin? In that case, it's fine. It might be
> > worth mentioning that explicitly though.
> 
> I added the comment to the documentation and applied the patch with a
> "Thanks-to: Stephen Warren <swarren@wwwdotorg.org>" tag. :)

Oh, and as well as

Thanks-to: Thierry Reding <thierry.reding@gmail.com>

(People seem to review drivers, but do not give their Reviewed-by tags, so
the thanks tag is the best thing I can legally do in such a case.)

Thanks,

Anton
