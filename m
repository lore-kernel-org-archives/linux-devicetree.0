From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 2/2] regulator: core: add support for configuring turn-on
 time through constraints
Date: Tue, 10 Sep 2013 11:45:41 -0600
Message-ID: <522F5AC5.90101@wwwdotorg.org>
References: <1378811888-2268-1-git-send-email-ldewangan@nvidia.com> <1378811888-2268-2-git-send-email-ldewangan@nvidia.com> <522F3691.3090805@wwwdotorg.org> <20130910165153.GQ29403@sirena.org.uk> <522F5815.4070109@wwwdotorg.org> <20130910173830.GA4708@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20130910173830.GA4708@sirena.org.uk>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, rob.herring@calxeda.com, mark.rutland@arm.com, rob@landley.net, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, lgirdwood@gmail.com
List-Id: devicetree@vger.kernel.org

On 09/10/2013 11:38 AM, Mark Brown wrote:
> On Tue, Sep 10, 2013 at 11:34:13AM -0600, Stephen Warren wrote:
> 
>> I notice there's a regulator-ramp-delay property, already documented
>> right above this new property. Is this a conflicting usage of the same
>> term, or should that existing property just be used in this case too?
> 
> That's for a ramp between two voltages rather than the on/off voltage,
> though I had forgotten about it.  Hrm.  enable-ramp-delay?

Sounds reasonable. It's a little long but regulator-enable-ramp-delay
might be better since all the common regulator properties to date are
named regulator-xxx.
