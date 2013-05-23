From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH 4/6] i2c: stu300: do not request a specific clock name
Date: Fri, 24 May 2013 01:09:46 +0200
Message-ID: <20130523230943.GA3645@katana>
References: <1369330288-14856-1-git-send-email-linus.walleij@stericsson.com>
 <1369330288-14856-5-git-send-email-linus.walleij@stericsson.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1369330288-14856-5-git-send-email-linus.walleij@stericsson.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@stericsson.com>
Cc: Mike Turquette <mturquette@linaro.org>, Arnd Bergmann <arnd@arndb.de>, devicetree-discuss@lists.ozlabs.org, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, May 23, 2013 at 07:31:26PM +0200, Linus Walleij wrote:
> From: Linus Walleij <linus.walleij@linaro.org>
> 
> We have used the default clock associated with the block
> for a long time, only heuristics in the clock system has
> made this work anyway. This needs to be done away with as
> we start probing this driver and its clocks exclusively
> from the device tree.
> 
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Wolfram Sang <wsa@the-dreams.de>
