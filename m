From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH 2/7] ARM: dts: pxa3xx: drop #address-cells and #size-cells
 from pinctrl node
Date: Sat, 01 Dec 2018 14:31:27 +0100
Message-ID: <87d0qlxtjk.fsf@belgarion.home>
References: <20181130175543.32628-1-daniel@zonque.org>
 <20181130175543.32628-3-daniel@zonque.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181130175543.32628-3-daniel@zonque.org> (Daniel Mack's message
 of "Fri, 30 Nov 2018 18:55:38 +0100")
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

> The pinctrl node does not have any children, so the #address-cells and #size-cells
> properties are not needed.
>
> Signed-off-by: Daniel Mack <daniel@zonque.org>
Applied to pxa/dt, thanks.

Cheers.

--
Robert
