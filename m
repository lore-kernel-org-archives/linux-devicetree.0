From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v7 5/7] dt-bindings: Add binding for cros-ec-rpmsg.
Date: Sat, 06 Apr 2019 01:05:41 -0500
Message-ID: <5ca841b8.1c69fb81.48fee.6697@mx.google.com>
References: <20190327051450.16222-1-pihsun@chromium.org>
 <20190327051450.16222-6-pihsun@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190327051450.16222-6-pihsun@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Shih <pihsun@chromium.org>
Cc: Lee Jones <lee.jones@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Benson Leung <bleung@chromium.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Guenter Roeck <groeck@chromium.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 27, 2019 at 01:14:47PM +0800, Peter Shih wrote:
> From: Pi-Hsun Shih <pihsun@chromium.org>
> 
> Add a DT binding documentation for ChromeOS EC driver over rpmsg.
> 
> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
> ---
> Changes from v6:
>  - No change.
> 
> Changes from v5:
>  - New patch.
> ---
>  Documentation/devicetree/bindings/mfd/cros-ec.txt | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
