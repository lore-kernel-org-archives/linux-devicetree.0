From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 4/5] media: ov2640: add a master clock for sensor
Date: Mon, 8 Dec 2014 13:10:39 -0200
Message-ID: <CAOMZO5ASNUCz908esJ3iTQ6VEQGeNi-HOmqMOf12c633Q8pavw@mail.gmail.com>
References: <1418038147-13221-1-git-send-email-josh.wu@atmel.com>
	<1418038147-13221-5-git-send-email-josh.wu@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <1418038147-13221-5-git-send-email-josh.wu@atmel.com>
Sender: linux-media-owner@vger.kernel.org
To: Josh Wu <josh.wu@atmel.com>
Cc: linux-media <linux-media@vger.kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <m.chehab@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 8, 2014 at 9:29 AM, Josh Wu <josh.wu@atmel.com> wrote:

> +       priv->master_clk = devm_clk_get(&client->dev, "xvclk");
> +       if (IS_ERR(priv->master_clk))
> +               return -EINVAL;

You should return PTR_ERR(priv->master_clk) instead.
