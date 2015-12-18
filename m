From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: I2C eeprom compatibles? (was Re: [PATCH/RFC 03/19] ARM: shmobile:
 gose: add i2c2 bus to device tree)
Date: Fri, 18 Dec 2015 10:06:48 +0100
Message-ID: <1839177.77Qt0RnI3v@wuerfel>
References: <1449802376-11301-1-git-send-email-horms+renesas@verge.net.au>
 <20151218030239.GB10973@verge.net.au> <20151218073531.GA1517@katana>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20151218073531.GA1517@katana>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Linux-sh list <linux-sh@vger.kernel.org>, Wolfram Sang <wsa@the-dreams.de>, Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa@sang-engineering.com>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: devicetree@vger.kernel.org

On Friday 18 December 2015 08:35:32 Wolfram Sang wrote:
> > 
> > It seems to me that we have some consensus around:
> > 
> >       compatible = "renesas,r1ex24002", "24c02";
> 
> Thinking again, "generic,24c02" or "generic-24c02" could also be an
> option.
> 
> > Should this be added to Documentation/devicetree/bindings/eeprom/eeprom.txt ?
> > Or documented elsewhere?
> 
> Probably we need a DT maintainers advice here? I don't mind vendor
> specific compatibles being documented, but I'm reluctant to add all
> these compatibles for the myriads of I2C eeproms to the at24 driver. 99%
> are covered by the generic case.
> 
> Adding DT to CC.

I'd rather use some vendor string in addition to 24c02. Isn't this originally
an Atmel part? In that case, using "atmel,24c02" as the most generic string
would be appropriate, and IIRC the i2c framework will just match that with
the "24c02" entry in the i2c_device_id list.

	Arnd
