From: Martin Michlmayr <tbm@cyrius.com>
Subject: Re: [PATCH 2/2] ARM: DTS: kirkwood-openrd: fix SD slot default
 configuration
Date: Sun, 17 Jan 2016 14:43:17 -0800
Message-ID: <20160117224316.GA26018@jirafa.cyrius.com>
References: <1452629253-21748-1-git-send-email-aaro.koskinen@iki.fi>
 <1452629253-21748-2-git-send-email-aaro.koskinen@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1452629253-21748-2-git-send-email-aaro.koskinen@iki.fi>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

* Aaro Koskinen <aaro.koskinen@iki.fi> [2016-01-12 22:07]:
> The SD card slot was enabled by default with legacy booting.
> It does not work anymore with DT boot. Fix by providing GPIO configuration
> that matches the old default.

Tested-by: Rick Thomas <rbthomas@pobox.com>
Reviewed-by: Martin Michlmayr <tbm@cyrius.com>

-- 
Martin Michlmayr
http://www.cyrius.com/
