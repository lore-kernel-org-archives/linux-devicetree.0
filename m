From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v6 1/5] phy: add a driver for the Rockchip SoC internal
 USB2.0 PHY
Date: Thu, 11 Dec 2014 19:05:27 -0800
Message-ID: <CAD=FV=XrOpZ16k7dNyqzf8m_8Sjq8yn5xCj7+YLiTPU3O2KrrQ@mail.gmail.com>
References: <1418291722-25448-1-git-send-email-lyz@rock-chips.com>
 <1418291722-25448-2-git-send-email-lyz@rock-chips.com>
 <CAD=FV=WcAJAgj2triu1W4863BT1ew2wf-z6YNHHwiDKpnYmK4w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAD=FV=WcAJAgj2triu1W4863BT1ew2wf-z6YNHHwiDKpnYmK4w@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Yunzhi Li <lyz@rock-chips.com>
Cc: Tao Huang <huangtao@rock-chips.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Chris <zyw@rock-chips.com>, Eddie Cai <cf@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, Olof Johansson <olof@lixom.net>, jwerner@chromium.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

Yunzhi,

On Thu, Dec 11, 2014 at 10:09 AM, Doug Anderson <dianders@chromium.org> wrote:
>> +               rk_phy->phy = devm_phy_create(dev, NULL, &ops);
>
> This has the wrong number of arguments.  Even before the change that
> added the 4th argument, this is still wrong because "ops" is supposed
> to be the 2nd argument, not the 3rd.
>
> ...so I'm confused how this compiled for you.  I think this ought to be:
>
> rk_phy->phy = devm_phy_create(dev, child, &ops, NULL);
>
> ...but please correct me if I'm mistaken!

As you pointed out privately, I didn't have (dbc9863 phy: remove the
old lookup method).  Sorry about the noise..

Hopefully my other comments are not quite as stupid...

-Doug
