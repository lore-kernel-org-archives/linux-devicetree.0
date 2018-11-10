From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH] ARM: dts: pxa3xx: add gcu node
Date: Sat, 10 Nov 2018 21:43:17 +0100
Message-ID: <87muqgll3u.fsf@belgarion.home>
References: <20181105191827.3860-1-daniel@zonque.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181105191827.3860-1-daniel@zonque.org> (Daniel Mack's message
 of "Mon, 5 Nov 2018 20:18:27 +0100")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Daniel Mack <daniel@zonque.org>, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, haojian.zhuang@gmail.com
List-Id: devicetree@vger.kernel.org

Daniel Mack <daniel@zonque.org> writes:

> Add a device node for hardware graphic acceleration.
>
> Signed-off-by: Daniel Mack <daniel@zonque.org>
Hi Daniel,

> +	gcu: display-controller@54000000 {
> +		compatible = "marvell,pxa300-gcu";
Isn't every IP devicetree entry supposed to have a documentation in
Documentation/devicetree going along a definition in the .dtsi files ?

Cheers.

-- 
Robert
