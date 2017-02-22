From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2 1/2] dt-bindings: Add thermal zone to bcm2835-thermal
 example
Date: Wed, 22 Feb 2017 08:55:24 -0600
Message-ID: <20170222145524.tnmvqmjhrgalxaal@rob-hp-laptop>
References: <1486928328-25870-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1486928328-25870-1-git-send-email-stefan.wahren@i2se.com>
Sender: linux-pm-owner@vger.kernel.org
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Eduardo Valentin <edubezval@gmail.com>, Zhang Rui <rui.zhang@intel.com>, kernel@martin.sperl.org, Eric Anholt <eric@anholt.net>, Frank Rowand <frowand.list@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, linux-rpi-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-pm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, Feb 12, 2017 at 07:38:47PM +0000, Stefan Wahren wrote:
> Add a thermal zone in order to make the example complete.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---
> 
> Changes in V2:
> - add missing thermal-sensor-cells property
> - change gpu-thermal to cpu-thermal
> 
>  .../bindings/thermal/brcm,bcm2835-thermal.txt      |   29 +++++++++++++++++---
>  1 file changed, 25 insertions(+), 4 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
