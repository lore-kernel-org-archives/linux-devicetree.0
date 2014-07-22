From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2 8/9] Documentation: devicetree: Document sclk-jpeg clock
 for exynos3250 SoC
Date: Tue, 22 Jul 2014 16:55:46 +0200
Message-ID: <53CE7B72.2030405@samsung.com>
References: <1405091990-28567-1-git-send-email-j.anaszewski@samsung.com>
 <14970063.d648TVkJj8@wuerfel> <53CE72B1.4080706@samsung.com>
 <7786783.sB22HqBgx3@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <7786783.sB22HqBgx3@wuerfel>
Sender: linux-media-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Mark Rutland <mark.rutland@arm.com>, Jacek Anaszewski <j.anaszewski@samsung.com>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "andrzej.p@samsung.com" <andrzej.p@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 22/07/14 16:44, Arnd Bergmann wrote:
> I'd vote for listing it as an optional clock independent of the compatible
> string and changing the driver to just use it when it's provided.

That sounds good to me, thanks for the suggestion.

-- 
Regards,
Sylwester
