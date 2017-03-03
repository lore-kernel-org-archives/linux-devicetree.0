From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: extcon: Add support for cros-ec
 device
Date: Fri, 3 Mar 2017 00:43:20 -0600
Message-ID: <20170303064320.icrc7nbujptarsiu@rob-hp-laptop>
References: <20170301111943.12170-1-enric.balletbo@collabora.com>
 <20170301111943.12170-3-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170301111943.12170-3-enric.balletbo@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Benson Leung <bleung@chromium.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 01, 2017 at 12:19:43PM +0100, Enric Balletbo i Serra wrote:
> From: Benson Leung <bleung@chromium.org>
> 
> This patch add documentation for binding of USB Type C cable detection
> mechanism is using EXTCON subsystem. The device can detect the presence
> of display out but it may also detect other external accessories when
> external accessories is attached or detached.
> 
> Signed-off-by: Benson Leung <bleung@chromium.org>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
> ---
>  - Added Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
>  Requested by Rob Herring
>  - Remove the Extcon word in the binding and replace it to describe better the
>    h/w.
>  - 'google,extcon-cros-ec' renamed to 'google,extcon-usbc-cros-ec' to indicate
>    this is USB Type C related.
> 
>  .../bindings/extcon/extcon-usbc-cros-ec.txt        | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/extcon/extcon-usbc-cros-ec.txt

Acked-by: Rob Herring <robh@kernel.org>
