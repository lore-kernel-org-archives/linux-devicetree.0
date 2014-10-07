From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 0/2] init some clock rate from dts for rk3288
Date: Tue, 7 Oct 2014 10:11:54 -0700
Message-ID: <CAD=FV=URpegr4xZ8fVf4AmKYWg2_UtS-nsQibuaXddio3xMNig@mail.gmail.com>
References: <1412674438-26160-1-git-send-email-kever.yang@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1412674438-26160-1-git-send-email-kever.yang@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kever Yang <kever.yang@rock-chips.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Mike Turquette <mturquette@linaro.org>, Sonny Rao <sonnyrao@chromium.org>, Addy Ke <addy.ke@rock-chips.com>, Eddie Cai <cf@rock-chips.com>, Jianqun Xu <xjq@rock-chips.com>, han jiang <hj@rock-chips.com>, Tao Huang <huangtao@rock-chips.com>, =?UTF-8?B?5oi05YWL6ZyWIChKYWNrKQ==?= <dkl@rock-chips.com>, Russell King <linux@arm.linux.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Kever,

On Tue, Oct 7, 2014 at 2:33 AM, Kever Yang <kever.yang@rock-chips.com> wrote:
> This patch add init rate for PLLs and some bus clock  from dts for rk3288,
> add two clock rate of 400M and 500M into rate table for we will use it.

In the cover letter you should probably mention that your series won't
work properly unless <https://patchwork.kernel.org/patch/5038781/> is
applied.  When I don't have that patch then "aclk_cpu" doesn't get set
properly.
