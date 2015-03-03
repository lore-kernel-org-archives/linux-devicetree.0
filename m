From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH] ARM: dts: vf610: remove unused gpio-range-cells property
Date: Tue, 3 Mar 2015 12:13:31 +0800
Message-ID: <20150303041329.GN20455@dragon>
References: <1425311881-10767-1-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1425311881-10767-1-git-send-email-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: kernel@pengutronix.de, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 02, 2015 at 04:58:01PM +0100, Stefan Agner wrote:
> The anyway depricated gpio-range-cells property was never used
> by the pin controller driver. This patch removes it.
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>

Applied, thanks.
