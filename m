From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 1/3] power: reset: read priority from device tree
Date: Mon, 01 Dec 2014 19:50:40 +0100
Message-ID: <3594295.ivTLMMcK6I@wuerfel>
References: <1417453389-1588-1-git-send-email-stefan@agner.ch>
 <e5c5a44c84b95c4e48ed01c4dcffd35a@agner.ch>
 <20141201174100.GC22708@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20141201174100.GC22708@leverpostej>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: "fkan@apm.com" <fkan@apm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "dbaryshkov@gmail.com" <dbaryshkov@gmail.com>, "sre@kernel.org" <sre@kernel.org>, Stefan Agner <stefan@agner.ch>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "dwmw2@infradead.org" <dwmw2@infradead.org>, "linux@roeck-us.net" <linux@roeck-us.net>
List-Id: devicetree@vger.kernel.org

On Monday 01 December 2014 17:41:00 Mark Rutland wrote:
> Otherwise, I would imagine that most systems have a single preferred
> mechanism with some possible fallback(s), for which a single
> preferred-poweroff property might suffice, and has better interaction
> w.r.t. priority (in that it should _always_ be tried first). Even that's
> difficult to reconcile with FW bindings though, especially EFI (which we
> sometimes must use in preference for variable storage and capsule
> updates).

The preferred-poweroff property sounds better to me, too. I can see
two ways of doing that though, and I'm not sure which one you mean.
Would you put that as a bool property into the device that does the reboot,
or would you put it as reference into the /chosen or /aliases node?

I think the latter would be better as it avoids any ambiguity, but
either way would work.

	Arnd
