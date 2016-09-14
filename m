From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: Re: [PATCH v1 2/3] ARM: dts: imx6q-apalis-ixora: Remove use of
 pwm-leds
Date: Wed, 14 Sep 2016 18:28:39 +0000
Message-ID: <1473877718.20131.0.camel@toradex.com>
References: <9d2c17aa2e00e6ff4349a53de8247860d2382607.1473833908.git.maitysanchayan@gmail.com>
 <6111feb57b5fbaa29eeb6ba089bb2824bbf2f8ff.1473833908.git.maitysanchayan@gmail.com>
 <5eee36b0a60c41a05ca2a161b8ef3eb7@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5eee36b0a60c41a05ca2a161b8ef3eb7@agner.ch>
Content-Language: en-US
Content-ID: <6EE56838115C0240A9A481B3A41D7665@eurprd05.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "stefan@agner.ch" <stefan@agner.ch>, "maitysanchayan@gmail.com" <maitysanchayan@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2016-09-14 at 08:58 -0700, Stefan Agner wrote:
> On 2016-09-13 23:35, Sanchayan Maity wrote:
> > 
> > Remove use of pwm-leds and use the standard /sys/class/pwm
> > interface from PWM subsystem.
> Don't we have actual leds on the Ixora?

Yes, sure, but not really PWM ones:

https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/ar
ch/arm/boot/dts/imx6q-apalis-ixora.dts?id=refs/tags/v4.8-rc6#n124
