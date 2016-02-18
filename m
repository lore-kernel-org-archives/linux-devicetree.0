From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/2] ARM: dts: vf-colibri: remove container node of
 regulators
Date: Thu, 18 Feb 2016 21:38:31 +0800
Message-ID: <20160218133831.GX6756@tiger>
References: <1455588854-6996-1-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1455588854-6996-1-git-send-email-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: kernel@pengutronix.de, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 15, 2016 at 06:14:13PM -0800, Stefan Agner wrote:
> Drop the fake simple-bus container 'regulators' and put the
> regulators directly under the root node. This also makes the
> artificial 'reg' properties superfluous.
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>

Applied both, thanks.
