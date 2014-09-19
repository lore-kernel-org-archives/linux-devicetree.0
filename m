From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 1/1] power: Add simple gpio-restart driver
Date: Thu, 18 Sep 2014 21:35:04 -0700
Message-ID: <541BB278.9010701@roeck-us.net>
References: <1409167431-21155-1-git-send-email-davidriley@chromium.org> <1409167431-21155-2-git-send-email-davidriley@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1409167431-21155-2-git-send-email-davidriley@chromium.org>
Sender: linux-pm-owner@vger.kernel.org
To: David Riley <davidriley@chromium.org>, Sebastian Reichel <sre@kernel.org>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Anton Vorontsov <anton@enomsg.org>, Marc Carino <marc.ceeeee@gmail.com>, Anders Berg <anders.berg@lsi.com>, Laxman Dewangan <ldewangan@nvidia.com>, Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, Jamie Lentin <jm@lentin.co.uk>, Doug Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 08/27/2014 12:23 PM, David Riley wrote:
> This driver registers a restart handler to set a GPIO line high/low
> to reset a board based on devicetree bindings.
>
> Signed-off-by: David Riley <davidriley@chromium.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

