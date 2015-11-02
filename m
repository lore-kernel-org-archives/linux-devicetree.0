From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v3 0/2] thermal: mediatek: Add cpu power cooling model
Date: Mon, 2 Nov 2015 21:40:07 +0530
Message-ID: <20151102161007.GI3639@ubuntu>
References: <1445515359-8587-1-git-send-email-dawei.chien@mediatek.com>
 <20151028154449.GH3716@ubuntu>
 <9hh4mh4bdoi.fsf@e105922-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9hh4mh4bdoi.fsf@e105922-lin.cambridge.arm.com>
Sender: linux-pm-owner@vger.kernel.org
To: Punit Agrawal <punit.agrawal@arm.com>
Cc: Dawei Chien <dawei.chien@mediatek.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>, Daniel Kurtz <djkurtz@chromium.org>, Sascha Hauer <s.hauer@pengutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On 02-11-15, 15:53, Punit Agrawal wrote:
> For dynamic power, I had posted some patches[0][1][2] introducing the
> binding as well as updating cooling device registration via cpufreq
> driver. Now that the SCPI hwmon driver is merged, I should re-send the
> remaining patches.
> 
> [0] http://lkml.iu.edu/hypermail/linux/kernel/1508.0/01020.html
> [1] http://lkml.iu.edu/hypermail/linux/kernel/1508.0/01022.html
> [3] http://lkml.iu.edu/hypermail/linux/kernel/1508.0/01031.html

Sure. Just that whatever can be merged with opp-v2 should be merged.

-- 
viresh
