From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: mfd: bd9571mwv: Document DDR Backup
 Mode properties
Date: Tue, 27 Mar 2018 13:15:12 +0100
Message-ID: <20180327121512.ygwcrwexx2fmbwyz@dell>
References: <1521025722-24205-1-git-send-email-geert+renesas@glider.be>
 <1521025722-24205-2-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1521025722-24205-2-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 14 Mar 2018, Geert Uytterhoeven wrote:

> Document the new optional properties related to DDR Backup Mode and
> toggle/momentary power switches.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Improve property description,
>   - Add properties for power switch type.
> ---
>  Documentation/devicetree/bindings/mfd/bd9571mwv.txt | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)

Once Rob's comment has been handled:

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
