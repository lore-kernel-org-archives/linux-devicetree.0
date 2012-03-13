From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 7/7] ARM: kirkwood: use devicetree for rtc-mv
Date: Tue, 13 Mar 2012 09:58:30 +0000
Message-ID: <201203130958.31223.arnd@arndb.de>
References: <cover.1331601448.git.jason@lakedaemon.net>
 <92d02581e0fce75f84d61edf55678108237e881a.1331601448.git.jason@lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <92d02581e0fce75f84d61edf55678108237e881a.1331601448.git.jason@lakedaemon.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jason Cooper <jason@lakedaemon.net>
Cc: nicolas.pitre@linaro.org, andrew@lunn.ch, jm@lentin.co.uk, grant.likely@secretlab.ca, michael@walle.cc, olof@lixom.net, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tuesday 13 March 2012, Jason Cooper wrote:
> 
> Signed-off-by: Jason Cooper <jason@lakedaemon.net>
> ---
>  arch/arm/boot/dts/kirkwood.dtsi   |    6 ++++++
>  arch/arm/mach-kirkwood/board-dt.c |    1 -
>  arch/arm/mach-kirkwood/common.c   |    2 +-
>  arch/arm/mach-kirkwood/common.h   |    1 -
>  4 files changed, 7 insertions(+), 3 deletions(-)
> 

Acked-by: Arnd Bergmann <arnd@arndb.de>

I think you can just merge this with patch 6, as they are two halves
of the same work.

	Arnd
