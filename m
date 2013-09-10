From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 2/2] regulator: core: add support for configuring turn-on
 time through constraints
Date: Tue, 10 Sep 2013 18:44:40 +0530
Message-ID: <522F1B40.3040801@nvidia.com>
References: <1378811888-2268-1-git-send-email-ldewangan@nvidia.com> <1378811888-2268-2-git-send-email-ldewangan@nvidia.com> <20130910120922.GH29403@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130910120922.GH29403@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "rob@landley.net" <rob@landley.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>
List-Id: devicetree@vger.kernel.org

On Tuesday 10 September 2013 05:39 PM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Tue, Sep 10, 2013 at 04:48:08PM +0530, Laxman Dewangan wrote:
>
>> +- regulator-enable-time: Turn ON time for regulator(in uS)
> This is unclear - what is a "turn on time" and is this in addition to or
> separate from the underlying enable time of the device?  It needs to be
> clear that this is the time taken for the voltage to ramp to spec.  I'd
> also expect it to be clear that this is not something that should need
> to be provided normally.

Here my intention for turn-on time is the time from OFF state to ON 
state and the ON voltage settled on this time.
This time is separate from underlying enable time of the device i.e. 
will not get added.
We observe in some of platform that some of regulator is taking more 
time than time given as per datasheet.
Yes, completely agree that this is not the data provided normally, just 
we observe on scope that some of platform shows  more than the datasheet 
value and hence this patch.

The same rail on other design does not show the enable time more than 
datasheet and on that case, we will not provide this value.



> Please ALSO avoid capitalising words FOR no reason.
>
>
My bad, will take care.
