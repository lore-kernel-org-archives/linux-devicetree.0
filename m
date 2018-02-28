From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/2] clk: imx: imx7d: add the Keypad Port module clock
Date: Wed, 28 Feb 2018 14:55:07 +0800
Message-ID: <20180228065506.GK3217@dragon>
References: <20180227160544.11446-1-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180227160544.11446-1-stefan@agner.ch>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stefan Agner <stefan@agner.ch>
Cc: fabio.estevam@nxp.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 27, 2018 at 05:05:43PM +0100, Stefan Agner wrote:
> According to the i.MX7D Reference Manual, the Keypad Port module
> (KPP) requires this clock gate to be enabled.
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>

Applied both.  But for future i.MX clock patches, please also copy
clk maintainers to give them chance to comment.

Michael Turquette <mturquette@baylibre.com>
Stephen Boyd <sboyd@kernel.org>

I will eventually need to send i.MX clock patches to them.

Shawn
