From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 2/3] hwmon: xgene: Add hwmon driver
Date: Thu, 08 Sep 2016 16:59:08 +0200
Message-ID: <2240578.V3yYtMQl2O@wuerfel>
References: <1469134557-26869-1-git-send-email-hotran@apm.com> <8664936.LICyesLN7G@wuerfel> <6c6118cf-f9cf-d5f2-dde0-afea0143687c@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-hwmon-owner@vger.kernel.org>
In-Reply-To: <6c6118cf-f9cf-d5f2-dde0-afea0143687c@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hoan Tran <hotran@apm.com>, Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, Ashwin Chaugule <ashwin.chaugule@linaro.org>, Duc Dang <dhdang@apm.com>, lho@apm.com, linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thursday, September 8, 2016 7:55:44 AM CEST Guenter Roeck wrote:
> Maybe, but now I get
> 
> Building arm:allmodconfig ... failed
> --------------
> Error log:
> crypto/crypto_engine.c: In function 'crypto_transfer_hash_request':
> crypto/crypto_engine.c:234:3: error: implicit declaration of function 'queue_kthread_work'
> 
> Building arm64:allmodconfig ... failed
> --------------
> Error log:
> arch/arm64/kvm/../../../virt/kvm/arm/arch_timer.c: In function ‘kvm_timer_hyp_init’:
> arch/arm64/kvm/../../../virt/kvm/arm/arch_timer.c:457:1: warning: label ‘out_free’ defined but not used

Right, I sent fixes for both. I think we had a clean build yesterday,
probably tomorrow those will both be fixed.

The time between -rc5 and -rc7 seems to be the worst for build testing ;-)

	Arnd
