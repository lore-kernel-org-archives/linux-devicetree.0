From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH v2] ARM: pxa: dts: add pin definitions for extended GPIOs
Date: Thu, 24 May 2018 09:28:19 +0200
Message-ID: <87a7spy0ks.fsf@belgarion.home>
References: <20180522202232.7981-1-daniel@zonque.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180522202232.7981-1-daniel@zonque.org> (Daniel Mack's message
 of "Tue, 22 May 2018 22:22:32 +0200")
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

> The PXA3xx series features some extended GPIO banks which are named GPIO0_2,
> GPIO1_2 etc. The PXA300, PXA310 and PXA320 have different numbers of such
> pins, and they also have variant-specific register offsets.
>
> Signed-off-by: Daniel Mack <daniel@zonque.org>
Applied to pxa/dt, thanks.

Cheers.

--
Robert
