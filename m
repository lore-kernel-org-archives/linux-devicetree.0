From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 06/14] ARM: kirkwood: convert uart0 to devicetree.
Date: Wed, 7 Mar 2012 18:31:31 +0000
Message-ID: <201203071831.31738.arnd@arndb.de>
References: <cover.1331090356.git.jason@lakedaemon.net>
 <80fb8cef577eee14364e95009f7a590fd9056ee3.1331090356.git.jason@lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <80fb8cef577eee14364e95009f7a590fd9056ee3.1331090356.git.jason@lakedaemon.net>
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
Cc: nicolas.pitre@linaro.org, andrew@lunn.ch, devicetree-discuss@lists.ozlabs.org, grant.likely@secretlab.ca, michael@walle.cc, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wednesday 07 March 2012, Jason Cooper wrote:
> +       serial@f1012000 {
> +               compatible = "ns16550a";
> +               reg = <0xf1012000 0xff>;
> +               reg-shift = <2>;
> +               interrupts = <33>;
> +               clock-frequency = <200000000>;
> +       };

I just noticed that the length here should be inclusive, i.e. 0x100 not 0xff.
This is different from the way we define resources in Linux.

	Arnd
