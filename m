From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 3/4] dt-bindings: display: Add bindings for
 OSD101T2587-53TS panel
Date: Fri, 22 Feb 2019 18:20:22 -0600
Message-ID: <20190223002022.GA6504@bogus>
References: <20190222131618.20520-1-peter.ujfalusi@ti.com>
 <20190222131618.20520-4-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190222131618.20520-4-peter.ujfalusi@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: thierry.reding@gmail.com, airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, tomi.valkeinen@ti.com, sam@ravnborg.org
List-Id: devicetree@vger.kernel.org

On Fri, 22 Feb 2019 15:16:17 +0200, Peter Ujfalusi wrote:
> This adds the device-tree bindings for the OSD101T2587-53TS 10.1"
> 1920x1200 panel from One Stop Displays.
> 
> Note: the panel is similar to OSD101T2045-53TS, but it needs additional
> MIPI_DSI_TURN_ON_PERIPHERAL message from the host.
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---
>  .../display/panel/osd,osd101t2587-53ts.txt         | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/osd,osd101t2587-53ts.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
