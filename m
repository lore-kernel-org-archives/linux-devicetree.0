From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [PATCH v5 2/3] drm/arm: Add support for Mali Display Processors
Date: Wed, 15 Jun 2016 21:11:16 +0100
Message-ID: <20160615201116.GI1041@n2100.armlinux.org.uk>
References: <1466002295-24813-1-git-send-email-Liviu.Dudau@arm.com>
 <1466002295-24813-3-git-send-email-Liviu.Dudau@arm.com>
 <20160615152309.GI1338@phenom.ffwll.local>
 <20160615161758.GF9711@e106497-lin.cambridge.arm.com>
 <CAKMK7uENW3cU8LccHcqffX3cbzax2-5mzY0101yLfR7vtD4CoA@mail.gmail.com>
 <20160615172104.GI9711@e106497-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20160615172104.GI9711@e106497-lin.cambridge.arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Liviu Dudau <Liviu.Dudau@arm.com>
Cc: devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>, LKML <linux-kernel@vger.kernel.org>, DRI devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, David Brown <David.Brown@arm.com>, Brian Starkey <brian.starkey@arm.com>, LAKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 15, 2016 at 06:21:04PM +0100, Liviu Dudau wrote:
> Could be the tda998x_drv fault, but I'm getting this splat:
> 
> [    1.347687] kobject_add_internal failed for card0-HDMI-A-1 (error: -2 parent: card0)

Right, so this is -ENOENT - I expect that it's complaining that the
parent does not exist before a child is attempted to be added.

Hopefully, this isn't with -rc kernels, but is with -next.  I think
some folk need to Cc me with patches to tda998x, or at least talk to
me about what's changed in DRM so that tda998x can get fixed.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
