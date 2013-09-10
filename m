From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 2/2] regulator: core: add support for configuring turn-on
 time through constraints
Date: Tue, 10 Sep 2013 09:11:13 -0600
Message-ID: <522F3691.3090805@wwwdotorg.org>
References: <1378811888-2268-1-git-send-email-ldewangan@nvidia.com> <1378811888-2268-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1378811888-2268-2-git-send-email-ldewangan@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: broonie@kernel.org, rob.herring@calxeda.com, mark.rutland@arm.com, rob@landley.net, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, lgirdwood@gmail.com
List-Id: devicetree@vger.kernel.org

On 09/10/2013 05:18 AM, Laxman Dewangan wrote:
> The Turn-ON time of the regulator depends on the regulator device's
> electrical characteristics. Sometimes regulator turn-on time also
> depends on the capacitive load on the given platform and it can be
> more than the datasheet value.
> 
> The driver provides the enable-time as per datasheet.
> 
> Add support for configure the enable time through regulator constraints
> so that regulator core can take this value for enable time for that
> regulator.

> diff --git a/Documentation/devicetree/bindings/regulator/regulator.txt b/Documentation/devicetree/bindings/regulator/regulator.txt

> +- regulator-enable-time: Turn ON time for regulator(in uS)

Bike-shedding slightly: This isn't really the time it takes to enable a
regulator, but the time the voltage takes to become stable, or settle.
Perhaps name the property regulator-settle-time/regulator-settle-delay?
