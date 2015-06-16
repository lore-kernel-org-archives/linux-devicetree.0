From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V2] added device tree support to gpio-generic driver
Date: Tue, 16 Jun 2015 11:15:37 +0200
Message-ID: <CACRpkdaOQmRQFNn7z1UOxMpQpi=ZVMzWBm=YpcPP=2EXSXZHBQ@mail.gmail.com>
References: <CACRpkdbWhtkMgz2qTg1y7AguLQCJXnAoi7gVnFvPb1sR7eES_g@mail.gmail.com>
	<1434018735-10176-1-git-send-email-romain.baeriswyl@alitech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1434018735-10176-1-git-send-email-romain.baeriswyl@alitech.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Romain Baeriswyl <romain.baeriswyl@alitech.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Christian Ruppert <christian.ruppert@alitech.com>, Anton Vorontsov <cbouatmailru@gmail.com>, Rojhalat Ibrahim <imr@rtschenk.de>, abdoulaye berthe <berthe.ab@gmail.com>, Anthony Fee <anthony.fee@emutex.com>, Alexander Shiyan <shc_work@mail.ru>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 11, 2015 at 12:32 PM, Romain Baeriswyl
<romain.baeriswyl@alitech.com> wrote:

> This patch adds support of device tree to the gpio-generic driver.
>
> Signed-off-by: Romain Baeriswyl <romain.baeriswyl@alitech.com>

I notriced this patch seems to miss compilation guards.
Please make sure it still compiles for platforms without CONFIG_OF and
CONFIG_OF_GPIO.

Yours,
Linus Walleij
