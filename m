From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH] ARM: dts: pxa: clean up USB controller nodes
Date: Tue, 04 Dec 2018 09:24:01 +0100
Message-ID: <87in09u2ce.fsf@belgarion.home>
References: <20181201135451.3505-1-daniel@zonque.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181201135451.3505-1-daniel@zonque.org> (Daniel Mack's message
 of "Sat, 1 Dec 2018 14:54:51 +0100")
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

> PXA25xx SoCs don't have a USB controller, so drop the node from the
> common pxa2xx.dtsi base file. Both pxa27x and pxa3xx have a dedicated
> node already anyway.
>
> While at it, unify the names for the nodes across all pxa platforms.
>
> Signed-off-by: Daniel Mack <daniel@zonque.org>
> Reported-by: Sergey Yanovich <ynvich@gmail.com>
> Link: https://patchwork.kernel.org/patch/8375421/
Queued to pxa/dt.

Cheers.

--
Robert
