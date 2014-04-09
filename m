From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCHv2 2/3] drm: exynos: hdmi: use hdmiphy as PHY
Date: Wed, 09 Apr 2014 12:30:47 +0200
Message-ID: <53452157.9030203@samsung.com>
References: <1396967856-27470-1-git-send-email-t.stanislaws@samsung.com>
 <1396967856-27470-3-git-send-email-t.stanislaws@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1396967856-27470-3-git-send-email-t.stanislaws@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Tomasz Stanislawski <t.stanislaws@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: kgene.kim@samsung.com, kishon@ti.com, kyungmin.park@samsung.com, robh+dt@kernel.org, grant.likely@linaro.org, sylvester.nawrocki@gmail.com, rahul.sharma@samsung.com
List-Id: devicetree@vger.kernel.org

Hi Tomasz,

On 04/08/2014 04:37 PM, Tomasz Stanislawski wrote:
> The HDMIPHY (physical interface) is controlled by a single
> bit in a power controller's regiter. It was implemented
> as clock. It was a simple but effective hack.

This power controller register has also bits to control HDMI clock
divider ratio. I guess current drivers do not change it, but how do you
want to implement access to it if some HDMI driver in the future will
need to change ratio. I guess in case of clk it would be easier.

Regards
Andrzej
