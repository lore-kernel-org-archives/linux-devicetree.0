From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4] drm/panel: simple: Add support for AUO t215hvn01
Date: Tue, 18 Oct 2016 08:00:32 -0500
Message-ID: <20161018130032.hmdsyjnmkehhaz2u@rob-hp-laptop>
References: <1476141557-4613-1-git-send-email-hshi@chromium.org>
 <1476223156-6163-1-git-send-email-hshi@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1476223156-6163-1-git-send-email-hshi@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Haixia Shi <hshi@chromium.org>
Cc: dri-devel@lists.freedesktop.org, Emil Velikov <emil.l.velikov@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 11, 2016 at 02:59:16PM -0700, Haixia Shi wrote:
> The AUO t215hvn01 is a 21.5" FHD (1920x1080) color TFT LCD panel.
> 
> This panel is used on the Acer Chromebase 21.5-inch All-in-One (DC221HQ).
> 
> Link to spec: http://www.udmgroup.com/ftp/T215HVN01.0.pdf
> 
> v2: fix alphabetical order
> v3: remove minor revision suffix ".0" and add link to spec
> v4: add dt-binding documentation
> 
> Signed-off-by: Haixia Shi <hshi@chromium.org>
> Tested-by: Haixia Shi <hshi@chromium.org>
> Reviewed-by: Stéphane Marchesin <marcheu@chromium.org>
> Cc: Emil Velikov <emil.l.velikov@gmail.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  .../bindings/display/panel/auo,t215hvn01.txt       |  7 +++++
>  drivers/gpu/drm/panel/panel-simple.c               | 30 ++++++++++++++++++++++
>  2 files changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/auo,t215hvn01.txt

Acked-by: Rob Herring <robh@kernel.org>
