From: Ran Bi <ran.bi@mediatek.com>
Subject: Re: [PATCH v4 10/10] rtc: Add support for the MediaTek MT6358 RTC
Date: Tue, 6 Aug 2019 19:41:32 +0800
Message-ID: <1565091692.24748.3.camel@mhfsdcap03>
References: <1564982518-32163-1-git-send-email-hsin-hsiung.wang@mediatek.com>
         <1564982518-32163-11-git-send-email-hsin-hsiung.wang@mediatek.com>
         <20190805072338.GB3600@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190805072338.GB3600@piout.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, Eddie Huang <eddie.huang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Alessandro Zummo <a.zummo@towertech.it>, Thomas Gleixner <tglx@linutronix.de>, Richard Fontana <rfontana@redhat.com>, Kate Stewart <kstewart@linuxfoundation.org>, Allison Randal <allison@lohutok.net>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, srv_heupstream@mediatek.com
List-Id: devicetree@vger.kernel.org

Hi Belloni,

On Mon, 2019-08-05 at 09:23 +0200, Alexandre Belloni wrote:
> Hi,
> 
> The subject should be:
> 
> "rtc: mt6397: Add support for the MediaTek MT6358 RTC"

Will be changed at next patch.

> > +struct mtk_rtc_compatible {
> 
> I would name that struct mtk_rtc_data
> 
> > +	u32			wrtgr_addr;
> 
> and this member should be wrtgr_offset or simply wrtgr.
> 

Will be changed at next patch.

> >  
> > +	of_id = of_match_device(mt6397_rtc_of_match, &pdev->dev);
> > +	if (!of_id) {
> > +		dev_err(&pdev->dev, "Failed to probe of_node\n");
> > +		return -EINVAL;
> 
> This will never happen because probe would not be called if there is no
> match. You could also use of_device_get_match_data to avoid having to
> move the of_device_id table.
> 

Will use of_device_get_match_data() function instead of
of_match_device() function.
