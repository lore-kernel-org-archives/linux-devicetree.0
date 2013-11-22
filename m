From: =?UTF-8?B?QWxleGFuZGVyIFNoaXlhbg==?= <shc_work@mail.ru>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2MyAzLzVdIGNoYXJnZXI6IG1heDE0NTc3OiBBZGQgY2hh?=
 =?UTF-8?B?cmdlciBzdXBwb3J0IGZvciBNYXhpbSAxNDU3Nw==?=
Date: Fri, 22 Nov 2013 12:54:36 +0400
Message-ID: <1385110476.285183224@f131.i.mail.ru>
References: <1385109972-28059-1-git-send-email-k.kozlowski@samsung.com>
 <1385109972-28059-4-git-send-email-k.kozlowski@samsung.com>
Reply-To: =?UTF-8?B?QWxleGFuZGVyIFNoaXlhbg==?= <shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1385109972-28059-4-git-send-email-k.kozlowski@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?UTF-8?B?S3J6eXN6dG9mIEtvemxvd3NraQ==?= <k.kozlowski@samsung.com>
Cc: devicetree@vger.kernel.org, =?UTF-8?B?SWFuIENhbXBiZWxs?= <ijc+devicetree@hellion.org.uk>, =?UTF-8?B?U2FtdWVsIE9ydGl6?= <sameo@linux.intel.com>, =?UTF-8?B?UGF3ZWwgTW9sbA==?= <pawel.moll@arm.com>, =?UTF-8?B?U3RlcGhlbiBXYXJyZW4=?= <swarren@wwwdotorg.org>, =?UTF-8?B?QmFydGxvbWllaiBab2xuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, =?UTF-8?B?TGVlIEpvbmVz?= <lee.jones@linaro.org>, =?UTF-8?B?TWFyayBCcm93bg==?= <broonie@kernel.org>, =?UTF-8?B?QW50b24gVm9yb250c292?= <anton@enomsg.org>, linux-doc@vger.kernel.org, =?UTF-8?B?TGlhbSBHaXJkd29vZA==?= <lgirdwood@gmail.com>, =?UTF-8?B?Um9iIEhlcnJpbmc=?= <rob.herring@calxeda.com>, linux-kernel@vger.kernel.org, =?UTF-8?B?Q2hhbndvbyBDaG9p?= <cw00.choi@samsung.com>, =?UTF-8?B?S3l1bmdtaW4gUGFyaw==?= <kyungmin.park@samsung.com>, =?UTF-8?B?TXl1bmdKb28gSGFt?= <myungjoo.ham@samsung.com>, =?UTF-8?B?Um9iIExhbmRsZXk=?= <rob@landley.net>=?UTF-8
List-Id: devicetree@vger.kernel.org

> MAX14577 chip is a multi-function device which includes MUIC, charger
> and voltage regulator. The driver is located in drivers/mfd.
> 
> This patch supports battery charging control of MAX14577 chip and
> provides power supply class information to userspace.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
...
> diff --git a/drivers/power/max14577_charger.c b/drivers/power/max14577_charger.c
...
> +static struct platform_driver max14577_charger_driver = {
> +	.driver = {
> +		.owner	= THIS_MODULE,
> +		.name	= "max14577-charger",
> +	},
> +	.probe		= max14577_charger_probe,
> +	.remove		= max14577_charger_remove,
> +};
> +
> +static int __init max14577_charger_init(void)
> +{
> +	return platform_driver_register(&max14577_charger_driver);
> +}
> +
> +static void __exit max14577_charger_exit(void)
> +{
> +	platform_driver_unregister(&max14577_charger_driver);
> +}
> +
> +module_init(max14577_charger_init);
> +module_exit(max14577_charger_exit);

Replace "module_init" & "module_exit" with module_platform_driver here.

---
