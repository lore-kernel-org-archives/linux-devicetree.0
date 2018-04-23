From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v5 1/2] media: ov2680: dt: Add bindings for OV2680
Date: Mon, 23 Apr 2018 12:58:52 -0300
Message-ID: <CAOMZO5DO1ZkrTz5UBpMxERTpkEWrPkTEb5w6ShMh754nybZ4nA@mail.gmail.com>
References: <20180419110056.10342-1-rui.silva@linaro.org> <20180419110056.10342-2-rui.silva@linaro.org>
 <CAOMZO5A3+WMu+U5STP-z3qdXnUQN2yTJne2OV9-SrEs70JJyDA@mail.gmail.com> <m3wowydkn0.fsf@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <m3wowydkn0.fsf@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rui Miguel Silva <rui.silva@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@xs4all.nl>, linux-media <linux-media@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Ryan Harkin <ryan.harkin@linaro.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 23, 2018 at 12:09 PM, Rui Miguel Silva <rui.silva@linaro.org> wrote:

> Yes, you are correct, I will fix this, and the dts entry.

As this pin has both reset and powerdown functionalities, maybe you
can name the property as 'reset-gpios'

Thanks
