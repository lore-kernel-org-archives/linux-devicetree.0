From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v7 0/6] Add support for Orange Pi 3
Date: Mon, 24 Jun 2019 13:24:56 -0700 (PDT)
Message-ID: <20190624.132456.2013417744691373807.davem@davemloft.net>
References: <20190620134748.17866-1-megous@megous.com>
        <20190624.102927.1268781741493594465.davem@davemloft.net>
        <20190624174637.6sznc5ifiuh4c3sm@core.my.home>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-2
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190624174637.6sznc5ifiuh4c3sm@core.my.home>
Sender: linux-kernel-owner@vger.kernel.org
To: megous@megous.com
Cc: linux-sunxi@googlegroups.com, maxime.ripard@bootlin.com, wens@csie.org, robh+dt@kernel.org, jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch, mark.rutland@arm.com, peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org

From: Ondøej Jirman <megous@megous.com>
Date: Mon, 24 Jun 2019 19:46:37 +0200

> This series was even longer before, with patches all around for various
> maintainers. I'd expect that relevant maintainers pick the range of patches
> meant for them. I don't know who's exactly responsible for what, but I think,
> this should work:
> 
> - 2 stmmac patches should go together via some networking tree (is there
>   something specific for stmmac?)
> - all DTS patches should go via sunxi
> - hdmi patches via some drm tree

Thank you.  So I'll merge the first two patches that touch the stmmac
driver via my net-next tree.
