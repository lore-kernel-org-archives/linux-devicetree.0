From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH 1/2] ARM: pxa: dts: add gpio-ranges to gpio controller
Date: Tue, 22 May 2018 21:19:39 +0200
Message-ID: <87y3gbxzuc.fsf@belgarion.home>
References: <20180521220044.821-1-daniel@zonque.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180521220044.821-1-daniel@zonque.org> (Daniel Mack's message
 of "Tue, 22 May 2018 00:00:43 +0200")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Daniel Mack <daniel@zonque.org>
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, haojian.zhuang@gmail.com
List-Id: devicetree@vger.kernel.org

Daniel Mack <daniel@zonque.org> writes:

> The PXA GPIO driver calls out to the pinctrl driver for claiming pins
> unless the config has CONFIG_PINCTRL unset. IOW, if a pinctrl driver is
> active, it must be visible to the GPIO driver.
>
> Signed-off-by: Daniel Mack <daniel@zonque.org>
Applied to pxa/dt, thanks.

Cheers.

--
Robert
