From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH v2 1/2] clk: rockchip: add bindings for the mmc clock
 phases
Date: Mon, 17 Nov 2014 13:16:06 -0800
Message-ID: <20141117211606.25314.43161@quantum>
References: <1416009604-31545-1-git-send-email-amstan@chromium.org>
 <1416009604-31545-2-git-send-email-amstan@chromium.org>
 <20141117193902.25314.97687@quantum>
 <CAHNYxRwGWqbznVybmE+tpyghEoQwVFK_V2ubFRKXasvsPS+R7Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAHNYxRwGWqbznVybmE+tpyghEoQwVFK_V2ubFRKXasvsPS+R7Q@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alexandru Stan <amstan@chromium.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, addy ke <addy.ke@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, linux-kernel@vger.kernel.org, Kever Yang <kever.yang@rock-chips.com>, Doug Anderson <dianders@chromium.org>, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, galak@codeaurora.org, Sonny Rao <sonnyrao@chromium.org>, linux-arm-kernel@lists.infradead.org, mark.yao@rock-chips.com
List-Id: devicetree@vger.kernel.org

Quoting Alexandru Stan (2014-11-17 11:50:51)
> Sorry for my previous mail, I sent it as HTML and also top posted.
> Here it goes again:
> 
> On Mon, Nov 17, 2014 at 11:39 AM, Mike Turquette <mturquette@linaro.org> wrote:
> > It looks like you are adding new clocks to handle the phase requirement.
> > Is that the right thing to do? Don't these clks already exist (e.g.
> > SCLK_SDMMC)?
> I actually need to control 2 phases, one of them is used when
> outputting data, the other when sampling. Sunxi does something
> similar: http://lists.infradead.org/pipermail/linux-arm-kernel/2014-July/273273.html
> 
> Another reason it wouldn't work is because the upstream clock(eg
> SCLK_SDMMC) is twice as fast as the real clock(see RK3288_CLKGEN_DIV
> in drivers/mmc/host/dw_mmc-rockchip.c), since that clock goes to a /2
> divider to be able to do the 90 degree clock phases.

Thanks for the explanation.

Regards,
Mike

> 
> Alexandru Stan
