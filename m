From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH V2 3/4] dt-bindings: thermal: qoriq: Add optional clocks property
Date: Mon, 29 Jul 2019 09:21:15 -0300
Message-ID: <CAOMZO5Ao8aNGfj3KHd+rsX=kj528BvzeSHFvQR6pEWXN3BD98g@mail.gmail.com>
References: <20190729083915.4855-1-Anson.Huang@nxp.com> <20190729083915.4855-3-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190729083915.4855-3-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yongcai Huang <Anson.Huang@nxp.com>
Cc: "rui.zhang" <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-pm@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, NXP Linux Team <Linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi Anson,

On Mon, Jul 29, 2019 at 6:04 AM <Anson.Huang@nxp.com> wrote:
>
> From: Anson Huang <Anson.Huang@nxp.com>
>
> Some platforms have clock control for TMU, add optional
> clocks property to the binding doc.

Please add a note that this is needed for i.MX8M.
