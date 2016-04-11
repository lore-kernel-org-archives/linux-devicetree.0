From: Rob Herring <robh@kernel.org>
Subject: Re: [RESEND/PATCH V7 1/2] regulator: Add document for MT6323
 regulator
Date: Mon, 11 Apr 2016 10:25:25 -0500
Message-ID: <20160411152525.GA18883@rob-hp-laptop>
References: <1460054776-54782-1-git-send-email-blogic@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1460054776-54782-1-git-send-email-blogic@openwrt.org>
Sender: linux-kernel-owner@vger.kernel.org
To: John Crispin <blogic@openwrt.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Erin Lo =?utf-8?B?KOe+hembhem9oSk=?= <erin.lo@mediatek.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Apr 07, 2016 at 08:46:15PM +0200, John Crispin wrote:
> Signed-off-by: John Crispin <blogic@openwrt.org>
> Cc: devicetree@vger.kernel.org
> ---
> Series was dropped in the 4.6-rc1 merge window to avoid a merge order
> conflict with the corresponding MFD driver.
> 
> Changes in V7
> * remove another compatible string
> * small wording changes
> 
> Changes in V6
> * remove the compatible string
> 
> Changes in V5
> * regulator vs regulators
> 
> Changes in V4
> * regulator is a subnode and not a property
> 
>  .../bindings/regulator/mt6323-regulator.txt        |  239 ++++++++++++++++++++
>  1 file changed, 239 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mt6323-regulator.txt

Acked-by: Rob Herring <robh@kernel.org>
