From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v11 2/3] power-domain: rockchip: add power doamin driver
Date: Thu, 13 Nov 2014 12:20:02 -0800 (PST)
Message-ID: <2914846.96jvVdAmYN@dtor-glaptop>
References: <1415829690-20236-1-git-send-email-caesar.wang@rock-chips.com>
 <1415829690-20236-3-git-send-email-caesar.wang@rock-chips.com>
 <CAGS+omCxtvk7VNr7_tJkDCwZpbW-ocFm2VL4ngujxbS5remmVA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAGS+omCxtvk7VNr7_tJkDCwZpbW-ocFm2VL4ngujxbS5remmVA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Daniel Kurtz <djkurtz@chromium.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Ulf Hansson <ulf.hansson@linaro.org>, Heiko Stuebner <heiko@sntech.de>, linux-doc@vger.kernel.org, linus.walleij@linaro.org, Douglas Anderson <dianders@chromium.org>, Caesar Wang <caesar.wang@rock-chips.com>, Russell King <linux@arm.linux.org.uk>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Grant Likely <grant.likely@linaro.org>, Jack Dai <jack.dai@rock-chips.com>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "jinkun.hong" <jinkun.hong@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Randy Dunlap <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, ZhenFu Fang <fzf@rock-chips.com>, Kumar Gala <galak@>
List-Id: devicetree@vger.kernel.org

On Friday, November 14, 2014 03:35:44 AM Daniel Kurtz wrote:
> On Thu, Nov 13, 2014 at 6:01 AM, Caesar Wang <caesar.wang@rock-chips.com> wrote:
> > +
> > +       error = -ENXIO;
> > +
> > +       for_each_available_child_of_node(np, node) {
> > +               error = rockchip_pm_add_one_domain(pmu, node);
> > +               if (error) {
> > +                       dev_err(dev, "failed to handle node %s: %d\n",
> > +                               node->name, error);
> > +                       goto err_out;
> > +               }
> > +       }
> > +
> > +       if (error) {
> > +               dev_dbg(dev, "no power domains defined\n");
> 
> Perhaps dev_err() or dev_warn(), to ensure this message is seen.
> But, not have defined power domains doesn't seem like a fatal error.
> Perhaps just return 0?

As far as the driver concerned it is a fatal error - the driver can't do
anything when no domain is defined.

Thanks.

-- 
Dmitry
