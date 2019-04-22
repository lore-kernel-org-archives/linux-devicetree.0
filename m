From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2] ARM: dts: bugfix tqma7 soft reset issue
Date: Mon, 22 Apr 2019 08:52:07 +0800
Message-ID: <20190422005206.GJ19962@dragon>
References: <20190414120629.8912-1-bruno.thomsen@gmail.com>
 <20190416090805.13166-1-bruno.thomsen@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190416090805.13166-1-bruno.thomsen@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bruno Thomsen <bruno.thomsen@gmail.com>
Cc: markus.niebel@tq-group.com, devicetree@vger.kernel.org, laa@kamstrup.com, s.hauer@pengutronix.de, clemens.ml@gmx.net, ksc@kamstrup.com, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, festevam@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 16, 2019 at 11:08:05AM +0200, Bruno Thomsen wrote:
> Running reboot command on the TQMa7 board would just hang infinite
> at the end of the system shutdown process.
> 
> Handling of i.MX7 errata e10574:
> Watchdog: A watchdog timeout or software trigger will not reset the SOC.
> 
> Moved pinctrl from common mba7 to common tqma7 dtsi as it improves
> readability of errata handling. Most integrators of this SoM will
> likely use the development board as inspiration for handling this
> SoC issue.
> 
> Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>

Applied, thanks.
