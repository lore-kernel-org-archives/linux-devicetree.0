Return-Path: <robherring2@gmail.com>
Date: Wed, 11 Jul 2018 13:14:21 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 3/4] dt-bindings: sound: wm8994: document
 wlf,csnaddr-pd property
Message-ID: <20180711191421.GA7013@rob-hp-laptop>
References: <20180709160631.GU18740@imbe.wolfsonmicro.main>
 <1531158406-18646-1-git-send-email-anthony@amarulasolutions.com>
 <1531158406-18646-3-git-send-email-anthony@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1531158406-18646-3-git-send-email-anthony@amarulasolutions.com>
To: Anthony Brandon <anthony@amarulasolutions.com>
Cc: mark.rutland@arm.com, lee.jones@linaro.org, patches@opensource.cirrus.com, ckeepax@opensource.cirrus.com, alberto@amarulasolutions.com, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, Jul 09, 2018 at 07:46:45PM +0200, Anthony Brandon wrote:
> Add the wlf,csnaddr-pd property to allow the CS/Addr pull-down to be
> controlled from the device tree.
> 
> Signed-off-by: Anthony Brandon <anthony@amarulasolutions.com>
> ---
>  Documentation/devicetree/bindings/sound/wm8994.txt | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
