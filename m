From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 0/2] power: Add support for TI BQ24261 charger
Date: Fri, 30 Oct 2015 10:55:31 +0900
Message-ID: <CAJKOXPeA=-+xiF4aFpMs3EQ+fvvmzqs+Q19GFuL9t7Ntgwbnpg@mail.gmail.com>
References: <1446136625-20845-1-git-send-email-ramakrishna.pallala@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1446136625-20845-1-git-send-email-ramakrishna.pallala@intel.com>
Sender: linux-pm-owner@vger.kernel.org
To: Ramakrishna Pallala <ramakrishna.pallala@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, Sebastian Reichel <sre@kernel.org>, Jenny Tc <jenny.tc@intel.com>, Andreas Dannenberg <dannenberg@ti.com>
List-Id: devicetree@vger.kernel.org

2015-10-30 1:37 GMT+09:00 Ramakrishna Pallala <ramakrishna.pallala@intel.com>:
> This patch series adds the support for TI BQ24261 charger driver.
>
> TI BQ24261 charger driver relies on extcon notifications to get the
> charger cable type and based on that it will set the charging parameters.
>
> Ramakrishna Pallala (2):
>   dt: power: Add support for BQ24261 charger
>   power: Add support for TI BQ24261 charger

I think I saw these patches before. Like one or two months ago. Now
you sent these two times. There is no changelog, no versioning. This
is confusing. What the background? History?

Best regards,
Krzysztof
