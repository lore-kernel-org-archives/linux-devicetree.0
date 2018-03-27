From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2 1/2] Revert "arm64: dts: fsl: fix ifc simple-bus unit
 address format warnings"
Date: Tue, 27 Mar 2018 16:01:47 +0800
Message-ID: <20180327080145.GF8857@dragon>
References: <1522081243-30871-1-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1522081243-30871-1-git-send-email-festevam@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, leoyang.li@nxp.com
List-Id: devicetree@vger.kernel.org

On Mon, Mar 26, 2018 at 01:20:42PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@nxp.com>
> 
> This reverts commit f81d7af7957539b7808961f929f945381530acb9.
> 
> As explained by Rob Herring:
> 
> "This "fix" is wrong. Memory controllers with chip selects should have
> the chip select in the unit-address. The correct fix here is you should
> drop "simple-bus"."
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>

Applied both, thanks.
