From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: add binding for Innolux
 ee101ia-01d panel
Date: Tue, 4 Dec 2018 14:15:50 -0600
Message-ID: <20181204201550.GA16947@bogus>
References: <20181113124205.29319-1-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181113124205.29319-1-heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
Cc: thierry.reding@gmail.com, airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, heiko@sntech.de, Heiko Stuebner <heiko.stuebner@bq.com>
List-Id: devicetree@vger.kernel.org

On Tue, 13 Nov 2018 13:42:05 +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@bq.com>
> 
> This is a panel handled through the generic lvds-panel binding,
> so only needs its additional compatible specified.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@bq.com>
> ---
>  .../bindings/display/panel/innolux,ee101ia-01d.txt         | 7 +++++++
>  1 file changed, 7 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/innolux,ee101ia-01d.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
