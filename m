From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v1 4/8] dt-bindings: add documentation of rk3228 clock controller
Date: Thu, 10 Dec 2015 00:11:38 +0100
Message-ID: <26848197.iMXfor9NuY@phil>
References: <1449651853-1667-1-git-send-email-jeffy.chen@rock-chips.com> <1449651853-1667-5-git-send-email-jeffy.chen@rock-chips.com> <20151209201200.GA29732@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151209201200.GA29732@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Jeffy Chen <jeffy.chen@rock-chips.com>, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Xing Zheng <zhengxing@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Hi Rob,

Am Mittwoch, 9. Dezember 2015, 14:12:00 schrieb Rob Herring:
> On Wed, Dec 09, 2015 at 05:04:09PM +0800, Jeffy Chen wrote:
> > Add the devicetree binding for the cru on the rk3228 which quite similar
> > structured as previous clock controllers.
> > 
> > Signed-off-by: Jeffy Chen <jeffy.chen@rock-chips.com>
> 
> Seems like there is a lot of duplication across Rockchip cru bindings. 
> Perhaps they should be combined?

You're right and I've put that on my list for the near future.


> Otherwise:
> 
> Acked-by: Rob Herring <robh@kernel.org>

Thanks
Heiko
