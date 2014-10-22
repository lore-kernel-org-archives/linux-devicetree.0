From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v5 1/3] power-domain: add power domain drivers for
 Rockchip platform
Date: Wed, 22 Oct 2014 10:45:44 -0700
Message-ID: <20141022174544.GA4250@dtor-ws>
References: <1413882808-4669-1-git-send-email-jinkun.hong@rock-chips.com>
 <1413882808-4669-2-git-send-email-jinkun.hong@rock-chips.com>
 <20141021195854.GE8609@dtor-ws>
 <544725C4.4040703@rock-chips.com>
 <CAPDyKFp+aNJd_FEY6=-ubK0zvVDWh+x5ZsVG+AVpuBzpSqynOQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAPDyKFp+aNJd_FEY6=-ubK0zvVDWh+x5ZsVG+AVpuBzpSqynOQ@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Hong jinkun <jinkun.hong@rock-chips.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Russell King <linux@arm.linux.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Doug Anderson <dianders@chromium.org>, Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, Jack Dai <jack.dai@rock-chips.com>, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 22, 2014 at 09:58:34AM +0200, Ulf Hansson wrote:
> 
> Using the devm_*API is supposed to work from here. I have kept this in
> mind, while we added the new dev_pm_domain_attach|detach() API. The
> buses also handles -EPROBE_DEFER.

How do you ensure this? You have no control over from where API is
called. If I happen to call it form anywhere but bus probe code path I
will be leaking memory at least until the device is unbound completely
(which would be in this case an unrelated event).

Thanks.

-- 
Dmitry
