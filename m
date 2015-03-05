From: Bastien Nocera <hadess@hadess.net>
Subject: Re: [PATCH v2] input: goodix: Add device tree support
Date: Thu, 05 Mar 2015 17:32:15 +0100
Message-ID: <1425573135.7713.0.camel@hadess.net>
References: <1425457930-4481-1-git-send-email-mamlinav@gmail.com>
	 <1425572321-6564-1-git-send-email-mamlinav@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <1425572321-6564-1-git-send-email-mamlinav@gmail.com>
Sender: linux-input-owner@vger.kernel.org
To: Aleksei Mamlin <mamlinav@gmail.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
List-Id: devicetree@vger.kernel.org

On Thu, 2015-03-05 at 19:18 +0300, Aleksei Mamlin wrote:
> This patch adds device tree support and binding information for 
> Goodix GT9xx series touchscreen controller.
> It also adds support for 5-finger chips, like GT911 and GT912, which 
> can be found on ARM tablets, like Wexler TAB7200 and MSI Primo73.
> 
> Changes since v1:
> * Merge patches into single patch.

I would actually prefer two patches. The first one to use the number 
of touches from the device, the second one to add DT support.

That would also make it easier for me to test.

> * Use max touch number from config instead of hardcoding.
> * Update description in Kconfig.

Cheers
