From: "Liviu.Dudau@arm.com" <Liviu.Dudau@arm.com>
Subject: Re: [PATCH] drm/arcpgu: Get rid of "encoder-slave" property
Date: Wed, 29 Mar 2017 14:48:04 +0100
Message-ID: <20170329134804.GA13355@e110455-lin.cambridge.arm.com>
References: <1488554364-25579-1-git-send-email-abrodkin@synopsys.com>
 <20170303162837.GO917@e110455-lin.cambridge.arm.com>
 <1488563298.2940.33.camel@synopsys.com>
 <20170303182102.GP917@e110455-lin.cambridge.arm.com>
 <1490794439.7754.88.camel@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1490794439.7754.88.camel@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: "robh@kernel.org" <robh@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "airlied@linux.ie" <airlied@linux.ie>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 29, 2017 at 01:34:00PM +0000, Alexey Brodkin wrote:
> Hi Liviu, Rob,

Hi Alexey,

> 
> On Fri, 2017-03-03 at 18:21 +0000, Liviu.Dudau@arm.com wrote:
> > On Fri, Mar 03, 2017 at 05:48:19PM +0000, Alexey Brodkin wrote:
> > > 
> > > Hi Liviu,
> > > 
> > > On Fri, 2017-03-03 at 16:28 +0000, Liviu Dudau wrote:
> > > > 
> > > > On Fri, Mar 03, 2017 at 06:19:24PM +0300, Alexey Brodkin wrote:
> > > > > 
> > > > > 
> > > > > -	/* find the encoder node and initialize it */
> > > > > -	encoder_node = of_parse_phandle(drm->dev->of_node, "encoder-slave", 0);
> > > > > -	if (encoder_node) {
> > > > > -		ret = arcpgu_drm_hdmi_init(drm, encoder_node);
> > > > > -		of_node_put(encoder_node);
> > > > > +	/* There is only one output port inside each device, find it */
> > > > > +	port = of_graph_get_next_endpoint(pdev->dev.of_node, NULL);
> > > > > +
> > > > > +	if (port) {
> > > > > +		if (of_device_is_available(port))
> > > > > +			encoder = of_graph_get_remote_port_parent(port);
> > > > > +		of_node_put(port);
> > > > > +	}
> > > > 
> > > > You must've been looking at some old version. Current version in -next uses
> > > > of_graph_get_remote_node() to replace all those lines you have added (see Rob
> > > > Herring's series to introduce of_graph_get_remote_node() function)
> > > 
> > > Hm, I'm not on Linus' master tree [1] and so I thought I was quite up to date :)
> > > Still I made a check of linux-next and don't see any changes in
> > > "drivers/gpu/drm/arm" compared to Linus' tree.
> > > 
> > > [1] https://urldefense.proofpoint.com/v2/url?u=http-3A__git.kernel.org_cgit_linux_kernel_git_torvalds_linux.git_commit_drivers_gpu_drm_arm-3Fid-3D
> > > e4563f6ba71792c77aeccb2092cc23149b44e642&d=DwIDaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=SI66ngnnXy33ncb8m5H4La2
> > > T1SzSEiiP7hc_XsRahEc&s=uaswjVXcjYDrUosOkO_UpTMqJMWTT-LLPrg5JE6-t-8&e= 
> > > [2] https://urldefense.proofpoint.com/v2/url?u=http-3A__git.kernel.org_cgit_linux_kernel_git_next_linux-2Dnext.git_commit_drivers_gpu_drm_arm-3Fid
> > > -3De4563f6ba71792c77aeccb2092cc23149b44e642&d=DwIDaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=SI66ngnnXy33ncb8m5H4
> > > La2T1SzSEiiP7hc_XsRahEc&s=hl9Y6s3K9LwLL1M2WnL3ODax_V-ZRh8k1iTiyctIqU4&e= 
> > > 
> > > Could you please clarify which exact tree did you mean?
> > 
> > Sorry, I thought the series got pulled by one of the DRM trees, but it looks like
> > I was wrong. I was carrying a private copy in my internal tree, waiting for the
> > moment when it got pulled into drm-next or drm-misc-next.
> > 
> > Rob, do you have an update on your series introducing of_graph_get_remote_node() ?
> 
> For some reason I cannot find any relevant commits in linux-next tree even today.
> Could you please point me to either any random git tree with mentioned above change or
> maybe just mailing list where this patch was sent?

Not sure why Rob hasn't added it to linux-next, but (according to Rob) this is the latest version:

https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/log/?h=of-graph-helpers

Best regards,
Liviu

> 
> I'd like to implement the same fix in ARCPGU and call it a day finally.
> 
> -Alexey

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
