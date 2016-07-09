From: Baruch Siach <baruch@tkos.co.il>
Subject: Re: How do /dev/ttyS* devices get assigned from the device tree?
Date: Sat, 9 Jul 2016 22:37:31 +0300
Message-ID: <20160709193731.GA3870@tarshish>
References: <CAF_dkJBmgxyQLNtJqXWyQtzsmcK3QCqjYugsMG7MXGUdjL6nvA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAF_dkJBmgxyQLNtJqXWyQtzsmcK3QCqjYugsMG7MXGUdjL6nvA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Patrick Doyle <wpdster@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Patrick,

On Fri, Jul 08, 2016 at 12:58:06PM -0400, Patrick Doyle wrote:
> Do they show up numerically in the sequence in which they appear in
> the device tree?
> 
> Where could I learn more?

Adding devicetree ML to Cc.

You may use an "aliases" node for that, if your UART driver supports that. The 
8250/16550 driver does. See arch/arm/boot/dts/aspeed-ast2500-evb.dts, for 
example. Note though that the use of aliases for this purpose is contentious.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
