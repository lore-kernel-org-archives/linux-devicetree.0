From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: dts: vf-colibri-eval-v3.dtsi: Use IRQ_TYPE specifier
Date: Tue, 15 May 2018 15:10:23 +0800
Message-ID: <20180515071021.GL26863@dragon>
References: <1526253894-3709-1-git-send-email-hernan@vanguardiasur.com.ar>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1526253894-3709-1-git-send-email-hernan@vanguardiasur.com.ar>
Sender: linux-kernel-owner@vger.kernel.org
To: =?iso-8859-1?Q?Hern=E1n?= Gonzalez <hernan@vanguardiasur.com.ar>
Cc: s.hauer@pengutronix.de, kernel@pengutronix.de, stefan@agner.ch, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, May 13, 2018 at 08:24:54PM -0300, Hernán Gonzalez wrote:
> GPIO_ACTIVE_LOW was being used to specify an interrupt, use
> IRQ_TYPE_EDGE_RISING instead. This improves DT readability.
> 
> Signed-off-by: Hernán Gonzalez <hernan@vanguardiasur.com.ar>

Applied, thanks.
