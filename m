From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/2] ARM: dts: imx7d: Correct speed grading fuse settings
Date: Sun, 6 Oct 2019 16:09:37 +0800
Message-ID: <20191006080933.GY7150@dragon>
References: <1568256992-31707-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1568256992-31707-1-git-send-email-Anson.Huang@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Anson Huang <Anson.Huang@nxp.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, s.hauer@pengutronix.de, linux-kernel@vger.kernel.org, robh+dt@kernel.org, Linux-imx@nxp.com, kernel@pengutronix.de, festevam@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 12, 2019 at 10:56:31AM +0800, Anson Huang wrote:
> The 800MHz opp speed grading fuse mask should be 0xd instead
> of 0xf according to fuse map definition:
> 
> SPEED_GRADING[1:0]	MHz
> 	00		800
> 	01		500
> 	10		1000
> 	11		1200
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Applied both, thanks.
