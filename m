From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 5/6] dt-bindings: add Sharp LQ123P1JX31 panel binding
Date: Tue, 14 Jun 2016 17:06:25 -0500
Message-ID: <20160614220625.GA25751@rob-hp-laptop>
References: <1465700010-13483-1-git-send-email-ykk@rock-chips.com>
 <1465700176-13716-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1465700176-13716-1-git-send-email-ykk@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>
Cc: David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, dianders@chromium.org, emil.l.velikov@gmail.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, Jun 12, 2016 at 10:56:16AM +0800, Yakir Yang wrote:
> The Sharp LQ123P1JX31 is an 12.3" 2400x1600 TFT-LCD panel
> connected using eDP interfaces.
> 
> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
> Changes in v3:
> - Drop the extra comma in compatible name (Rob)
> - Add the reviewed flag from Doug
> 
> Changes in v2:
> - Add dt-bindings of Sharp LQ123P1JX31 panel in v2
> 
>  .../devicetree/bindings/display/panel/sharp,lq123p1jx31.txt        | 7 +++++++
>  1 file changed, 7 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,lq123p1jx31.txt

Acked-by: Rob Herring <robh@kernel.org>
