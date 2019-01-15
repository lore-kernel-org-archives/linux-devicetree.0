From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 3/3] ARM: dts: imx6ull: Fix i.MX6ULL/ULZ ocotp compatible
Date: Tue, 15 Jan 2019 22:53:12 +0800
Message-ID: <20190115145309.GA13895@dragon>
References: <1544536273-17909-1-git-send-email-stefan.wahren@i2se.com>
 <1544536273-17909-4-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1544536273-17909-4-git-send-email-stefan.wahren@i2se.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-imx@nxp.com, kernel@pengutronix.de, Fabio Estevam <fabio.estevam@nxp.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 11, 2018 at 02:51:13PM +0100, Stefan Wahren wrote:
> Since imx6ulz.dtsi includes imx6ull.dtsi, we only need to fix the compatible
> string here to achieve the correct OTP size for both SoCs.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>

Applied, thanks.
