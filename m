From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH] ARM: dts: mvebu: add ethernet to the cm-a510 board
Date: Fri, 6 Feb 2015 10:48:48 +0000
Message-ID: <20150206104848.GW8656@n2100.arm.linux.org.uk>
References: <54CB5267.5060004@gmail.com>
 <20150130113118.5523ed68@armhf>
 <54CB6440.1010002@gmail.com>
 <20150130124144.501cf81d@armhf>
 <54CB732F.7010409@gmail.com>
 <20150130133913.083d1ade@armhf>
 <54CB7E33.3080909@gmail.com>
 <54CE354F.5090106@gmail.com>
 <54D3EB26.9020909@gmail.com>
 <20150206085855.7b8d494b@armhf>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150206085855.7b8d494b@armhf>
Sender: linux-kernel-owner@vger.kernel.org
To: Jean-Francois Moine <moinejf@free.fr>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gabriel Dobato <dobatog@gmail.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 06, 2015 at 08:58:55AM +0100, Jean-Francois Moine wrote:
> On Thu, 05 Feb 2015 23:13:58 +0100
> Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com> wrote:
> 
> > > At this moment, I am trying to configure the framebuffer, but as Moine
> > > told me,it seems there is not video driver support for this board in
> > > DT... :( .  
> > 
> > Not quite true. Video is made up of at least 4 different devices:
> > Framebuffer, GPU, Decode engine, and usually DVI/HDMI transmitter or
> > VGA.
> > 
> > We do have a driver for the framebuffer (armada_drm) and there is great
> > work from Russell King and others on the GPU and Decode engine (IIRC).
> 
> Yes, but it has no DT support. Mine has.

It has partial DT support.  I'm currently waiting for a production Cubox
from SolidRun (Jon Nettleton recently went to Israel, and he and Rabeeh
located one - it's currently with Jon, waiting for him to be well enough
to dispatch it to me.)  Maybe that will put an end to my HDMI problems
with DT kernels.

Until then, I've no interest in DT kernels on Dove hardware; they're
basically not functional for me.

> From my previous tests with the si5351 in the Cubox, most video modes
> should work without external clocks.

Jean, let's put this into perspective.

Different HDMI sinks have different tolerances on the video timing
parameters.  Some HDMI sinks (such as monitors) accept almost any
timing.  Other sinks (such as TVs) are much stricter.

Just because it works for you without using the SI5351 does not make
it a correct implementation.  It probably means that you have a HDMI
sink that will accept wildly wrong timing but still display the image.
Other HDMI sinks may decide to ignore such a wrong signal (and many
seem to.)

You've more or less proved that by your investigations into what your
HDMI sink will accept for audio (which is basically anything) which,
again, is not the general rule.

Taking your case and trying to make believe that it applies everywhere
is wholely wrong.

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
