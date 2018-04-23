From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v5 1/2] media: ov2680: dt: Add bindings for OV2680
Date: Mon, 23 Apr 2018 11:11:03 -0300
Message-ID: <CAOMZO5A3+WMu+U5STP-z3qdXnUQN2yTJne2OV9-SrEs70JJyDA@mail.gmail.com>
References: <20180419110056.10342-1-rui.silva@linaro.org> <20180419110056.10342-2-rui.silva@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180419110056.10342-2-rui.silva@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rui Miguel Silva <rui.silva@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@xs4all.nl>, linux-media <linux-media@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Ryan Harkin <ryan.harkin@linaro.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Rui,

On Thu, Apr 19, 2018 at 8:00 AM, Rui Miguel Silva <rui.silva@linaro.org> wrote:

> +Optional Properties:
> +- powerdown-gpios: reference to the GPIO connected to the powerdown pin,
> +                    if any. This is an active high signal to the OV2680.

I looked at the OV2680 datasheet and I see a pin called XSHUTDN, which has
the following description:

XSHUTDN: reset and power down (active low with internal pull down resistor)

So it should be active low, not active high.
