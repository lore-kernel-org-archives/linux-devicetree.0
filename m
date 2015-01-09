From: Jassi Brar <jaswinder.singh@linaro.org>
Subject: Re: [PATCH v3 5/8] gpio: Add Fujitsu MB86S7x GPIO driver
Date: Fri, 9 Jan 2015 18:50:34 +0530
Message-ID: <CAJe_ZhdBCt0tLw7oU6fv7m_sBzB=nDhGWfbBFmpMMLOKiUuWrA@mail.gmail.com>
References: <1420802369-3840-1-git-send-email-Vincent.Yang@tw.fujitsu.com>
 <1420803212-4350-1-git-send-email-Vincent.Yang@tw.fujitsu.com>
 <20150109125243.GM12302@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20150109125243.GM12302@n2100.arm.linux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, Andy Green <andy.green@linaro.org>, =?UTF-8?Q?Pawe=C5=82_Moll?= <pawel.moll@arm.com>, Arnd Bergmann <arnd@arndb.de>, Devicetree List <devicetree@vger.kernel.org>, Olof Johansson <olof@lixom.net>, Vincent Yang <vincent.yang.fujitsu@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Vincent Yang <Vincent.Yang@tw.fujitsu.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Patch Tracking <patches@linaro.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Tetsuya Nuriya <nuriya.tetsuya@jp.fujitsu.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 9 January 2015 at 18:22, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> On Fri, Jan 09, 2015 at 07:33:32PM +0800, Vincent Yang wrote:
>> +static int mb86s70_gpio_remove(struct platform_device *pdev)
>> +{
>> +     struct mb86s70_gpio_chip *gchip = platform_get_drvdata(pdev);
>> +
>> +     gpiochip_remove(&gchip->gc);
>
> This doesn't disable and unprepare the clock.
>
Will do.

Thanks,
Jassi
