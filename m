From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V4] dt-bindings: timer: gpt: update binding doc
Date: Fri, 11 Jan 2019 08:52:14 -0600
Message-ID: <20190111145214.GA15957@bogus>
References: <1546076081-23196-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1546076081-23196-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Sat, Dec 29, 2018 at 09:39:34AM +0000, Anson Huang wrote:
> The i.MX GPT timer driver binding doc is out of date,
> update it according to current GPT timer driver.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> ChangeLog since V3:
> 	be more specific about the backwards compatible of each SoC;
> ---
>  .../devicetree/bindings/timer/fsl,imxgpt.txt       | 39 ++++++++++++++++++----
>  1 file changed, 33 insertions(+), 6 deletions(-)

This now seems in line with my 9+ year old memory of the lineage of this 
block. :)

Reviewed-by: Rob Herring <robh@kernel.org>

Rob
