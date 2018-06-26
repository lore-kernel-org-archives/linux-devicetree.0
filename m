From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH] arm: dts: pxa3xx: Add ssp ports to pxa3xx device tree
Date: Tue, 26 Jun 2018 10:23:44 +0200
Message-ID: <87d0welzvz.fsf@belgarion.home>
References: <20180624174134.20581-1-daniel@zonque.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180624174134.20581-1-daniel@zonque.org> (Daniel Mack's message
 of "Sun, 24 Jun 2018 19:41:34 +0200")
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

> Also fix the documentation for these bindings.
>
> The DMA properties have to be passed in the ssp users for now.
>
> Signed-off-by: Daniel Mack <daniel@zonque.org>
Applied to pxa/dt.

For completeness, you could always add another patch for pxa27x.dtsi to ssp
ports :)

Cheers.

--
Robert
