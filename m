From: Pavel Machek <pavel@denx.de>
Subject: Re: [PATCH 1/2] ARM: dts: Change dw-apb-timer-osc and
 dw-apb-timer-sp to just dw-apb-timer
Date: Mon, 29 Jul 2013 20:25:54 +0200
Message-ID: <20130729182554.GA10346@amd.pavel.ucw.cz>
References: <1374723797-22169-1-git-send-email-dinguyen@altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1374723797-22169-1-git-send-email-dinguyen@altera.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: dinguyen@altera.com
Cc: dinh.linux@gmail.com, Heiko Stuebner <heiko@sntech.de>, Arnd Bergmann <arnd@arndb.de>, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, Olof Johansson <olof@lixom.net>, John Stultz <john.stultz@linaro.org>, Grant Likely <grant.likely@linaro.org>, Jamie Iles <jamie@jamieiles.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed 2013-07-24 22:43:16, dinguyen@altera.com wrote:
> From: Dinh Nguyen <dinguyen@altera.com>
> 
> "dw-apb-timer-osc" and "dw-apb-timer-sp" are the same implementation of the
> DW APB timer, just fed by different clocks.
> 
> Signed-off-by: Dinh Nguyen <dinguyen@altera.com>
> CC: Rob Herring <rob.herring@calxeda.com>
> Cc: Grant Likely <grant.likely@linaro.org>
> CC: Arnd Bergmann <arnd@arndb.de>
> Cc: Olof Johansson <olof@lixom.net>
> CC: Jamie Iles <jamie@jamieiles.com>
> Cc: John Stultz <john.stultz@linaro.org>
> Cc: Heiko Stuebner <heiko@sntech.de>

Looks good to me, thanks!
									Pavel

Reviewed-by: Pavel Machek <pavel@denx.de>
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
