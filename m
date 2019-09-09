From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v2 3/3] media: Add support for Cadence CSI2RX 2.1
Date: Mon, 9 Sep 2019 12:41:55 +0300
Message-ID: <20190909094155.GC843@valkosipuli.retiisi.org.uk>
References: <20190905105601.27034-1-jank@cadence.com>
 <20190905105601.27034-4-jank@cadence.com>
 <20190906080119.GF1586@valkosipuli.retiisi.org.uk>
 <A67221D2-8F92-4168-83D0-6B1325CA4417@global.cadence.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <A67221D2-8F92-4168-83D0-6B1325CA4417@global.cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jan Kotas <jank@cadence.com>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, "mchehab@kernel.org" <mchehab@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Rafal Ciepiela <rafalc@cadence.com>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Jan,

On Mon, Sep 09, 2019 at 09:24:15AM +0000, Jan Kotas wrote:
> >> @@ -439,6 +535,9 @@ static int csi2rx_probe(struct platform_device *pdev)
> >> 	csi2rx->dev = &pdev->dev;
> >> 	mutex_init(&csi2rx->lock);
> >> 
> >> +	of_id = of_match_node(csi2rx_of_table, pdev->dev.of_node);
> >> +	csi2rx->vops = (struct csi2rx_vops *)of_id->data;
> > 
> > The cast isn't needed, is it?
> 
> It’s not, but doesn’t make it more readable?

If there's no need for it, please don't use explicit cast.

-- 
Sakari Ailus
