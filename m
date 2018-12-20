From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: imx-ocotp: Add i.MX6ULL/ULZ support
Date: Thu, 20 Dec 2018 14:03:38 -0600
Message-ID: <20181220200338.GA4834@bogus>
References: <1544536273-17909-1-git-send-email-stefan.wahren@i2se.com>
 <1544536273-17909-2-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1544536273-17909-2-git-send-email-stefan.wahren@i2se.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
Cc: Stefan Wahren <stefan.wahren@i2se.com>, devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-imx@nxp.com, kernel@pengutronix.de, Fabio Estevam <fabio.estevam@nxp.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, 11 Dec 2018 14:51:11 +0100, Stefan Wahren wrote:
> Since the i.MX6ULL/ULZ only supports 8 OTP banks we need to introduce a new
> compatible.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---
>  Documentation/devicetree/bindings/nvmem/imx-ocotp.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
