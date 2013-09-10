From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 2/2] regulator: core: add support for configuring turn-on
 time through constraints
Date: Tue, 10 Sep 2013 11:34:13 -0600
Message-ID: <522F5815.4070109@wwwdotorg.org>
References: <1378811888-2268-1-git-send-email-ldewangan@nvidia.com> <1378811888-2268-2-git-send-email-ldewangan@nvidia.com> <522F3691.3090805@wwwdotorg.org> <20130910165153.GQ29403@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130910165153.GQ29403@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, rob.herring@calxeda.com, mark.rutland@arm.com, rob@landley.net, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, lgirdwood@gmail.com
List-Id: devicetree@vger.kernel.org

On 09/10/2013 10:51 AM, Mark Brown wrote:
> On Tue, Sep 10, 2013 at 09:11:13AM -0600, Stephen Warren wrote:
> 
>>> +- regulator-enable-time: Turn ON time for regulator(in uS)
> 
>> Bike-shedding slightly: This isn't really the time it takes to
>> enable a regulator, but the time the voltage takes to become
>> stable, or settle. Perhaps name the property
>> regulator-settle-time/regulator-settle-delay?
> 
> The normal term would be ramp delay.  It's not usually the time
> taken to completely settle, it's usually quoted as the time taken
> to reach within some proportion of the target voltage.

I notice there's a regulator-ramp-delay property, already documented
right above this new property. Is this a conflicting usage of the same
term, or should that existing property just be used in this case too?
