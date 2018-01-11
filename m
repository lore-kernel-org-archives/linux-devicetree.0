From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] ARM64: dts: meson-axg: add RMII pins for ethernet
 controller
Date: Thu, 11 Jan 2018 09:37:43 +0100
Message-ID: <1515659863.5048.112.camel@baylibre.com>
References: <20180111030411.197054-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180111030411.197054-1-yixun.lan@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yixun Lan <yixun.lan@amlogic.com>, Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>, Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 2018-01-11 at 11:04 +0800, Yixun Lan wrote:
> Comparing to RGMII interface, the RMII interface require few pins.
> So it's worth describing them here.
> 
> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>

The only axg platform we have upstream is the s400 and is using rgmii.
May I ask how this was tested ?
