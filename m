From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: drm: panel: Add Samsung s6e63m0
 panel documentation
Date: Thu, 14 Feb 2019 09:40:47 -0600
Message-ID: <20190214154047.GA17978@bogus>
References: <20190202142748.6830-1-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190202142748.6830-1-pawel.mikolaj.chmiel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: thierry.reding@gmail.com, airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org, mark.rutland@arm.com, m.szyprowski@samsung.com, krzk@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jonathan Bakker <xc-racer2@live.ca>, =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>
List-Id: devicetree@vger.kernel.org

On Sat,  2 Feb 2019 15:27:47 +0100, =?UTF-8?q?Pawe=C5=82=20Chmiel?= wrote:
> From: Jonathan Bakker <xc-racer2@live.ca>
> 
> This commit adds documentation for Samsung s6e63m0 AMOLED LCD panel
> driver.
> 
> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
> Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
> ---
> Changes from v1:
>   - Add missing subject prefix
>   - Rename reset-gpio to reset-gpios
>   - Add link to spi properites documentation. They're required
>     for driver to work
>   - Removed delay properties, which are now hardcoded in driver
>   - Removed display timings, which are now hardcoded in driver
> ---
>  .../display/panel/samsung,s6e63m0.txt         | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
