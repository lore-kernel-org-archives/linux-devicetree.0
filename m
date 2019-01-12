From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: dts: imx: replace gpio-key,wakeup with
 wakeup-source property
Date: Sat, 12 Jan 2019 10:50:00 +0800
Message-ID: <20190112024958.GP32649@dragon>
References: <20181221181203.6764-1-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20181221181203.6764-1-sudeep.holla@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Dec 21, 2018 at 06:12:03PM +0000, Sudeep Holla wrote:
> Most of the legacy "gpio-key,wakeup" and "enable-sdio-wakeup" boolean
> properties are already replaced with "wakeup-source". However few
> occurrences of old property has popped up again, probably from the
> remnants in downstream trees. Almost all of those were remove couple
> of years back.
> 
> Replace the legacy properties with the unified "wakeup-source" property
> introduced in the commit 700a38b27eef ("Input: gpio_keys - switch to using
> generic device properties") and commit 0dbcdc0622ea ("mmc: core: enable
> support for the standard "wakeup-source" property")
> 
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>

Applied, thanks.
